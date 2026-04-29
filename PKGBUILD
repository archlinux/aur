# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgbase=yade
pkgname=(yade yade-cuda yade-doc)
pkgver=2026.1.0
pkgrel=2
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
    'boost-libs'
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
    'fast_float'
    'ninja'
    'nlohmann-json'
    'python-sphinx'
    ## needed to make doc
    'python-bibtexparser'
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

    0001-Fix-Werror-maybe-uninitialized.patch::https://gitlab.com/sukanka/trunk/-/commit/ee3d8c0b900842b5d5d45bbbd77a92b3d657d570.patch
    0002-fix-import-error.patch::https://gitlab.com/sukanka/trunk/-/commit/aefcf9ae7cb46f9f7432b32af424618fc23ecd4c.patch
    0003-fix-syntaxWarning.patch::https://gitlab.com/sukanka/trunk/-/commit/e755dfd9fc7e7e225ba78259f63dc8422ebaf992.patch
    0004-fix-amd64-detection.patch::https://gitlab.com/sukanka/trunk/-/commit/bd7c8151336d71a503fddd5b9c5ae5bfbdb74a12.patch

)
sha512sums=('334f160f6369526fb681157af0b56999dd0e81296f827f5f30f3d6912720ca11c13769dba8da7fe7fb85664ea44ec272a9eef85920a3a72517637e5bd679676e'
    '664f0a5888827576999078afcc1644594a0ef45397ad0ba93809444ad7493e39be53aec015ab004084f07be452764ab462c9e5ec363ed8540f5fbfcbf5d292dc'
    '4871e4b3952116c30b40ce2ab8ba22810ad25a64e5c03a3c0d8affb07d680d3236e413a169828b1b57ca7c3216b3149d44d301a484bbd464151a49d666edb08e'
    '1a41091037292f3bc33b3b2fe481aeadebeeb2e861875d2fd1ce5b62c525cfafc7c762eb399e7685b4b99605e476ad43fe07b7f514e2dc7cd4467a817325d819'
    'fe90adcb45fc7d75cb74b5f36b02e11800ef7309d5bab9fecf511cfb1df5580d912a8e63d2c35ed0db68ddbef13aeaa8ea4b8e0dcd5d5f5867484b645543829a')

_apply_patch() {
    cd "${srcdir}/trunk"
    for p in $srcdir/*.patch; do
        patch -p1 -l <$p
    done

}
prepare() {
    # Follow https://yade-dem.org/doc/installation.html#compilation
    test -d trunk && rm -rf trunk
    mv trunk-${pkgver} trunk
    install -d tmproot build build-doc build-cuda
    _apply_patch
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
        -DENABLE_USEFUL_ERRORS=OFF
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
