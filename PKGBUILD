# Maintainer: aliu <aaronliu 0 1 3 0  gmail com>
# Contributor: wabi <aschrafl@jetnet.ch>
# Contributor: pikl <me@pikl.uk>
# Contributor: caoticofanegas
pkgbase=immich
pkgname=('immich-server' 'immich-cli')
pkgrel=1
pkgver=2.1.0
pkgdesc='Self-hosted photos and videos backup tool'
url='https://github.com/immich-app/immich'
license=('AGPL-3.0-only')
arch=(x86_64)
# ts-node required for CLI
makedepends=('git' 'pnpm' 'jq' 'ts-node')

# combination of server/CLI deps, see split package functions
# for individual deps and commentary

# PYTHON V3.12 REQUIRED
#   Current incompatibility with arch base version of python (3.13)
#   so depend on python312. Cannot use python=3.12 since the AUR
#   package does not contain a provides=.
# dependencies generated from base-images repository
# https://github.com/immich-app/base-images/blob/main/server/Dockerfile
# 1.101.0-2: liborc dep found to be not required
depends=('valkey' 'postgresql>=14' 'nodejs>=20'
    'vectorchord>=0.3' 'vectorchord<0.5'  # server/src/constants.ts
    'zlib'
    'glib2'
    'expat'
    'librsvg'
    'libexif'
    'libwebp'
    'libjpeg-turbo'
    'libgsf'
    'libpng'
    'libheif'
    'lcms2'
    'mimalloc'
    'openjpeg2'
    'openexr>=3.4.0'  # sharp refuses to start rn w/ lower version; not sure where this version's from
    'liblqr'
    'libtool'
    'jellyfin-ffmpeg'  # maintainer advice 28/10/24
    # need to ensure this matches sharp depend version
    # because otherwise a local copy will be built
    # breaking heif conversion
    'libvips>=8.17.1'
    'openslide'
    'poppler-glib'
    'imagemagick'
    'libraw'
    # added v1.108
    'libde265'
    'dav1d'
    # added v1.118
    'brotli'
    'perl-io-compress-brotli'
    # added v1.120.2
    'highway'
)
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/immich-app/immich/archive/refs/tags/v${pkgver}.tar.gz"
		"backup.service.ts.patch"
        "base-images::git+https://github.com/immich-app/base-images"
        "${pkgbase}-server.service"
        "${pkgbase}.sysusers"
        "${pkgbase}.tmpfiles"
        'immich.conf'
        'nginx.immich.conf'
        # TODO at the moment, the latest version at install will be taken
        # mirroring approach in docker base-image, however should we implement
        # a simple service to keep these up-to-date since they appear to be
        # generated daily?
        'https://download.geonames.org/export/dump/cities500.zip'
        'https://download.geonames.org/export/dump/admin1CodesASCII.txt'
        'https://download.geonames.org/export/dump/admin2Codes.txt'
        'https://raw.githubusercontent.com/nvkelso/natural-earth-vector/v5.1.2/geojson/ne_10m_admin_0_countries.geojson')
sha256sums=('acc20b8d4cc2b9024f934bd74f9a544493ea13b3bd0a8039ddd70677a5fb071c'
            '475291c45ec0a20b52f7ff927ddd7299f6f9e848e01145817066ff194cd50f07'
            'SKIP'
            'f7821053ceb6f0cf3a2b9a53b7795a7c56a74d3e0239ac38fa734642e9faf833'
            '01707746e8718fe169b729b7b3d9e26e870bf2dbc4d1f6cdc7ed7d3839e92c0e'
            '4ae8a73ccbef568b7841dbdfe9b9d8a76fa78db00051317b6313a6a50a66c900'
            '077b85d692df4625300a785eed1efdc7af8fbb8e05dfa8c7d8b4053c1eb76a58'
            '614b56dba38f9201d8a391d0f3d2cdf5571935a1ea6c5d19a74a942f18411763'
            'SKIP'
            'SKIP'
            'SKIP'
            '239eec57ac17f100a11e2536cffc56752c318b50ae765b0918ff7aab4ce8f255')

prepare() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    patch -p1 < ${srcdir}/backup.service.ts.patch  # replace Debian's location of postgres with Arch's
    imgdate=$(grep ^'FROM ghcr.io/immich-app/base-server-prod' server/Dockerfile | cut -d: -f2 | cut -d@ -f1)

    cd "${srcdir}/base-images"
    git checkout "$imgdate"
}

# instructions adapted from relevant Dockerfile-s
build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	make clean
	for dir in machine-learning/.venv/ output/
	do
		if [ -d "$dir" ]; then rm -r "$dir"; fi
	done
    pnpm fetch

	# build server
	pnpm install --filter immich --frozen-lockfile --offline  # node-modules folders are missing without this

	## add a flag to pnpm --filter immich build to make swagger plugin work
	## see https://docs.nestjs.com/openapi/cli-plugin#swc-builder
	## (immich itself is a monorepo but immich-server isn't)
	cd server
    SHARP_IGNORE_GLOBAL_LIBVIPS=true pnpm exec nest build --type-check

	cd -
    pnpm --filter immich --frozen-lockfile build

    SHARP_FORCE_GLOBAL_LIBVIPS=true pnpm --filter immich --frozen-lockfile --prod --no-optional deploy output/server-pruned

	# build sdk and web
	SHARP_IGNORE_GLOBAL_LIBVIPS=true pnpm --filter @immich/sdk --filter immich-web --frozen-lockfile --force install
    pnpm --filter @immich/sdk --filter immich-web build

    # build CLI
    pnpm install --filter @immich/cli --frozen-lockfile
    rm cli/LICENSE  # deploy would've picked this up, duplicating standard /usr/share/licenses/spdx/AGPL-3.0-only
    pnpm --filter @immich/cli --prod --no-optional deploy output/cli-pruned
}

package_immich-server() {
    replaces=('immich')
    conflicts=('immich')

    backup=("etc/immich.conf")
    install=${pkgname}.install
    changelog='BREAKING CHANGELOG.md'
    optdepends=(
        'nginx: Reverse proxy'
        'immich-machine-learning: Required for features such as smart search, duplicate detection, and facial recognition'
    )

    cd "${srcdir}/${pkgbase}-${pkgver}"

    # install server
    # from: server/Dockerfile COPY commands after build
    #   * start*.sh not required
    #   * setting NODE_ENV=production picked up in systemd service file
    install -dm755 "${pkgdir}/usr/lib/immich/app/server"
    cp -rT output/server-pruned "${pkgdir}/usr/lib/immich/app/server"

    # install www
    install -dm755 "${pkgdir}/usr/lib/immich/build"
    cp -r web/build "${pkgdir}/usr/lib/immich/build/www"

    cd "${srcdir}"

    # install reverse-geocoding data
    # https://github.com/immich-app/base-images/blob/main/server/Dockerfile
    install -dm755 "${pkgdir}/usr/lib/immich/build/geodata"
    install -Dm644 cities500.txt "${pkgdir}/usr/lib/immich/build/geodata/cities500.txt"
    install -Dm644 admin1CodesASCII.txt "${pkgdir}/usr/lib/immich/build/geodata/admin1CodesASCII.txt"
    install -Dm644 admin2Codes.txt "${pkgdir}/usr/lib/immich/build/geodata/admin2Codes.txt"
    install -Dm644 ne_10m_admin_0_countries.geojson "${pkgdir}/usr/lib/immich/build/geodata/ne_10m_admin_0_countries.geojson"
    date --iso-8601=seconds | tr -d "\n" > "${pkgdir}/usr/lib/immich/build/geodata/geodata-date.txt"

    # install systemd service files
    install -Dm644 immich-server.service "${pkgdir}/usr/lib/systemd/system/immich-server.service"

    # install configuration files
    install -Dm644 immich.sysusers "${pkgdir}/usr/lib/sysusers.d/immich.conf"
    install -Dm644 immich.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/immich.conf"
    install -Dm644 immich.conf "${pkgdir}/etc/immich.conf"
    install -Dm644 nginx.immich.conf "${pkgdir}/usr/share/doc/immich/examples/nginx.conf"

    # generate lock file (from base-images)
    # TODO this lock file is used to determine versions for ffmpeg, libheif and others
    # it will not reflect the arch installed versions but only other option is to have
    # it generated dynamically on server start - do we need to do this?
    cd "${srcdir}/base-images/server"
    jq -s '.' packages/*.json > /tmp/packages.json
    jq -s '.' sources/*.json > /tmp/sources.json
    jq -n --slurpfile sources /tmp/sources.json --slurpfile packages /tmp/packages.json \
    	'{sources: $sources[0], packages: $packages[0]}' \
     	> "${pkgdir}/usr/lib/immich/build/build-lock.json" && \
      	chmod 644 "${pkgdir}/usr/lib/immich/build/build-lock.json"

    # install server management scripts; immich-admin doesn't work
    install -Dm755 "${pkgdir}/usr/lib/immich/app/server/bin/immich-healthcheck" "${pkgdir}/usr/bin/immich-healthcheck"
}

package_immich-cli() {
    depends=('nodejs>=20')

    cd "${srcdir}/${pkgbase}-${pkgver}/"
    install -dm755 "${pkgdir}/usr/lib/immich/cli"
    cp -rT output/cli-pruned "${pkgdir}/usr/lib/immich/cli"

    # setup symlink to allow immich command to be run from shell
    install -dm755 "${pkgdir}/usr/bin"
    ln -s ../lib/immich/cli/bin/immich "${pkgdir}/usr/bin/immich"
}
