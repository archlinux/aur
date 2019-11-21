# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Maintainer: Georg S. Voelker <voelker@maibox.org>
# Based on dolfin-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com> and submitted by myles

_base=dolfin
pkgname=${_base}
pkgdesc="The C++ interface of FEniCS, providing a consistent PSE (Problem Solving Environment) for ordinary and partial differential equations (stable)."
pkgver=2019.1.0.post0
pkgrel=3
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('LGPL3')
groups=('fenics')
conflicts=('dolfin-git')
depends=('cppunit'
				 'eigen'
				 'gl2ps'
				 'hdf5'
				 'python-ffc=2019.1.0'
				 'petsc'
				 'suitesparse')
optdepends=('scotch: libraries for graph, mesh and hypergraph partitioning'
            'slepc: eigenvalue problem solvers')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::https://bitbucket.org/fenics-project/${_base}/downloads/${_base}-${pkgver}.tar.gz)
sha256sums=('61abdcdb13684ba2a3ba4afb7ea6c7907aa0896a46439d3af7e8848483d4392f')

export MAKEFLAGS="-j1"

build() {
	cd ${srcdir}/${_base}-${pkgver}
	[ -d build ] && rm -rf build
	mkdir build
	cd build

	local py_interp=`python -c "import os,sys; print(os.path.realpath(sys.executable))"`

	[ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
	[ -n "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

	cmake ..\
		-DCMAKE_INSTALL_PREFIX="${pkg}"/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
		-DPYTHON_EXECUTABLE="${py_interp}" \
		-DCMAKE_SKIP_BUILD_RPATH=TRUE \
		-DCMAKE_SKIP_RPATH=TRUE \
		-DCMAKE_BUILD_TYPE="Release"

	make
}

package() {
	cd ${srcdir}/${_base}-${pkgver}/build
	make install DESTDIR="${pkgdir}"
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
