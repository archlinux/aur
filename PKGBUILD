# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=python-pymesh-git
pkgdesc='Geometry Processing Library for Python'
pkgver=20170223
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/qnzhou/PyMesh'
license=('Unlicensed')
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

	cd third_party
	[ -d build ] && rm -rf build
	mkdir build
	cd build

	cmake ..

	make
	make install

	cd ../..
	[ -d build ] && rm -rf build
	mkdir build
	cd build

	cmake -DCGAL_DIR='/usr' ..

	make
	make src_tests
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
