# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade
pkgver=2023.02a
pkgrel=3
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling."
arch=("x86_64")
url='https://yade-dem.org/doc/index.html'
license=('GPL2')
depends=(
    'openblas' 'cgal' 'coin-or-clp' 'freeglut' 'gl2ps'
    'gts' 'ipython' 'libqglviewer'
    # 'openmpi'
    'python-mpmath' 'python-xlib' 'python-future' 'python-pyqt5'
    'python-pyqt5-webengine' # replace pyqt5-qtwebkit
    'vtk'
    'python-matplotlib' # needed in runtime
    'python-mpi4py'
)
makedepends=(
    'suitesparse'
    'mpfrc++' 'python-pygraphviz'
    'utf8cpp'
    'git'
    'cmake'
    'python-numpy'
    'tk'
    'cuda'
    'openmp'
)
optdepends=(
'cuda: GPU acceleration'
'tk: passing all tests'
)
source=("trunk-${pkgver}.tar.gz::https://gitlab.com/yade-dev/trunk/-/archive/${pkgver}/trunk-${pkgver}.tar.gz"
"suitesparse-ver.patch"
'qtwebkit.patch'
'remove-metis.patch'
)
sha512sums=('d93247bf86f9aa711b27b4258b711d5be448c8bffb78df8bc3a0691bb0d986ffe876a47a70eed43b1729b496ffd892f4d1137a397bc038539e95b695173da53c'
            '209893bfa477a0cc1086dde2c3fa216a4e4e28da612b4d55f9be2250cc2f15cbf8266749ffd44b89039efd0dc02e6a2076db0fff12f15e9a8b7c8a3d792b4104'
            '6725a5f8d3bde9add6597085c0e635aeb0480fdddb5335c07206185f5de4ea66ef4ed16e12e4b6533b996f3d2c62ddc6a618cc682c2a976516447a24b10a5288'
            'ebbbb16ebc7f5fa383425149030f37e3309dd1411bc4ac464fd81dcd3e2e3acfc0ac141a631b287e91e8fab1f0e8d6f77dad476936edb9f297e11ea5f4c26422')
options=('!buildflags' '!lto')

prepare(){
    # Follow https://yade-dem.org/doc/installation.html#compilation
    test -d trunk && rm -rf trunk
    mv trunk-${pkgver} trunk
    test -d build || mkdir build
    cd trunk
    patch --strip=1 < ../suitesparse-ver.patch
    patch --strip=1 < ../qtwebkit.patch
    patch --strip=1 < ../remove-metis.patch
}


build(){
    cd build

    # YADE_EXTRA_CMAKE_ARGS and YADE_CMAKE_FLAGS are preserved for future use.
    # To speed up compilation you can try (27 requires over 50GiB RAM)
    # -DCMAKE_UNITY_BUILD=ON -DCMAKE_UNITY_BUILD_BATCH_SIZE=27
    cmake ../trunk \
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
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_CXX_FLAGS="${YADE_EXTRA_CMAKE_ARGS} ${YADE_CMAKE_FLAGS}"

    cmake --build .
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
