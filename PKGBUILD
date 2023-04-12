# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Fuad Saud <fuadfsaud@gmail.com>

_electron=electron
pkgname=pocket-casts-linux
pkgver=1.4.0
_commit=3445a77e537ddc82e2f87ebaee037acb30812a79
provides=('pocket-casts')
pkgrel=1
pkgdesc="Electron wrapper around the Pocket Casts web app with support for MPRIS (media controls)"
arch=('x86_64')
license=('MIT')
url="https://github.com/fuadsaud/pocket-casts-linux"
depends=("${_electron}" 'sh')
makedepends=('git' 'nodejs' 'yarn' 'python')
source=("${pkgname}::git+${url}.git#commit=${_commit}"
        "${pkgname}.sh"
        "${pkgname}.desktop")
md5sums=('SKIP'
         '303f5119008d56097134fa314c6af06c'
         '7afa28814823fc89323c6f417dc62070')

prepare() {
	cd "${srcdir}/${pkgname}"
	export npm_config_cache="${srcdir}/npm_cache"
	export npm_config_build_from_source=true
	export YARN_CACHE_FOLDER="${srcdir}/npm_cache"
	export NODE_ENV=production
	sed -Ei '/"electron": /d' package.json
	yarn upgrade --ignore-scripts # --ignore-scripts mpris-service # abstract-socket
	yarn upgrade --latest electron-builder # --ignore-scripts mpris-service # abstract-socket
}

build() {
	cd "${srcdir}/${pkgname}"

	export npm_config_cache="${srcdir}/npm_cache"
	export npm_config_build_from_source=true
	export YARN_CACHE_FOLDER="${srcdir}/npm_cache"
	export NODE_ENV=production

	local electronDist="/usr/lib/${_electron}"
	local electronVer="$(<"${electronDist}/version")"
	case "$CARCH" in
		i686) _electron_builder_arch=ia32;;
		x86_64) _electron_builder_arch=x64;;
		armv7h) _electron_builder_arch=armv7l;;
		aarch64) _electron_builder_arch=arm64;;
		*) echo "unrecognized architecture: $CARCH" >&2; exit 1;;
	esac

	yarn exec -- electron-builder build \
		--dir \
		-c.electronDist="${electronDist}" \
		-c.electronVersion="${electronVer}"
}

package() {
	cd "${srcdir}/${pkgname}"
	install -vDm644 -t "${pkgdir}/usr/lib/${pkgname}" dist/linux-unpacked/resources/app.asar
	cp -vr -t "${pkgdir}/usr/lib/${pkgname}" dist/linux-unpacked/resources/app.asar.unpacked

	for i in 16 32 48 64 96 128 256 512; do
		install -vDm644 resources/icon/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
	done
	install -vDm644 resources/icon/src.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

	install -vDm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	install -vDm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/pocket-casts"
	sed -i "s/@ELECTRON@/${_electron}/" "${pkgdir}/usr/bin/pocket-casts"
}
