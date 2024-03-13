# Maintainer: wabi <aschrafl@jetnet.ch>
# Maintainer: pikl <me@pikl.uk>
pkgbase=immich
pkgname=('immich-server' 'immich-cli')
pkgrel=4
pkgver=1.98.2
pkgdesc='Self-hosted photos and videos backup tool'
url='https://github.com/immich-app/immich'
license=('MIT')
arch=(x86_64)
# ts-node required for CLI
makedepends=('npm' 'jq' 'python-poetry' 'ts-node')
# combination of server/CLI deps, see split package functions
# for individual deps and commentary
depends=('redis' 'postgresql' 'nodejs'
    'pgvecto.rs=0.2.0' 'zlib' 'glib2' 'expat' 'librsvg' 'libexif'
    'libwebp' 'orc' 'libjpeg-turbo' 'libgsf' 'libpng'
    'libjxl' 'libheif' 'lcms2' 'mimalloc' 'openjpeg2'
    'openexr' 'liblqr' 'libtool' 'ffmpeg'
    'libvips>=8.14.3' 'openslide' 'poppler-glib' 'imagemagick'
    'libraw' 'perl-net-ssleay' 'perl-io-socket-ssl' 'perl-capture-tiny'
    'perl-file-which' 'perl-file-chdir' 'perl-pkgconfig'
    'perl-ffi-checklib' 'perl-test-warnings' 'perl-test-fatal'
    'perl-test-needs' 'perl-test2-suite' 'perl-sort-versions'
    'perl-path-tiny' 'perl-try-tiny' 'perl-term-table'
    'perl-uri' 'perl-mojolicious' 'perl-file-slurper'
)
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/immich-app/immich/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgbase}-server.service"
	"${pkgbase}-microservices.service"
	"${pkgbase}-machine-learning.service"
	"${pkgbase}.sysusers"
	"${pkgbase}.tmpfiles"
	'immich.conf'
	'nginx.immich.conf'
        'media.util.ts.patch'
        # TODO at the moment, the latest version at install will be taken 
        # mirroring approach in docker base-image, however should we implement 
        # a simple service to keep these up-to-date since they appear to be
        # generated daily?
        'https://download.geonames.org/export/dump/cities500.zip'
        'https://download.geonames.org/export/dump/admin1CodesASCII.txt'
        'https://download.geonames.org/export/dump/admin2Codes.txt')
sha256sums=('3fd79057b41a235518dde50ce62a2314758329c20360f462f77bba949f35d306'
            '0a9d7fffe3c301190cc8581ee7e11417eb0661937a2c03d76c8b8bc39710205b'
            'dc1a3d7baf2ec4f00a4a80f88a1f28dc1092eb7a08195544cc37b6532777f5d7'
            'd20455349cdb9409adb42cdbde48c30a176d2a5337ad148c6d2227ecc523c88a'
            '01707746e8718fe169b729b7b3d9e26e870bf2dbc4d1f6cdc7ed7d3839e92c0e'
            '4ae8a73ccbef568b7841dbdfe9b9d8a76fa78db00051317b6313a6a50a66c900'
            '15c00108d970691a72397eab19ee784bbd24eae941307bb676ebf2f25d36057c'
            'cc405c774e34cd161f00ccd882e66c2d2ce28405964bf62472ebc3f59d642060'
            'f1b2d41a238515e842faa0a48143c263dcde76556974d9e26f28fa9a7091a2e6'
            'SKIP'
            'SKIP'
            'SKIP')
_installdir=/opt/immich-machine-learning
_venvdir="${_installdir}/venv"

prepare() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    # required to prefer /dev/dri/renderD128 over /dev/dri/card0 for ffmpeg accel (VAAPI)
    patch -p0 -i "${srcdir}/media.util.ts.patch"
}

build() {
 
    # build server
    # from: server/Dockerfile RUN npm commands
    #   * npm link / and cache clean not required
    cd "${srcdir}/${pkgbase}-${pkgver}/server"
    npm ci
    npm run build
    tmpdir=$(mktemp -d)
    cp -r node_modules/@img "${tmpdir}"
    rm -rf "${tmpdir}/@img/sharp-libvips"*
    rm -rf "${tmpdir}/@img/sharp-linuxmusl-x64"
    npm prune --omit=dev --omit=optional
    mkdir -p node_modules/@img
    mv "${tmpdir}/@img/"* node_modules/@img
    rm -rf "${tmpdir}"

    # web build
    cd "${srcdir}/${pkgbase}-${pkgver}/open-api/typescript-sdk"
    npm ci
    npm run build

    # build web frontend
    # from: web/Dockerfile RUN npm commands
    cd "${srcdir}/${pkgbase}-${pkgver}/web"
    npm ci
    npm run build
    # npm prune --omit=dev

    # build machine learning (python)
    # from: ENV and RUN commands in machine-learning/Dockerfile
    #   * later ENV commands picked up in systemd service files
    cd "${srcdir}/${pkgbase}-${pkgver}/machine-learning"
    sed -i 's|cache_folder: str = ".*"|cache_folder: str = "/var/lib/immich/.cache"|' app/config.py
    # pip install of poetry not required because poetry is a makedep
    export PYTHONDONTWRITEBYTECODE=1
    export PYTHONUNBUFFERED=1
    export PIP_NO_CACHE_DIR=true
    poetry config installer.max-workers 10
    poetry config virtualenvs.create false
    python -m venv "${srcdir}/venv"
    export VIRTUAL_ENV="${srcdir}/venv"
    export PATH="${srcdir}/venv/bin:${PATH}"
    poetry install --sync --no-interaction --no-ansi --no-root --with cpu --without dev
    # delete any python bytecode 
    find "${srcdir}/venv" -type f -name "*.py[co]" -delete
    find "${srcdir}/venv" -type d -name "__pycache__" -delete
    # relocate without breaking
    sed -i "s|${srcdir}/venv|${_venvdir}|g" "${srcdir}/venv/bin/"* "${srcdir}/venv/pyvenv.cfg"

    # build CLI
    cd "${srcdir}/${pkgbase}-${pkgver}/cli"
    npm ci
    npm run build
}

package_immich-server() {

    replaces=('immich')
    conflicts=('immich')

    # dependencies generated from base-images repository
    # https://github.com/immich-app/base-images/blob/main/server/Dockerfile
    depends=('redis' 'postgresql' 'nodejs'
        'pgvecto.rs=0.2.0'  # aur
        'zlib'
        'glib2'
        'expat'
        'librsvg'
        'libexif'
        'libwebp'
        'orc'
        'libjpeg-turbo'
        'libgsf'
        'libpng'
        'libjxl'
        'libheif'
        'lcms2'
        'mimalloc'
        'openjpeg2'
        'openexr'
        'liblqr'
        'libtool'
        'ffmpeg'
        # need to ensure this matches sharp depend version
        # because otherwise a local copy will be built
        # breaking heif conversion
        'libvips>=8.14.3'
        'openslide'
        'poppler-glib'
        'imagemagick'
        'libraw'
        # new perl deps introduced at v1.89.0
        'perl-net-ssleay'
        'perl-io-socket-ssl'
        'perl-capture-tiny'
        'perl-file-which'
        'perl-file-chdir'
        'perl-pkgconfig'  # other potential - libpkgconf
        'perl-ffi-checklib'
        'perl-test-warnings'
        'perl-test-fatal'
        'perl-test-needs'
        'perl-test2-suite'
        'perl-sort-versions'
        'perl-path-tiny'  # other potential - perl-file-path-tiny
        'perl-try-tiny'
        'perl-term-table'
        'perl-uri'  # good enough for libany-uri-escape-perl?
        'perl-mojolicious'  # aur
        'perl-file-slurper'
    )
    backup=("etc/immich.conf")
    options=("!strip")
    install=${pkgname}.install
    optdepends=(
        'libva-mesa-driver: GPU acceleration'
        'nginx: reverse proxy'
    )

    cd "${srcdir}/${pkgbase}-${pkgver}"
    
    # install server
    # from: server/Dockerfile COPY commands after build
    #   * start*.sh not required
    #   * setting NODE_ENV=production picked up in systemd service file
    install -dm755 "${pkgdir}/usr/lib/immich/app/server"
    cp -r server/node_modules "${pkgdir}/usr/lib/immich/app/server/node_modules"
    cp -r server/dist "${pkgdir}/usr/lib/immich/app/server/dist"
    cp -r server/bin "${pkgdir}/usr/lib/immich/app/server/bin"
    install -Dm644 server/package.json "${pkgdir}/usr/lib/immich/app/server/package.json"
    install -Dm644 server/package-lock.json "${pkgdir}/usr/lib/immich/app/server/package-lock.json"
    install -Dm644 LICENSE "${pkgdir}/usr/lib/immich/app/LICENSE"
    cp -r server/resources "${pkgdir}/usr/lib/immich/app/server/resources"
    cp -r web/build "${pkgdir}/usr/lib/immich/app/server/www"

    # install machine-learning
    # from: machine-learning/Dockerfile COPY commands
    #   * setting NODE_ENV=production and others picked up in systemd service file
    install -dm755 "${pkgdir}${_installdir}"
    cp -r "${srcdir}/venv" "${pkgdir}${_installdir}"
    cp -r "machine-learning/app" "${pkgdir}${_installdir}"
    cp -r "machine-learning/ann" "${pkgdir}${_installdir}"
    install -Dm644 "machine-learning/log_conf.json" "${pkgdir}${_installdir}/log_conf.json"

    cd "${srcdir}"
    
    # install reverse-geocoding data
    # https://github.com/immich-app/base-images/blob/main/server/Dockerfile
    install -dm750 "${pkgdir}/var/lib/immich-revgeo"
    install -Dm640 cities500.txt "${pkgdir}/var/lib/immich-revgeo/cities500.txt"
    install -Dm640 admin1CodesASCII.txt "${pkgdir}/var/lib/immich-revgeo/admin1CodesASCII.txt"
    install -Dm640 admin2Codes.txt "${pkgdir}/var/lib/immich-revgeo/admin2Codes.txt"
    date --iso-8601=seconds | tr -d "\n" > "${pkgdir}/var/lib/immich-revgeo/geodata-date.txt"

    # install systemd service files
    install -Dm644 immich-server.service "${pkgdir}/usr/lib/systemd/system/immich-server.service"
    install -Dm644 immich-microservices.service "${pkgdir}/usr/lib/systemd/system/immich-microservices.service"
    install -Dm644 immich-machine-learning.service "${pkgdir}/usr/lib/systemd/system/immich-machine-learning.service"

    # install configuration files
    install -Dm644 immich.sysusers "${pkgdir}/usr/lib/sysusers.d/immich.conf"
    install -Dm644 immich.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/immich.conf"
    install -Dm644 immich.conf "${pkgdir}/etc/immich.conf"
    install -Dm644 nginx.immich.conf "${pkgdir}/etc/nginx/sites-available/immich.conf"
}

package_immich-cli() {
    depends=('nodejs')

    cd "${srcdir}/${pkgbase}-${pkgver}/cli"
    install -dm755 "${pkgdir}/usr/lib/immich/cli"
    cp -r node_modules "${pkgdir}/usr/lib/immich/cli/node_modules"
    cp -r dist "${pkgdir}/usr/lib/immich/cli/dist"
    cp -r LICENSE "${pkgdir}/usr/lib/immich/cli/LICENSE"

    # setup symlink to allow immich command to be run from shell
    chmod +x "${pkgdir}/usr/lib/immich/cli/dist/index.js"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s ../lib/immich/cli/dist/index.js "${pkgdir}/usr/bin/immich"
}
