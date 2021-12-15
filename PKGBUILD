# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=gaphor
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=2.7.1.r149.g5eca0b98
pkgrel=1
pkgdesc="Simple and easy to use modeling tool for UML using GTK3"
arch=('x86_64' 'i686')
url="https://github.com/gaphor/${_name}"
license=('Apache')
source=(
	"${_pkgname}::git+${url}.git#branch=master"
)
md5sums=('SKIP')
depends=(
	'gtk3'
	'gtksourceview4'
	'python-gaphas'
	'python-generic'
	'python-jedi'
	'python-tinycss2'
	'python-typing_extensions'
)
makedepends=(
	'git'
	'python-pip'
	'gendesk'
)
optdepends=(
)
provides=(
	"${_pkgname}"
)
conflicts=(
	"${_pkgname}"
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	gendesk -f --pkgname="$_name" --pkgdesc="$pkgdesc" --categories=Development PKGBUILD
}

package() {
	cd "${srcdir}/${_pkgname}"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location .
	rm "${pkgdir}"/usr/lib/python*/site-packages/gaphor-*.dist-info/direct_url.json
	install -Dm644 "$srcdir/${_name}.desktop" -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir/${_pkgname}/logos/org.gaphor.Gaphor.svg" "$pkgdir"/usr/share/pixmaps/org.gaphor.Gaphor.svg
}

# vim: ft=PKGBUILD
