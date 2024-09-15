# Maintainer: Zosoled <zosoled@codecow.xyz>

_pkgname=greenlight
pkgname=${_pkgname}-git
_author=unknownskl
pkgver=v2.3.1.r28.64bfd99
pkgrel=1
pkgdesc='Client for xCloud and Xbox home streaming.'

arch=(x86_64)
url=https://github.com/${_author}/${_pkgname}
license=(MIT)
depends=(nodejs)
makedepends=(git yarn libxcrypt-compat)
provides=(${_pkgname}=${pkgver})
conflicts=(${_pkgname})

source=(
	${_pkgname}::git+${url}.git
	LICENSE::https://raw.githubusercontent.com/${_author}/${_pkgname}/main-v2/LICENSE
)

sha512sums=(
	'SKIP'
	'7462e619774282261613b33196fbfd4840087a7e1b863cc039e217cea289bea7a3d0c1100c32e16168494ae3873b4c6ea2aacd6d62790450b12b39dba39039ae'
)

pkgver() {
	cd "${srcdir}"/${_pkgname}
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${srcdir}"/${_pkgname}
	git submodule update --init --recursive
	sed -i -e 's/- "AppImage"/# - "AppImage"/;s/- "deb"/# - "deb"/' electron-builder.yml
	sed -i -e "s/Icon=.*/Icon=${_pkgname}/;s/run.sh/${_pkgname}/" flatpak/io.github.unknownskl.greenlight.desktop
}

build() {
	cd "${srcdir}"/${_pkgname}
	yarn
	yarn build
}

package() {
	install -dm755 "${pkgdir}"/usr/lib/${_pkgname}
	cp -r "${srcdir}"/${_pkgname}/dist/linux-unpacked/* "${pkgdir}"/usr/lib/${_pkgname}

	install -dm755 "${pkgdir}"/usr/bin
	ln -s /usr/lib/${_pkgname}/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}

	install -Dm644 -t "${pkgdir}"/usr/share/licenses/${_pkgname} LICENSE
	install -Dm644 "${srcdir}"/${_pkgname}/flatpak/io.github.unknownskl.greenlight.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png
	install -Dm644 "${srcdir}"/${_pkgname}/flatpak/io.github.unknownskl.greenlight.desktop "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
}
