# Maintainer: Luke Labrie-Cleary <luke dot cleary at copenhagenatomics dot com>
pkgname=dagmc-git
pkgver=v3.2.2.r37.gaf2a4ce0
pkgrel=1
pkgdesc="Direct Accelerated Geometry Monte Carlo (DAGMC) is a software package 
		 that allows users to perform Monte Carlo radiation transport directly 
		 on CAD models."
arch=('x86_64')
url="https://github.com/svalinn/DAGMC"
license=('BSD')

depends=(
	double-down-git
	moab-git
)
makedepends=(
	git
	python
	cmake
)

provides=("${pkgname%}")
source=("${pkgname}::git+${url}.git")
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP')

build() {
	cd $srcdir/$pkgname
	mkdir build && cd build
	cmake .. -DBUILD_TALLY=ON \
	         -DMOAB_DIR=/opt/MOAB \
	         -DDOUBLE_DOWN=ON \
	         -DBUILD_STATIC_EXE=OFF \
	         -DBUILD_STATIC_LIBS=OFF \
	         -DCMAKE_INSTALL_PREFIX=/opt/DAGMC \
	         -DDOUBLE_DOWN_DIR=/opt/double-down/lib/cmake/dd 
}

package() {
	cd $srcdir/$pkgname/build
	make
	make DESTDIR="$pkgdir/" install
}

