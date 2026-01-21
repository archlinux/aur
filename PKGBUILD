# Maintainer: aliu <aaronliu 0 1 3 0  gmail com>
# Contributor: wabi <aschrafl@jetnet.ch>
# Contributor: pikl <me@pikl.uk>
# Contributor: caoticofanegas
# Contributor: AlD <daniel@lbe.rs>
# Contributor: Terrence
pkgbase=immich
pkgname=('immich-server' 'immich-cli')
pkgrel=2
pkgver=2.4.1
pkgdesc='Self-hosted photos and videos backup tool'
url='https://github.com/immich-app/immich'
license=('AGPL-3.0-only')
arch=(x86_64)
# ts-node required for CLI
makedepends=('git' 'pnpm' 'jq' 'ts-node' 'mise')

# combination of server/CLI deps, see split package functions
# for individual deps and commentary

# dependencies generated from base-images repository
# https://github.com/immich-app/base-images/blob/main/server/Dockerfile
# 1.101.0-2: liborc dep found to be not required
depends=('valkey' 'postgresql>=14' 'nodejs>=20'
	'vectorchord>=0.3' #'vectorchord<1'  # server/src/constants.ts
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
	'libvips>=8.17.3'
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
		"postgres-path.patch"   # replace Debian's location of postgres with Arch's
		"sharp.patch"  # patch sharp to use pnpm instead of npm in install script
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
sha256sums=('885cf36509f79fa1ed7541236b671d7eae900c80145920299be922a45a086fc5'
	'00ae69ddab320aaf4e426f8372f22415c6486968f006fd12b9bd8cdeca8a8664'
	'e56fe5f8abb55f93117cd8b5e1214d06a21a9f8e0458607040c5c5e364b0a164'
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
	patch -p1 < ${srcdir}/postgres-path.patch
	rm cli/LICENSE  # deploy would've picked this up, duplicating standard /usr/share/licenses/spdx/AGPL-3.0-only

	# Patches to avoid calling npm in package scripts
	pnpm fetch --ignore-scripts  # First, get node_modules folder to patch into
	pnpm install --filter immich --frozen-lockfile --offline  # sometimes pnpm fetch doesn't give us the node_modules folder
	sharp_dir="$(pnpm patch sharp | sed -n '3p' | sed 's/^[[:space:]]*//')"
	cd "$sharp_dir"
	patch -p1 < ${srcdir}/sharp.patch
	cd "$srcdir/${pkgbase}-${pkgver}"
	pnpm patch-commit "$sharp_dir"  # Second, this runs the scripts

	cd web
	pnpm add 'three@^0.179.0'  # otherwise vite rollup fails to resolve this transitive dependency for photo-sphere-viewer

	cd server
	rm ../mise.toml  # otherwise asks to trust in mise build steps, interrupting unattended builds
}

# instructions adapted from relevant Dockerfile-s
build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	# build server
	## add a flag to pnpm --filter immich build to make swagger plugin work
	## see https://docs.nestjs.com/openapi/cli-plugin#swc-builder
	## (immich itself is a monorepo but immich-server isn't)
	cd server
	pnpm exec nest build --type-check

	cd ../
	SHARP_IGNORE_GLOBAL_LIBVIPS=true pnpm --filter immich --frozen-lockfile build
	pnpm --filter immich --frozen-lockfile --prod --no-optional deploy output/server-pruned

	# build sdk and web
	export NODE_OPTIONS=--max-old-space-size=4096  # prevent OOM
	pnpm --filter @immich/sdk --filter immich-web --frozen-lockfile install
	pnpm --filter @immich/sdk --filter immich-web build

	# build CLI
	pnpm install --filter @immich/cli --frozen-lockfile
	pnpm --filter @immich/cli build
	pnpm --filter @immich/cli --prod --no-optional deploy output/cli-pruned

	# build plugins
	cd plugins
	export MISE_TRUSTED_CONFIG_PATHS="${srcdir}/${pkgbase}-${pkgver}/plugins/mise.toml"
	mise install  # --cd plugins just does the cd for you
	mise run build
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

	# install web
	install -dm755 "${pkgdir}/usr/lib/immich/build"
	cp -r web/build "${pkgdir}/usr/lib/immich/build/www"

	# install plugins
	install -dm755 "${pkgdir}/usr/lib/immich/build/corePlugin"
	cp -r plugins/dist "${pkgdir}/usr/lib/immich/build/corePlugin/dist"
	install -Dm644 plugins/manifest.json "${pkgdir}/usr/lib/immich/build/corePlugin/manifest.json"

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

	# create empty lock file
	# usually used to determine versions at server/src/repositories/server-info.repository.ts,
	# but it will not reflect the arch installed versions, and if the file is empty
	# it just detects the right versions from the environment
	# echo '{}' > "${pkgdir}/usr/lib/immich/build/build-lock.json"

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
