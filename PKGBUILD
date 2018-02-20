# Maintainer: Sigvald Marholm <marholm@marebakken.com>
# Based on dolfin-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com> and submitted by myles

_base=dolfin
pkgname=${_base}
pkgdesc="the C++ and Python interfaces of FEniCS, providing a consistent PSE (Problem Solving Environment) for ordinary and partial differential equations (stable)."
pkgver=2017.2.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
groups=('fenics')
conflicts=('dolfin-git')
depends=('python-instant'
         'python-pkgconfig'
				 'python-ply'
				 'swig'
				 'cppunit'
				 'eigen'
				 'gl2ps'
				 'hdf5'
				 'python-ffc'
				 'petsc'
				 'suitesparse')
optdepends=('scotch: libraries for graph, mesh and hypergraph partitioning'
            'python-mpi4py: MPI library for python'
            'slepc: eigenvalue problem solvers'
            'petsc4py: interface with PETSc from python'
            'slepc4py: interface with SLEPc from python'
            'python-matplotlib: plotting support')
options=(!emptydirs)
source=("${_base}::git+https://bitbucket.org/fenics-project/${_base}.git#tag=${pkgver}")
md5sums=('SKIP')

export MAKEFLAGS="-j1"

build() {
	cd ${_base}
	[ -d build ] && rm -rf build
	mkdir build
	cd build

	local py_interp=`python -c "import os,sys; print(os.path.realpath(sys.executable))"`

	[ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
	[ -n "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

	echo $(pwd)
	patch ../doc/parse_doxygen.py < ../../../parse_doxygen.patch 

	cmake ..\
		-DCMAKE_INSTALL_PREFIX="${pkg}"/usr \
		-DPYTHON_EXECUTABLE="${py_interp}" \
		-DCMAKE_SKIP_BUILD_RPATH=TRUE \
		-DCMAKE_SKIP_RPATH=TRUE \
		-DCMAKE_BUILD_TYPE="Release"
		# -DDOLFIN_ENABLE_DOCS=FALSE \

	make
}

package() {
	cd ${_base}/build
	make install DESTDIR="${pkgdir}"
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
