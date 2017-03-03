# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=python-pymesh-git
pkgdesc='Geometry Processing Library for Python'
pkgver=20170223
pkgrel=2
arch=('i686' 'x86_64')
url='https://github.com/qnzhou/PyMesh'
license=('MPL')
depends=('python-scipy' 'eigen' 'cgal' 'sparsehash')
makedepends=('git' 'swig')
options=(!emptydirs)
source=('git+https://github.com/qnzhou/PyMesh.git#branch=master')
md5sums=('SKIP')

#export PYMESH_PATH="${srcdir}/PyMesh"

pkgver() {
	cd PyMesh
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

prepare() {
	cd PyMesh
	git submodule init
	git submodule update
}

build() {
	cd PyMesh
	sed -i '55,59d' Settings.cmake

	cd third_party
	[ -d build ] && rm -rf build
	mkdir build
	cd build

	cmake .. \
		-DCMAKE_CXX_FLAGS='-w' \
		-DCMAKE_SKIP_BUILD_RPATH=TRUE \
		-DCMAKE_SKIP_RPATH=TRUE

	make
	make install
	#DESTDIR="${pkgdir}"

	cd ../..
	[ -d build ] && rm -rf build
	mkdir build
	cd build

	cmake .. \
		-DCGAL_DIR='/usr' \
		-DCMAKE_CXX_FLAGS='-w' \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_SKIP_BUILD_RPATH=TRUE \
		-DCMAKE_SKIP_RPATH=TRUE

	make
	#make src_tests
	#make tools
	#make tools_tests
}

package() {
	cd PyMesh
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

	# Instlall module only, no scripts
	rm -rf "${pkgdir}/usr/bin"
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
