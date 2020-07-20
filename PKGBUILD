# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=cdcc
pkgname=${_pkgname}-git
pkgver=v0.1.r6.g04cc09c
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/gicmo/cdcc"
license=('unknown')
makedepends=('meson')
depends=()
provides=("${_pkgname}")
conflicts=()
epoch=1
source=(
	"${_pkgname}::git+https://github.com/gicmo/cdcc.git"
	'meson.build.patch'
)
sha256sums=(
	'SKIP'
	'4b765c7fda2ee2c75e48a765f0c3f594a39bf035608c72c2094056695180d8c0'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch < ../meson.build.patch
	meson --prefix=/usr build
}

build() {
	cd "${srcdir}/${_pkgname}"
	meson compile -C build
}

check() {
	cd "${srcdir}/${_pkgname}"
	meson test -C build
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	DESTDIR="${pkgdir}" meson install
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
