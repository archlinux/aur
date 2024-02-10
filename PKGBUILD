# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade
pkgver=2024.02a
pkgrel=1
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling."
arch=("x86_64")
url='https://yade-dem.org/doc/index.html'
license=('GPL2')
depends=(
    'blas-openblas' 'cgal' 'coin-or-clp' 'freeglut' 'gl2ps'
    'gts' 'ipython' 'libqglviewer'
    # 'openmpi'
    'python-mpmath' 'python-xlib' 'python-future' 'python-pyqt5'
    'python-pyqt5-webengine' # replace pyqt5-qtwebkit
    'vtk'
    'tk'
    'python-matplotlib' # needed in runtime
    'python-mpi4py'
    'fmt' # needed by `boot.so`
    'verdict' # needed by `boot.so`
)
makedepends=(
    'suitesparse'
    'mpfrc++' 'python-pygraphviz'
    'utf8cpp'
    'git'
    'cmake'
    'python-numpy'
    'cuda'
    'openmp'
)
optdepends=(
'cuda: GPU acceleration'
)
source=("trunk-${pkgver}.tar.gz::https://gitlab.com/yade-dev/trunk/-/archive/${pkgver}/trunk-${pkgver}.tar.gz"
'remove-metis.patch'
)
sha512sums=('e3c4cf14124494ebc824a66d5e818fb3037eec86be1e2668af786046cd988d68510aa19c41a1e7ba5837fcaae72529c4b40f7e2a8871d9bfda799fd81895a2b1'
            'ebbbb16ebc7f5fa383425149030f37e3309dd1411bc4ac464fd81dcd3e2e3acfc0ac141a631b287e91e8fab1f0e8d6f77dad476936edb9f297e11ea5f4c26422')
options=('!buildflags' '!lto')

prepare(){
    # Follow https://yade-dem.org/doc/installation.html#compilation
    test -d trunk && rm -rf trunk
    mv trunk-${pkgver} trunk
    test -d build || mkdir build
    cd trunk
    patch --strip=1 < ../remove-metis.patch
}


build(){

    # To speed up compilation you can try (27 requires over 50GiB RAM)
    # -DCMAKE_UNITY_BUILD=ON -DCMAKE_UNITY_BUILD_BATCH_SIZE=27
    cmake -B build -S trunk \
        -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DruntimePREFIX=/usr \
        -DNOSUFFIX=ON -DPYTHON_VERSION=-1 \
        -DFORCE_FREEGLUT_PATH=/usr/include \
        -DOpenGL_GL_PREFERENCE=GLVND \
        -DCHOLMOD_GPU=ON -DENABLE_DEFORM=ON -DENABLE_OAR=ON -DENABLE_FEMLIKE=ON \
        -DENABLE_MPFR=ON  \
        -DENABLE_POTENTIAL_PARTICLES=ON -DENABLE_VTK=ON \
        -DENABLE_SPH=ON -DENABLE_PROFILING=ON -DENABLE_LIQMIGRATION=ON \
        -DENABLE_MASK_ARBITRARY=ON -DENABLE_PARTIALSAT=ON  \
        -DENABLE_POTENTIAL_BLOCKS=ON  -DVECTORIZE=ON \
        -DENABLE_USEFUL_ERRORS=OFF \
        -DCMAKE_BUILD_TYPE=None  -Wno-dev \
        -DCMAKE_CXX_FLAGS=-DNDEBUG
    cmake --build build
}

package(){
    cd "$srcdir"/build
    make install DESTDIR="${pkgdir}"

    # need to add \x0 with length ${#srcdir}+1
    rplc='\x0'
    for ((i=1;i <=${#srcdir};i++))
    do
        rplc="$rplc\\x0"
    done
    msg2 'Stripping $srcdir'
    find ${pkgdir}/* -type f -print0 | xargs -0 sed -i "s|${srcdir}/|${rplc}|g"
    # .py file should not contains \x0
    sed -i 's/\x0//g' ${pkgdir}/usr/lib/yade/py/yade/config.py
}
