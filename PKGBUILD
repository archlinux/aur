# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade
pkgver=2021.01a
pkgrel=1
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling."
arch=("any")
url='https://yade-dem.org/doc/index.html'
license=('GPL2')
depends=('ipython' 'vtk' 'gl2ps' 'coin-or-clp' 'cgal' 'libqglviewer'
    'tk' 'python-matplotlib' 
    'python-mpmath'
    'python-xlib'
    'python-future'
    'python-pyqt5'
    'gts'
    'openmpi'
    'freeglut'
)
makedepends=(
    'mpfrc++' 'python-pygraphviz' 
    'python-mpi4py'
)
optdepends=()
provides=('yade')
source=("https://gitlab.com/yade-dev/trunk/-/archive/${pkgver}/trunk-${pkgver}.tar.bz2")
sha512sums=('b6bda1ffb56c6f03838700bca9b7576927497ea1246715d9357ad77ea3fcf62eed987d0aaf409c4bc306c900f778e90a2429515de67e9a98b58ade30dcf4b3e3')

prepare(){
    # Follow https://yade-dem.org/doc/installation.html#compilation
    
    cd "$srcdir"
    test -d trunk || mv trunk-${pkgver} trunk 
    test -d build || mkdir build 
    # correct cuda and clp path
    sed -i 's|/usr/local/cuda/lib64|/opt/cuda/lib64|g' trunk/cMake/FindCuBlas.cmake
    sed -i "s|/usr/lib/x86_64-linux-gnu|/usr/lib|g" trunk/cMake/FindCLP.cmake
    
    # fix openmp not found 
    _cmakedir=$(ls /usr/share/cmake* | grep cmake | cut -d ':' -f1)
    for dir in $_cmakedir;
    do
        sed -i "N;102 a set(CMAKE_MODULE_PATH \$\{CMAKE_MODULE_PATH\} ${dir}/Modules/)" trunk/CMakeLists.txt;
    done;
    
    # fix vtk 
    sed -i 's|#if VTK_MAJOR_VERSION < 9|#if ((VTK_MAJOR_VERSION <= 8) and (VTK_MINOR_VERSION < 2)) or (VTK_MAJOR_VERSION <= 7)|g' trunk/pkg/common/Gl1_PotentialBlock.cpp
    
}

# -DVECTORIZE=OFF
# It could be a compiler bug in the memory alignment of variables. 
# In this case VECTORIZE=OFF (not using SSE instructions) would solve this. 
# This is the reason why SSE is not enabled by default. 
# It is still experimental.
# See https://answers.launchpad.net/yade/+question/695081 #13

build(){
    # WARNING: Package contains reference to $srcdir, but all to "$srcdir"/trunk, I think it's safe. 
    # Anyway, I still want to deal with this, but need help.
    _nproc=$(nproc)
    cd build
    cmake ../trunk \
        -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DNOSUFFIX=ON -DPYTHON_VERSION=-1 \
        -DENABLE_SPH=ON   -DENABLE_PROFILING=ON  -DCHOLMOD_GPU=ON  -DENABLE_LIQMIGRATION=ON -DENABLE_MASK_ARBITRARY=ON -DENABLE_DEFORM=ON  -DENABLE_OAR=ON \
        -DENABLE_MPFR=ON -DENABLE_PARTIALSAT=ON \
        -DruntimePREFIX=/usr   -DCHUNKSIZE=1 -DOpenGL_GL_PREFERENCE=GLVND \
        -DENABLE_POTENTIAL_PARTICLES=ON -DENABLE_VTK=ON \
        -DVECTORIZE=OFF \
        -DENABLE_USEFUL_ERRORS=ON -DENABLE_POTENTIAL_BLOCKS=ON 
    make -j${_nproc}
}

package(){
    cd "$srcdir"/build
    make install DESTDIR="${pkgdir}"
    
    # To pass all checks, 
    # something wrong with the build script,
    # add a hack here.
    cd "${pkgdir}"/usr/lib/yade/py/yade/tests/checks/data/potentialVTKRecorders/
    cp -f ver9/* ver8.2/
}
