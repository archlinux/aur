# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=cdcc
pkgname=${_pkgname}-git
pkgver=v0.1.r6.g04cc09c
pkgrel=6
pkgdesc="Compile flags database generating compiler wrapper."
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
	'554bee50f3f3dd3d9300c2488e8cb29c92154e3e8480e888504614fcdd48c24f'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch < ../meson.build.patch
	meson setup build --prefix=/usr
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

	for CC in 'g++' 'gcc' 'clang' 'clang++'; do
		ln -s "${pkgdir}/usr/bin/cdcc-cc" "${pkgdir}/usr/bin/cdcc-${CC}"
	done
}
