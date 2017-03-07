# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=python-pymesh-git
pkgdesc='Geometry Processing Library for Python'
pkgver=20170223
pkgrel=4
arch=('i686' 'x86_64')
url='https://github.com/qnzhou/PyMesh'
license=('MPL')
depends=('python-scipy' 'eigen' 'cgal' 'sparsehash')
makedepends=('git' 'swig')
options=(!emptydirs)
source=('git+https://github.com/qnzhou/PyMesh.git#branch=master')
md5sums=('SKIP')

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
	#export PYMESH_PATH="${srcdir}/PyMesh"
	export CGAL_PATH='/usr'

	cd PyMesh

	sed -i '57,59d' Settings.cmake
	echo 'SET(CMAKE_INSTALL_RPATH "/usr/lib/python3.6/site-packages/pymesh/lib;/usr/lib/python3.6/site-packages/pymesh/third_party/lib")' >> Settings.cmake

	cd third_party
	[ -d build ] && rm -rf build
	mkdir build
	cd build

	cmake .. \
		-DCMAKE_CXX_FLAGS='-w' \
		-DCMAKE_C_FLAGS='-w'

	make
	make install
	#DESTDIR="${pkgdir}"

	cd ../..
	[ -d build ] && rm -rf build
	mkdir build
	cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_CXX_FLAGS='-w' \
		-DCMAKE_C_FLAGS='-w'

	make
	#make src_tests
	make tools
	#make tools_tests
}

package() {
	cd PyMesh
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

	# Instlall module only, no scripts
	rm -rf "${pkgdir}/usr/bin"
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
