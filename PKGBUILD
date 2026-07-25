# Maintainer: aliu <aaronliu 0 1 3 0  gmail com>
# Contributor: wabi <aschrafl@jetnet.ch>
# Contributor: pikl <me@pikl.uk>
# Contributor: caoticofanegas
# Contributor: AlD <daniel@lbe.rs>
# Contributor: Terrence
pkgbase=immich
pkgname=('immich-server' 'immich-cli')
pkgrel=2
pkgver=3.0.3
pkgdesc='Self-hosted photos and videos backup tool'
url='https://github.com/immich-app/immich'
license=('AGPL-3.0-only')
arch=(x86_64 aarch64)
# ts-node required for CLI
makedepends=('git' 'pnpm' 'ts-node' 'mise')

# combination of server/CLI deps, see split package functions
# for individual deps and commentary

# dependencies generated from base-images repository
# https://github.com/immich-app/base-images/blob/main/server/Dockerfile
# 1.101.0-2: liborc dep found to be not required
depends=('redis' 'postgresql>=14' 'nodejs>=20'
	'vectorchord>=0.3' 'vectorchord<2'  # server/src/constants.ts
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
	'libvips>=8.18.3'
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
		'postgres-path.patch'  # replace Debian's location of postgres with Arch's
		'sh-serverhome.patch'  # tell start.sh server home's /usr/lib/immich/app/server
		'sharp.patch'  # patch sharp to use pnpm instead of npm in install script
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
b2sums=('a1e56405fa1c0e6baeec166a716c4b90af07c78e51f1961ece988e877e469ffe1e3c7da7b0406a9db2b92821d8e26e9fa82dbc2c3553903f1ed304cc182e0cf3'
        'cddeb3faa28e4ba9d8ddbc12d0b123c7bef6c5bfaa40e3c24abee2983868531c049afe4a2e3aea1c03b186c06f7b95f4d2708e8f28ac8f4ce9eb6e037b021637'
        '37d887f04462975ee280134604242b859bc8f921f82785e6b69f6a100150217b6aa22ba3446c34d7a83e5d88fcbf8cb5182e1e97c2b918bb63bc6583cfb17839'
        '5a92b4730cf9c93e1722e492ecf7dad343f0ac9330327a2351e37d996db326a926bed9808e43d99d3b46796be9cfc48dc01e0b8339c0e886aa182c2da136eb9b'
        'e69ee70889da5b4eebafe7ed98cbeda735f5f280152e238e695b4e028edb496293435a2ff1ab021e5d263cc2133bfeadb23afd2d4936e40027a2ce28e09d12ef'
        'c6071ce12cc719a6bf33d9486f54648edb62c710b216181524fef9a9fec26cf9ced6d65a3433b2af941e75b03fc4b261d5e901a7f736de29b0b98192df59fdd2'
        '8a66c540b5cea1e303602cf78ca173da226c6693ec455a060c3d8a6e9616c5bfbab590e8e8a3c8e395bce8e026107b03abfa862ff436d22db271c359a977219d'
        'e7a40359104cfd13c3563a5b988dcd9d2c132179a5e7e3eb5fe333a3667843e3c04e9eea8157b5f76a7dae18ac5736a487a2b97e2f8b30d6bdc7b2298f8b9e02'
        'bc4251222a7dfe12d43f48def608ccc08b10ca37fc1eefd08ff8e7328195384598bae2af5b3af58ae3114727efdb9ccb9f20a908c5a919973f6001c69bae627a'
        'SKIP'
        'SKIP'
        'SKIP'
        'db7a138f7414d3c2c3ad9ee0e5d8ed6443b1f065fff14b899192ae9989455acf2bf7f609b6454bc8ac7680fab4299fde3f9ed655549923a9bede13f5b6fe1059')

prepare() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	patch -p1 < "${srcdir}/postgres-path.patch"
	patch -p1 < "${srcdir}/sh-serverhome.patch"
	rm packages/cli/LICENSE  # deploy would've picked this up, duplicating standard /usr/share/licenses/spdx/AGPL-3.0-only

	# Patches to avoid calling npm in package scripts
	pnpm fetch --ignore-scripts  # First, get node_modules folder to patch into
	pnpm install --filter immich --frozen-lockfile --offline  # sometimes pnpm fetch doesn't give us the node_modules folder
	sharp_dir="$(pnpm patch sharp | sed -n '3p' | sed 's/^[[:space:]]*//')"
	(
	cd "$sharp_dir"
	patch -p1 < "${srcdir}/sharp.patch"
	)
	pnpm patch-commit "$sharp_dir"  # Second, this runs the scripts

	TIME=$(date --iso-8601=seconds | tr -d "\n")  # used to write how updated the geodata is
}

# instructions adapted from server/Dockerfile
build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	export IMMICH_BUILD="${pkgver}-arch${pkgrel}@${TIME}"  # build ID

	pnpm --filter @immich/sdk --filter @immich/plugin-sdk build

	# build server
	## add a flag to pnpm --filter immich build to make swagger plugin work
	## see https://docs.nestjs.com/openapi/cli-plugin#swc-builder
	## (immich itself is a monorepo but immich-server isn't)
	(
	cd server
	pnpm exec nest build --type-check
	)

	pnpm --filter @immich/sdk --filter @immich/plugin-sdk --filter immich build  # SHARP_IGNORE_GLOBAL_LIBVIPS=true
	pnpm --filter immich --prod --no-optional deploy output/server-pruned

	# build sdk and web
	export NODE_OPTIONS=--max-old-space-size=4096  # prevent OOM
	pnpm --filter @immich/sdk --filter immich-web install --frozen-lockfile
	pnpm --filter @immich/sdk --filter immich-web build

	# build CLI
	pnpm --filter @immich/sdk --filter @immich/cli install --frozen-lockfile
	pnpm --filter @immich/sdk --filter @immich/cli build
	pnpm --filter @immich/cli deploy --prod --no-optional output/cli-pruned

	# build plugins
	cd packages/plugin-core
	export MISE_TRUSTED_CONFIG_PATHS="${srcdir}/${pkgbase}-${pkgver}/packages/plugin-core/mise.toml:""${srcdir}/${pkgbase}-${pkgver}/mise.toml"  # needed for //: monorepo syntax
	export MISE_DISABLE_TOOLS=flutter
	mise install
	mise //:plugins
}

package_immich-server() {
	pkgdesc+=" (server and web client)"
	replaces=('immich')
	conflicts=('immich')

	backup=("etc/immich.conf")
	install=${pkgname}.install
	changelog='BREAKING CHANGELOG.md'
	optdepends=(
	'nginx: Reverse proxy'
	'immich-machine-learning: Required for features such as smart search, duplicate detection, and facial recognition'
	)

	(
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
	install -dm755 "${pkgdir}/usr/lib/immich/build/plugins/immich-plugin-core"
	cp -r packages/plugin-core/dist "${pkgdir}/usr/lib/immich/build/plugins/immich-plugin-core/dist"
	install -Dm644 packages/plugin-core/manifest.json "${pkgdir}/usr/lib/immich/build/plugins/immich-plugin-core/manifest.json"
	)

	# install reverse-geocoding data
	# https://github.com/immich-app/base-images/blob/main/server/Dockerfile
	install -dm755 "${pkgdir}/usr/lib/immich/build/geodata"
	install -Dm644 cities500.txt "${pkgdir}/usr/lib/immich/build/geodata/cities500.txt"
	install -Dm644 admin1CodesASCII.txt "${pkgdir}/usr/lib/immich/build/geodata/admin1CodesASCII.txt"
	install -Dm644 admin2Codes.txt "${pkgdir}/usr/lib/immich/build/geodata/admin2Codes.txt"
	install -Dm644 ne_10m_admin_0_countries.geojson "${pkgdir}/usr/lib/immich/build/geodata/ne_10m_admin_0_countries.geojson"
	echo "${TIME}" > "${pkgdir}/usr/lib/immich/build/geodata/geodata-date.txt"

	# install systemd service files
	install -Dm644 immich-server.service "${pkgdir}/usr/lib/systemd/system/immich-server.service"

	# install configuration files
	install -Dm644 immich.sysusers "${pkgdir}/usr/lib/sysusers.d/immich.conf"
	install -Dm644 immich.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/immich.conf"
	install -Dm644 immich.conf "${pkgdir}/etc/immich.conf"
	install -Dm644 nginx.immich.conf "${pkgdir}/usr/share/doc/immich/examples/nginx.conf"

	# we don't create a build-lock.json because if the file is empty
	# it just detects the right versions from the environment
	# see server/src/repositories/server-info.repository.ts

	# symlink to server management scripts
	install -dm755 "${pkgdir}/usr/bin"
	ln -s ../lib/immich/app/server/bin/immich-healthcheck "${pkgdir}/usr/bin/immich-healthcheck"
	cat <<-EOF > "${pkgdir}/usr/bin/immich-admin"
	#!/usr/bin/env sh
	cd /usr/lib/immich/app/server/bin/
	./start.sh immich-admin "$@"
	EOF
}

package_immich-cli() {
	pkgdesc+=" (command-line client)"
	arch=('any')
	depends=('nodejs>=20')

	cd "${srcdir}/${pkgbase}-${pkgver}/"
	install -dm755 "${pkgdir}/usr/lib/immich/cli"
	cp -rT output/cli-pruned "${pkgdir}/usr/lib/immich/cli"

	# setup symlink to allow immich command to be run from shell
	install -dm755 "${pkgdir}/usr/bin"
	ln -s ../lib/immich/cli/bin/immich "${pkgdir}/usr/bin/immich"
}
