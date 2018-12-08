# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Contributor: Michel Zou <xantares09@hotmail.com>

pkgname=sundials
pkgver=4.0.0
pkgrel=1
pkgdesc="Suite of nonlinear differential/algebraic equation solvers"
arch=('i686' 'x86_64' 'armv7h')
url="https://computation.llnl.gov/casc/sundials/main.html"
license=('BSD')
depends=('gcc-libs' 'gcc-fortran' 'openmpi')
makedepends=('cmake')
source=("http://computation.llnl.gov/projects/sundials/download/$pkgname-$pkgver.tar.gz")
sha256sums=('953dd7c30d25d5e28f6aa4d803c5b6160294a5c0c9572ac4e9c7e2d461bd9a19')

build() {
	rm -rf build
	mkdir build  &&  cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr	\
	      -DMPI_ENABLE=ON	\
	      -DPTHREAD_ENABLE=ON	\
	      -DOPENMP_ENABLE=ON	\
	      -DFCMIX_ENABLE=ON	\
	      -DEXAMPLES_ENABLE_C=ON	\
	      -DEXAMPLES_ENABLE_CXX=ON	\
	      -DEXAMPLES_ENABLE_F77=ON	\
	      -DEXAMPLES_ENABLE_F90=ON	\
	      -DEXAMPLES_INSTALL=ON	\
	      -DEXAMPLES_INSTALL_PATH=/usr/share/"$pkgname-$pkgver"/examples	\
	      ../"$pkgname-$pkgver"
	make
}

package() {
	local doc="$pkgdir"/usr/share/doc/"$pkgname-$pkgver"
	mkdir -p "$doc"
	find . -name \*.pdf -exec cp -p {} "$doc" \;
	chmod 644 "$doc"/*.pdf
	make -C build DESTDIR="$pkgdir" install
	if [ -d "$pkgdir"/usr/lib64 ]; then
		mv "$pkgdir"/usr/lib64 "$pkgdir"/usr/lib
	fi
}

