# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgbase=yade
pkgname=(yade yade-cuda yade-doc)
pkgver=2025.2.0
pkgrel=4
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling."
arch=("x86_64")
url='https://yade-dem.org/doc/index.html'
license=('GPL-2.0-or-later')
depends=(
    'blas-openblas' 'cgal' 'coin-or-clp' 'freeglut' 'gl2ps'
    'gts' 'ipython' 'libqglviewer'
    # 'openmpi'
    'python-mpmath' 'python-xlib' 'python-pyqt5'
    'python-pyqt5-webengine' # replace pyqt5-qtwebkit
    'vtk'
    'tk'
    'python-matplotlib' # needed in runtime
    'python-mpi4py'
    'fmt'     # needed by `boot.so`
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
    'ninja'
    'nlohmann-json'
    'python-sphinx'

    ## needed to make doc

    'python-bibtexparser'
    'python-ipython-genutils'
    'python-pickleshare'
    'texlive-bin'
    'texlive-core'
    'texlive-latexextra'
    'texlive-pictures'
    'texlive-xetex'
    'texlive-fontsrecommended'
    'texlive-langgreek' # need puenc-greek.def
    # for  manpage
    'help2man'
    'openssh'

    patch
)
source=(
    "trunk-${pkgver}.tar.gz::https://gitlab.com/yade-dev/trunk/-/archive/${pkgver}/trunk-${pkgver}.tar.gz"
    0001-fix-for-boost-1.88.patch
    0002-fix-hidding.patch
    "fix-eigen.patch::https://gitlab.com/sukanka/trunk/-/commit/a3619aa.patch"
    "fix-shadow.patch::https://gitlab.com/sukanka/trunk/-/commit/38e47f02.patch"
    "fix-for-python.patch::https://gitlab.com/yade-dev/trunk/-/merge_requests/1086.patch"
)
sha512sums=('99d7e9ed1847a2b0a84e748761aeaf01f7118a161618cec61545fa8bc51832e4cb9abf45f4116ffc5b8930605dee7e0abb80628aec26f53d45d6986f9b45dbe7'
    '4b3abf78bd44af9d704fbbeb5c6413e454479226d7a15db840a922e171f521ae8ee9ed3a0141633dc1d36e3fc99bd661b0938fe4a00b751808c160fda9964507'
    'b7247b92909f710b477fc067f082636b9473e2dd5490ee7a73d8cfcf44cb5eaffa35e7aef4b4280887ebc04a7f0d47686b6eb57c4e5c479db75c8d68c314cd3a'
    '8ca199cb4bc9a5208a279b63b5042a99a83336473df413da8549cbdbad6b3208da78ed02ccde93897399ecbe23a21d6fe32a9134e7e165d3da6cfb17791631b0'
    '33992d94e725dfa3e0e26920ddf8393811dee38ce18036013e04c627e7974a55042951c7e37a051280b394c5323950c9d4b21d4b4d6bdc36d85f8d21a6e715a9'
    'a00d77b1ca4d780f978ba199127fec7196075f2b199f157509348d928006b485053000fa928296f3a7d5227d64fdc8f4516a774e3cdcc206f0964a71212ef162')

prepare() {
    # Follow https://yade-dem.org/doc/installation.html#compilation
    test -d trunk && rm -rf trunk
    mv trunk-${pkgver} trunk
    install -d tmproot build build-doc build-cuda
    cd trunk
    patch -Np1 <../0001-fix-for-boost-1.88.patch
    patch -Np1 <../0002-fix-hidding.patch
    patch -Np1 <../fix-eigen.patch
    patch -Np1 <../fix-shadow.patch
    patch -Np1 <../fix-for-python.patch
}
_build_doc() {
    cd $srcdir
    local _yade_dir="${srcdir}/tmproot"
    export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${_yade_dir}/usr/lib/yade:${_yade_dir}/usr/lib/yade/py/gts:${_yade_dir}/usr/lib/yade/py/yade/qt
    export YADE_PREFIX=${_yade_dir}/usr
    export PYTHONPATH=${PYTHONPATH}:${_yade_dir}/usr/lib/yade/py
    export PATH=${PATH}:${_yade_dir}/usr/bin
    export LC_ALL="en_US.UTF-8"
    export LC_CTYPE="en_US.UTF-8"
    cmake -S trunk -B build-doc -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr -DNOSUFFIX=ON \
        -DYADE_DOC_PATH=${pkgdir}/usr/share/doc/${pkgbase} \
        -DYADE_MAN_PATH=${pkgdir}/usr/share/man/man1/ \
        -DYADE_EXEC_BIN=${_yade_dir}/usr/bin/yade
}
build() {
    local cmake_args=(
        -S trunk
        -G Ninja
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=lib
        -DruntimePREFIX=/usr
        -DNOSUFFIX=ON
        -DPYTHON_VERSION=-1
        -DFORCE_FREEGLUT_PATH=/usr/include
        -DOpenGL_GL_PREFERENCE=GLVND
        -DENABLE_DEFORM=ON
        -DENABLE_OAR=ON
        -DENABLE_FEMLIKE=ON
        -DENABLE_MPFR=ON
        -DENABLE_POTENTIAL_PARTICLES=ON
        -DENABLE_VTK=ON
        -DENABLE_SPH=ON
        -DENABLE_PROFILING=ON
        -DENABLE_LIQMIGRATION=ON
        -DENABLE_MASK_ARBITRARY=ON
        -DENABLE_PARTIALSAT=ON
        -DENABLE_POTENTIAL_BLOCKS=ON
        -DVECTORIZE=ON
        -DENABLE_USEFUL_ERRORS=ON
        -DCMAKE_BUILD_TYPE=None
        -DDISABLE_SAVE_TEMPS=ON
        # -DCHOLMOD_GPU=OFF
        -DCMAKE_CXX_FLAGS="${CFLAGS}"
    )
    cmake -B build "${cmake_args[@]}"
    ninja -C build

    pushd "$srcdir"/build
    DESTDIR="${srcdir}/tmproot" ninja install
    popd

    cmake -B build-cuda "${cmake_args[@]}" -DCHOLMOD_GPU=ON
    ninja -C build-cuda

}

package_yade() {
    local pyver
    pyver=$(python -V | cut -d ' ' -f2)
    pushd "$srcdir"/build
    DESTDIR="$pkgdir" ninja install

    # strip srcdir in files
    sed -i "s|${srcdir}/trunk||g" ${pkgdir}/usr/lib/yade/py/yade/config.py
    # link to python packages
    install -d ${pkgdir}/usr/lib/python${pyver%.*}/site-packages
    ln -s ../../yade/py/yade ${pkgdir}/usr/lib/python${pyver%.*}/site-packages/yade
    popd
    _build_doc
    ninja -C build-doc manpage

}
package_yade-cuda() {
    depends+=('cuda')
    pkgdesc+="(with CUDA)"
    provides=(yade)
    conflicts=(yade)
    local pyver
    pyver=$(python -V | cut -d ' ' -f2)
    pushd "$srcdir"/build-cuda
    DESTDIR="$pkgdir" ninja install

    # strip srcdir in files
    sed -i "s|${srcdir}/trunk||g" ${pkgdir}/usr/lib/yade/py/yade/config.py
    # link to python packages
    install -d ${pkgdir}/usr/lib/python${pyver%.*}/site-packages
    ln -s ../../yade/py/yade ${pkgdir}/usr/lib/python${pyver%.*}/site-packages/yade
    popd

    _build_doc
    ninja -C build-doc manpage

}
package_yade-doc() {
    pkgdesc+="(Documentation)"
    depends=()
    arch=('any')
    install -d "${pkgdir}/usr/share/doc/yade"
    _build_doc
    ninja -C build-doc doc
    sed -i "s|${srcdir}/build-doc|build|g" ${pkgdir}/usr/share/doc/yade/html/events/01_yade-hackathon.html
}
