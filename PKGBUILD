# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade
pkgver=2023.02a
pkgrel=6
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
'tk: passing all tests'
)
source=("trunk-${pkgver}.tar.gz::https://gitlab.com/yade-dev/trunk/-/archive/${pkgver}/trunk-${pkgver}.tar.gz"
"suitesparse-ver.patch"
'qtwebkit.patch'
'remove-metis.patch'
'py311.patch::https://gitlab.com/yade-dev/trunk/-/merge_requests/931.patch'
'cgal-5.6.patch::https://gitlab.com/yade-dev/trunk/-/merge_requests/981.patch'
)
sha512sums=('4eea071814c09b83d980d1a513ae321fba8265460df4d7e32e5908c3d8ef21d3d2b64ce78cbb12a0948868f5fa6a149c07ae760f817f85f1f5324dcf5f14bbff'
            '209893bfa477a0cc1086dde2c3fa216a4e4e28da612b4d55f9be2250cc2f15cbf8266749ffd44b89039efd0dc02e6a2076db0fff12f15e9a8b7c8a3d792b4104'
            '6725a5f8d3bde9add6597085c0e635aeb0480fdddb5335c07206185f5de4ea66ef4ed16e12e4b6533b996f3d2c62ddc6a618cc682c2a976516447a24b10a5288'
            'ebbbb16ebc7f5fa383425149030f37e3309dd1411bc4ac464fd81dcd3e2e3acfc0ac141a631b287e91e8fab1f0e8d6f77dad476936edb9f297e11ea5f4c26422'
            'bb151cbbad973eb3857800e3f0c03e510f623bfae9b3feefc2da4980857e0fd3956f868986cf3d3748c0b164ad896e804622b9da76932c3699dbb711e5388bca'
            '4744464a6c6c176c28296ea50a69fb12b54d9f562973a0e8e617b20a2209a3926a06b7b77489f0b9336f15901e3a41b11efefb032e105e595181d900393760fd')
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
    patch --strip=1 < ../py311.patch
    patch --strip=1 < ../cgal-5.6.patch
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
