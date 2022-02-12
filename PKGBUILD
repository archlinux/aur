# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade
pkgver=2022.01a
pkgrel=1
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling."
arch=("x86_64")
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
    'python-sphinx'
)
makedepends=(
    'mpfrc++' 'python-pygraphviz' 
    'python-mpi4py'
    'utf8cpp'
)
optdepends=('cuda: for GPU acceleration')
source=("https://gitlab.com/yade-dev/trunk/-/archive/${pkgver}/trunk-${pkgver}.tar.bz2"
$pkgname.patch
)
sha512sums=('b6524e9f4fb67b2728851015e3ef5a4fb52055e389ad70947b9d883965ebc7416669d95b545e933d0781c64912fcd8d0c78e294420064ef23a7fec123cdd206b'
            'df198ef68e282f70f13a377415946090440941e3861d6e13f0544fe8fc49de58a59e3e2df9f07395942dd29154f7a3c69eb527c7decb2c0b6442ef405420aedd')
            
            
_pyver=$(python -V | cut -d' ' -f2)
prepare(){
    # Follow https://yade-dem.org/doc/installation.html#compilation
    test -d trunk && rm -rf trunk
    mv trunk-${pkgver} trunk 
    test -d build || mkdir build
    cd trunk 
    patch --strip=1 < ../${pkgname}.patch
    sed -i "s|(PY3_VERSIONS|(PY3_VERSIONS ${_pyver%.*}|g" CMakeLists.txt
    
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
    cd build
    cmake ../trunk \
        -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DNOSUFFIX=ON -DPYTHON_VERSION=-1 \
        -DCHOLMOD_GPU=ON    -DENABLE_DEFORM=ON  -DENABLE_OAR=ON \
        -DENABLE_MPFR=ON  \
        -DruntimePREFIX=/usr    -DOpenGL_GL_PREFERENCE=GLVND \
        -DENABLE_POTENTIAL_PARTICLES=ON -DENABLE_VTK=ON \
        -DFORCE_FREEGLUT_PATH=/usr/include \
        -DENABLE_SPH=ON -DENABLE_PROFILING=ON -DENABLE_LIQMIGRATION=ON\
        -DENABLE_MASK_ARBITRARY=ON -DENABLE_PARTIALSAT=ON \
        -DENABLE_USEFUL_ERRORS=ON \
        -DENABLE_POTENTIAL_BLOCKS=OFF  -DVECTORIZE=OFF 

# use stock build 
#     cmake ../trunk \
#         -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DNOSUFFIX=ON 
    make
}

package(){
    cd "$srcdir"/build
    make install DESTDIR="${pkgdir}"
    
      # need to add \x0 with length ${#srcdir}
#     msg2 'Stripping $srcdir'
#     find ${pkgdir}/* -type f -print0 | xargs -0 sed -i "s|${srcdir}/||g"
}
