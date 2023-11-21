pkgname=immich
pkgrel=2
pkgver=1.88.1
pkgdesc='Self-hosted photos and videos backup tool'
url='https://github.com/immich-app/immich'
license=('MIT')
arch=(x86_64)
makedepends=('npm' 'jq' 'python-poetry')
# dependencies generated from base-images repository
# https://github.com/immich-app/base-images/blob/main/server/Dockerfile
depends=('redis' 'postgresql' 'nodejs' 'nginx'
    'typesense'
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
    'imagemagick'
    'libraw'
)
optdepends=(
    'libva-mesa-driver: GPU acceleration'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/immich-app/immich/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}-server.service"
	"${pkgname}-microservices.service"
	"${pkgname}-web.service"
	"${pkgname}-machine-learning.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
	'immich.conf'
	'nginx.immich.conf'
        'media.util.ts.patch'
)
sha256sums=('3fe1ac4e0840fcd997cf3a7df68248039fdbe0d5a540f0414e5f3311d6670746'
            '46a7ace4f315e0a69a0da49a9a54d442baa6573092572f1e4323d1373a0cabb5'
            '08df269485ebea360dc1156409d148c959ba28040017cd02be2606c5d28be5b0'
            '64da5f28147c40a2285ed2295d85951c932d155069295a692a25995e6e56028e'
            'd20455349cdb9409adb42cdbde48c30a176d2a5337ad148c6d2227ecc523c88a'
            '01707746e8718fe169b729b7b3d9e26e870bf2dbc4d1f6cdc7ed7d3839e92c0e'
            '23894fe92e02f8d69d045ece73d68ba5122549a39c60475780a5b03bebcab3aa'
            '89819defe1108056f1bf876a6e0c1d6ecc10382a931fb832fccc132eaeaece1b'
            '00827701798731c13fbd2d37f8ffb14816bfab579c0f75d532ab119295c4148c'
            'd38cdaa031f741998f2d31504381bce4db1a8771c774a2c2bac547d7d2b3c70b')

backup=("etc/immich.conf")
options=("!strip")
install=${pkgname}.install
_installdir=/opt/immich-machine-learning
_venvdir="${_installdir}/venv"

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # required to prefer /dev/dri/renderD128 over /dev/dri/card0 for ffmpeg accel (VAAPI)
    patch -p0 -i "${srcdir}/media.util.ts.patch"
}

build() {
 
    # build web frontend
    # from: web/Dockerfile RUN npm commands
    cd "${srcdir}/${pkgname}-${pkgver}/web"
    npm ci
    npm run build
    npm prune --omit=dev

    # build server
    # from: server/Dockerfile RUN npm commands
    #   * npm link / and cache clean not required
    cd "${srcdir}/${pkgname}-${pkgver}/server"
    npm ci
    npm run build
    npm prune --omit=dev --omit=optional
        
    # build machine learning (python)
    # from: ENV and RUN commands in machine-learning/Dockerfile
    #   * later ENV commands picked up in systemd service files
    cd "${srcdir}/${pkgname}-${pkgver}/machine-learning"
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
    poetry install --sync --no-interaction --no-ansi --no-root --only main
    # delete any python bytecode 
    find "${srcdir}/venv" -type f -name "*.py[co]" -delete
    find "${srcdir}/venv" -type d -name "__pycache__" -delete
    # relocate without breaking
    sed -i "s|${srcdir}/venv|${_venvdir}|g" "${srcdir}/venv/bin/"* "${srcdir}/venv/pyvenv.cfg"
}

package() {

    cd "${srcdir}/${pkgname}-${pkgver}"
    
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
    cp -r server/assets "${pkgdir}/usr/lib/immich/app/assets"

    # install web frontend
    # from: web/Dockerfile COPY commands (entrypoint.sh not required)
    #   * setting NODE_ENV=production picked up in systemd service file
    # install -dm755 "${pkgdir}/usr/lib/immich/app/web"
    # cp -r web/node_modules "${pkgdir}/usr/lib/immich/app/web/node_modules"
    cp -r web/build "${pkgdir}/usr/lib/immich/app/server/www"
    # install -Dm644 web/package.json "${pkgdir}/usr/lib/immich/app/web/package.json"
    # install -Dm644 web/package-lock.json "${pkgdir}/usr/lib/immich/app/web/package-lock.json"

    # install machine-learning
    # from: machine-learning/Dockerfile COPY commands
    #   * setting NODE_ENV=production and others picked up in systemd service file
    install -dm755 "${pkgdir}${_installdir}"
    cp -r "${srcdir}/venv" "${pkgdir}${_installdir}"
    cp -r "machine-learning/app" "${pkgdir}${_installdir}"
    install -Dm644 "machine-learning/log_conf.json" "${pkgdir}${_installdir}/log_conf.json"
    
    cd "${srcdir}"

    # install systemd service files
    install -Dm644 immich-server.service "${pkgdir}/usr/lib/systemd/system/immich-server.service"
    install -Dm644 immich-web.service "${pkgdir}/usr/lib/systemd/system/immich-web.service"
    install -Dm644 immich-microservices.service "${pkgdir}/usr/lib/systemd/system/immich-microservices.service"
    install -Dm644 immich-machine-learning.service "${pkgdir}/usr/lib/systemd/system/immich-machine-learning.service"

    # install configuration files
    install -Dm644 immich.sysusers "${pkgdir}/usr/lib/sysusers.d/immich.conf"
    install -Dm644 immich.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/immich.conf"
    install -Dm644 immich.conf "${pkgdir}/etc/immich.conf"
    install -Dm644 nginx.immich.conf "${pkgdir}/etc/nginx/sites-available/immich.conf"
}
