# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

_base=dolfin
_fragment="#branch=master"
pkgname=python-${_base}-git
pkgdesc="the C++/Python interface of FEniCS, providing a consistent PSE (Problem Solving Environment) for ordinary and partial differential equations."
pkgver=20161117
pkgrel=2
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics-git')
depends=('cppunit' 'eigen' 'gl2ps' 'hdf5' 'python-dijitso-git' 'python-ffc-git' 'python-instant-git' 'python-ply' 'python-six' 'python-sympy' 'slepc' 'suitesparse' 'scotch' 'vtk')
makedepends=('git' 'swig')
options=(!emptydirs)
source=("${_base}::git+https://bitbucket.org/fenics-project/${_base}.git${_fragment}")
md5sums=('SKIP')

export MAKEFLAGS="-j1"

pkgver() {
	cd ${_base}
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
	cd ${_base}
	[ -d build ] && rm -rf build
	mkdir build
	cd build

	local py_interp=`python -c "import os,sys; print(os.path.realpath(sys.executable))"`

	[ -z "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
	[ -z "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

	cmake ..\
		-DCMAKE_INSTALL_PREFIX="${pkg}"/usr \
		-DPYTHON_EXECUTABLE="${py_interp}" \
		-DDOLFIN_USE_PYTHON3=ON \
		-DCMAKE_SKIP_BUILD_RPATH=TRUE \
		-DCMAKE_SKIP_RPATH=TRUE \
		-DCMAKE_BUILD_TYPE="Release"

	make
}

package() {
	cd ${_base}/build
	make install DESTDIR="${pkgdir}"
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
