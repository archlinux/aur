# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgbase=yade
pkgname=(yade yade-cuda yade-doc)
pkgver=2024.08a
pkgrel=3
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling."
arch=("x86_64")
url='https://yade-dem.org/doc/index.html'
license=('GPL-2.0-or-later')
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
)
source=("trunk-${pkgver}.tar.gz::https://gitlab.com/yade-dev/trunk/-/archive/${pkgver}/trunk-${pkgver}.tar.gz"
    '0001-make-doc-before-install-phase.patch::https://gitlab.com/yade-dev/trunk/-/commit/565bd6b5.patch'
    '0002-adjust-rpath.patch::https://gitlab.com/yade-dev/trunk/-/commit/61a24f96.patch'
    '0003-remove-metis.patch::https://gitlab.com/yade-dev/trunk/-/commit/1fd3c83c.patch'
    '0004-improve-symlink.patch::https://gitlab.com/yade-dev/trunk/-/commit/357170b1.patch'
    '0005-fix-other-cmake-warning.patch::https://gitlab.com/yade-dev/trunk/-/commit/6c9caa1c.patch'
    '0006-fix-cmake-warning.patch::https://gitlab.com/yade-dev/trunk/-/commit/3cfd12d0.patch'
)
sha512sums=('081f4c228959a92830b9d2d2fde50bc717f6932e8da051051093693ef7cedea6d87100ef02a6e72c74259d08e821065400c91002be5eea1d27afbcba8cd72df2'
    '49b65c1c3f085fa6670c82e2b6e9e98d245261cda30d42857073d1d056b5c847e3fce5da2628eca03a127b1353049ad24b86bfd8c6f71023b63bf051815bf832'
    '7bce343e66c812a587dd9aa719d995143c4214f1d0594aa72190927c0b71f96b9ca975b398125941c694ca049c2145faffa72c484f02dc076121e10518da187a'
    'bb01814fd046151c2e52189cdcb752b455232a27a73fe3a202fee7d3d1a1e312c7518e006ef648f4aa7ecfb25be4e562c72dcb193d68b0d1b403c001072f1989'
    '2539400203c48e8fbebeaf128b92e3610b1d2e0f29378cc43b2c2bbd8339dec549a601d0bd691803593cd1a17c510019d2d79c8d83860fbf45cc168841f4c87a'
    'e64c3494f6ed3f2817258c7d0e386ab2b8e8efa434d9a9f0bde6d0ae5992703f224d4d59229464618f087ba34cadd021f685781dccb567a0972641fb5ceecca3'
    '20c5dc70c2767444866fe11334dd27d9ca660d4a0eb51149f6fe5183df5bd16712f7693104767421a14c5d4a90711dd806198e34114701f6d2d8c43e5b167b3d')
options=(
    '!buildflags' # -Wp,-D_GLIBCXX_ASSERTIONS in buildflags causes coredumps in yade --test
)

prepare() {
    # Follow https://yade-dem.org/doc/installation.html#compilation
    test -d trunk && rm -rf trunk
    mv trunk-${pkgver} trunk
    install -d tmproot build build-doc build-cuda
    cd trunk
    patch --strip=1 --ignore-whitespace <../0001-make-doc-before-install-phase.patch
    patch --strip=1 --ignore-whitespace <../0002-adjust-rpath.patch
    patch --strip=1 --ignore-whitespace <../0003-remove-metis.patch
    patch --strip=1 --ignore-whitespace <../0004-improve-symlink.patch
    patch --strip=1 --ignore-whitespace <../0005-fix-other-cmake-warning.patch
    patch --strip=1 --ignore-whitespace <../0006-fix-cmake-warning.patch
    sed -i '/convenience.hpp/d' preprocessing/potential/BlockGen.cpp

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
