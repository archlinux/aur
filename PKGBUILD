# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade
pkgver=2022.01a
pkgrel=4
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling."
arch=("x86_64")
url='https://yade-dem.org/doc/index.html'
license=('GPL2')
depends=(
    'cgal' 'coin-or-clp' 'freeglut' 'gl2ps'
    'gts' 'ipython' 'libqglviewer' 'openmpi' 
    'python-mpmath' 'python-xlib' 'python-future' 'python-pyqt5'
    'vtk'
)
makedepends=(
    'mpfrc++' 'python-pygraphviz' 
    'python-mpi4py'
    'utf8cpp'
)
optdepends=(
'cuda: GPU acceleration'
'python-matplotlib: plotting graphs' 
'python-mpi4py: passing all tests' 
'tk: passing all tests' 
)
source=("trunk-${pkgver}::git+https://gitlab.com/yade-dev/trunk.git?commit=fd04d864622a1c628296ccd1697efc93cda98c27"
)
sha512sums=('SKIP')
options=('!buildflags' '!lto')
            
prepare(){
    # Follow https://yade-dem.org/doc/installation.html#compilation
    test -d trunk && rm -rf trunk
    mv trunk-${pkgver} trunk 
    test -d build || mkdir build
    cd trunk 
#     patch --strip=1 < ../${pkgname}.patch
}


build(){
    cd build

    cmake ../trunk \
        -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DNOSUFFIX=ON -DPYTHON_VERSION=-1 \
        -DCHOLMOD_GPU=ON    -DENABLE_DEFORM=ON  -DENABLE_OAR=ON \
        -DENABLE_MPFR=ON  \
        -DruntimePREFIX=/usr    -DOpenGL_GL_PREFERENCE=GLVND \
        -DENABLE_POTENTIAL_PARTICLES=ON -DENABLE_VTK=ON \
        -DFORCE_FREEGLUT_PATH=/usr/include \
        -DENABLE_SPH=ON -DENABLE_PROFILING=ON -DENABLE_LIQMIGRATION=ON \
        -DENABLE_MASK_ARBITRARY=ON -DENABLE_PARTIALSAT=ON \
        -DENABLE_USEFUL_ERRORS=ON \
        -DENABLE_POTENTIAL_BLOCKS=ON  -DVECTORIZE=ON \
        -DCMAKE_CXX_FLAGS='-Wformat -Wformat-security -Wformat-nonliteral -Wall -Wextra -Wno-error=unused-result -Wnarrowing -Wreturn-type -Wuninitialized -Wfloat-conversion -Wcast-align -Wdisabled-optimization -Wtrampolines -Wpointer-arith -Wswitch-bool -Wwrite-strings -Wnon-virtual-dtor -Wreturn-local-addr -Wsuggest-override -Wswitch-default  -Wno-error=shadow -Wno-error=use-after-free -Wno-error=maybe-uninitialized -Wno-error=dangling-pointer -Wno-error=cpp -fdce -fstack-protector-strong -DYADE_VTK -DYADE_OPENMP -fopenmp -DYADE_GTS -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include -DQGLVIEWER_FOUND -DYADE_OPENGL -DYADE_QT5  -DYADE_CGAL -DFLOW_ENGINE -DFLOW_ENGINE  -DLINSOLV -pthread -DYADE_MPI -DTWOPHASEFLOW -DYADE_GL2PS -DLBM_ENGINE -DPARTIALSAT' \
        -DCMAKE_CXX_FLAGS_RELEASE='-O3 -DNDEBUG'
    make
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
