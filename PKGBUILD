# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Contributor: Michel Zou <xantares09@hotmail.com>

pkgname=sundials
pkgver=2.7.0
pkgrel=3
pkgdesc="Suite of nonlinear differential/algebraic equation solvers"
arch=('i686' 'x86_64')
url="https://computation.llnl.gov/casc/sundials/main.html"
license=('BSD')
depends=('gcc-libs' 'lapack' 'gcc-fortran' 'openmpi')
makedepends=('cmake')
source=("http://computation.llnl.gov/projects/sundials/download/$pkgname-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/conda-forge/sundials-feedstock/9cc2f6aa344487b892dd3dd46793735c3ee41ece/recipe/sundials-link-libs.patch")
sha256sums=('d39fcac7175d701398e4eb209f7e92a5b30a78358d4a0c0fcc23db23c11ba104'
	'08febcacb706694f7461d6496047bc57048187aa3f77ee000cec2626c19e15c1')

prepare() {
	pwd
	cd "$pkgname-$pkgver"
	pwd
	patch -p0 -i ../sundials-link-libs.patch
}

build() {
	rm -rf build
	mkdir build  &&  cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr	\
	      -DMPI_ENABLE=ON	\
	      -DLAPACK_ENABLE=ON	\
	      -DEXAMPLES_ENABLE=ON	\
	      -DEXAMPLES_INSTALL=ON	\
	      -DEXAMPLES_INSTALL_PATH=/usr/share/"$pkgname-$pkgver"/examples	\
	      ../"$pkgname-$pkgver"
	make
}

package() {
	local doc="$pkgdir"/usr/share/doc/"$pkgname-$pkgver"
	mkdir -p "$doc"
	find . -name \*.pdf -exec cp -p {} "$doc" \;
	make -C build DESTDIR="$pkgdir" install
}

