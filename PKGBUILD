# Maintainer: Luke Labrie-Cleary <luke dot cleary at copenhagenatomics dot com>
pkgname=double-down-git
pkgver=v1.0.0.r8.g74ab1f9
pkgrel=1
pkgdesc="double-down: A double precision interface to Embree"
arch=('x86_64')
url="https://github.com/pshriwise/double-down"
license=('MIT')

depends=(
    moab-git
    embree
)
makedepends=(
	git
	python
	cmake
	binutils
	make
	gcc-fortran
	eigen
        doxygen
)


provides=("${pkgname%-$pkgver}")
source=("${pkgname}::git+${url}.git")
pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
md5sums=('SKIP')

build() {
	cd $srcdir/$pkgname
	mkdir build && cd build
	cmake .. -DMOAB_DIR=/opt/MOAB \
		 -DCMAKE_INSTALL_PREFIX=/opt/double-down
	_ccores=$(nproc)
	# check if _ccores is a positive integer, if not, serial build
	if [[ "${_ccores}" =~ ^[1-9][0-9]*$ ]]; then
		make -j ${_ccores}
	else
		make
	fi
}

package() {
	cd $srcdir/$pkgname/build
	make DESTDIR="$pkgdir/" install
}
