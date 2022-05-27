# Maintainer: Bruno Bollos Correa <bollos@outlook.com.br>
# Contributor: Cheng Fei Phung <feiphung@hotmail.com>

pkgname=xyce-serial
pkgver=7.5.0
pkgrel=1
pkgdesc="The Xyce Parallel Electronic Simulator is a SPICE-compatible circuit simulator"
arch=('x86_64')
url="https://github.com/Xyce/Xyce"
license=('GPL3')
depends=('fftw' 'trilinos-xyce-serial')
makedepends=('gcc-fortran' 'cmake')
provides=('xyce')
conflicts=('xyce')
source=("https://github.com/Xyce/Xyce/archive/Release-"$pkgver".tar.gz")
sha256sums=('854d7d5e19e0ee2138d1f20f10f8f27f2bebb94ec81c157040955cff7250dacd')

build() {
	cd Xyce-Release-"$pkgver"

	# sed -i 's/3.7, 3.6, 3.5, 3.4, 3.3, 3.2, 3.1, 3.0/3.8, 3.7, 3.6, 3.5, 3.4, 3.3, 3.2, 3.1, 3.0/g' configure.ac

	./bootstrap

	./configure \
		CPPFLAGS="$CPPFLAGS -I/usr/include/trilinos -I/usr/include/suitesparse -L/usr/lib/trilinos" \
		CXXFLAGS="$CXXFLAGS -O3 -I/usr/include/trilinos -L/usr/lib/trilinos -std=c++11" \
		CFLAGS="$CFLAGS -O3 -I/usr/include/trilinos -L/usr/lib/trilinos" \
		FFLAGS="$FFLAGS -I/usr/include/trilinos -L/usr/lib/trilinos" \
		LDFLAGS="$LDFLAGS -L/usr/lib/trilinos" \
		--prefix=/usr \
		--enable-shared \
		--enable-xyce-shareable

	make
}

package() {
	cd Xyce-Release-"$pkgver"
	make DESTDIR="$pkgdir" install
}
