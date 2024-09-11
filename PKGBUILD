# Maintainer: Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=openbabel2
pkgver=2.4.1
pkgrel=2
pkgdesc="A library designed to interconvert between many file formats used in molecular modeling and computational chemistry (libs only)"
arch=('x86_64')
url="https://openbabel.org/"
license=('GPL-2.0-only')
depends=(
	'cairo'
	'gcc-libs'
	'glibc'
	'libxml2'
	'openbabel'
	'python'
	'zlib'
)
makedepends=(
	'cmake'
	'eigen'
	'python-setuptools'
	'wxwidgets-gtk3'
)
source=("https://downloads.sourceforge.net/${pkgname%2}/${pkgname%2}-${pkgver}.tar.gz")
md5sums=('d9defcd7830b0592fece4fe54a137b99')

prepare() {
	patch "$srcdir/${pkgname%2}-$pkgver/include/openbabel/obutil.h" ../include-openbabel-obutil-ctime.patch
	patch "$srcdir/${pkgname%2}-$pkgver/test/testpdbformat.py" ../test-testpdbformat.patch
}

build() {
	cmake -B build -S "${pkgname%2}-$pkgver" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure --stop-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	rm -rf "${pkgdir:?}/usr/bin"
	rm -rf "${pkgdir}/usr/include/inchi"
	rm -rf "${pkgdir}/usr/lib/libinchi.so"
	rm -rf "${pkgdir}/usr/lib/libinchi.so.0"
	rm -rf "${pkgdir}/usr/lib/libinchi.so.0.4.1"
	rm -rf "${pkgdir}/usr/lib/libopenbabel.so"
	rm -rf "${pkgdir}/usr/share/man"
}
