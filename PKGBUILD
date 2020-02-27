# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=simulavr-git
pkgver=r890.a12e85f
pkgrel=2
pkgdesc="A simulator for the Atmel AVR family of microcontrollers."
url="https://github.com/Traumflug/simulavr"
arch=('x86_64' 'i686')
license=('GPL2')
source=("${pkgname}::git+https://github.com/Traumflug/simulavr#branch=traumflug"
		"gtest-flags.patch")
sha256sums=('SKIP'
            'a016162419acd85baff083d5380394da0add0b5b0297cc37ba3bddbb641b148c')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	patch -p1 -i "${srcdir}/gtest-flags.patch"
}

build() {
	cd "${srcdir}/${pkgname}"

	./bootstrap
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var #--disable-doxygen-doc --enable-dependency-tracking

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	make DESTDIR="$pkgdir" install

	install -Dm644 "doc/license.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
