# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=dolfin-git
pkgdesc="the C++/Python interface of FEniCS, providing a consistent PSE (Problem Solving Environment) for ordinary and partial differential equations."
pkgver=20140909
pkgrel=1
_branch=master
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/dolfin"
license=('LGPL')
groups=('fenics-git')
# the package may still build without these dependencies but it wouldn't be
# very useful, most people would want these installed before building
depends=('python2' 'boost' 'libxml2' 'hdf5-openmpi' 'cppunit' 'trilinos' 'petsc' 'slepc' 'ffc-git' 'instant-git' 'eigen' 'python2-ply' 'vtk' 'python2-sphinx'  'python2-six' 'python-sympy')
makedepends=('git' 'cmake' 'swig')
optdepends=('python2-sphinx: for building documentation')
conflicts=('dolfin')
options=(!emptydirs)
install="dolfin.install"
source=("dolfin::git+https://bitbucket.org/fenics-project/dolfin.git#branch=${_branch}"
        "${install}")
md5sums=('SKIP'
         '0659b73a58b92be0ca70fc0135668809')

# to stop /common/timing.cpp.o coming before /common/defines.cpp.o
export MAKEFLAGS="-j1"
# export CFLAGS="$CFLAGS -Wall -Wshadow -Wextra -Werror"
# export CXXFLAGS="$CXXFLAGS -Wall -Wshadow -Wextra -Werror"

pkgver() {
  cd dolfin
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}

prepare() {
  cd dolfin

    #patch -Np1 -i "${srcdir}/debug_cxxflags.diff"

    find ./ -name "*" -type f -exec \
        sed -i 's|^#!.*python$|#!/usr/bin/python2|' {} \;

    # for SLEPc 3.4.1
    sed -i 's/const EPSType eps_type = 0;/EPSType eps_type = 0;/' \
	dolfin/la/SLEPcEigenSolver.cpp

    # sphinx is for making documentation
    sed -i 's/\(sphinx-build[013456789^2]*\)\(.*\)/sphinx-build2\2/g' \
	./cmake/modules/FindSphinx.cmake
}

build() {
    cd dolfin
    [ -d build ] && rm -rf build
    mkdir build
    cd build

    # get the real path to the python executable, allows for virtualenv setups
    local py2_interp=`python2 -c "import os,sys; print(os.path.realpath(sys.executable))"`
    local py2_inc="${py2_interp/\/bin\///include/}"
    local py2_lib=`ldd ${py2_interp} | grep python | cut -d " " -f 3 | sed 's/\(.*.so\).*/\1/'`

    cmake .. -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
	-DCMAKE_INSTALL_PREFIX="${pkg}"/usr \
        -DPYTHON_EXECUTABLE:PATH="${py2_interp}" \
        -DPYTHON_INCLUDE_DIR:PATH="${py2_inc}" \
        -DPYTHON_LIBRARY:FILEPATH="${py2_lib}" \
	-DDOLFIN_ENABLE_VTK=ON \
        -DCMAKE_SKIP_BUILD_RPATH=TRUE \
	-DCMAKE_SKIP_RPATH=TRUE \
	-DCMAKE_BUILD_TYPE="Debug"
	# -DDOLFIN_ENABLE_TESTING=ON

    make

    # Uncomment this line for documentation
    #make SPHINXBUILD=sphinx-build2 doc
}

package() {
    cd dolfin/build
    make install DESTDIR="${pkgdir}"
}
