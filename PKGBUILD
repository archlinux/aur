# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Markus Kitsinger (SwooshyCueb) <root at swooshalicio dot us>

# NOTE: requires rebuilt with each new gcc version

_pkgname=libtool
pkgname=mingw-w64-${_pkgname}
pkgver=2.4.6+42+gb88cebd5
pkgrel=1
pkgdesc="A generic library support script (mingw-w64)"
arch=('any')
url="https://www.gnu.org/software/libtool"
license=('GPL')
depends=('sh' 'tar' 'mingw-w64-crt')
makedepends=('mingw-w64-configure' 'git' 'help2man')
options=('staticlibs' '!strip' '!buildflags')
provides=("mingw-w64-libltdl=$pkgver" "mingw-w64-libtool-multilib=$pkgver")
conflicts=('mingw-w64-libltdl' 'mingw-w64-libtool-multilib')
replaces=('mingw-w64-libltdl' 'mingw-w64-libtool-multilib')
_commit=b88cebd510add4420dd8f5367e3cc6e6e1f267cd
source=(git+https://git.savannah.gnu.org/git/libtool.git#commit=$_commit
        git+https://git.savannah.gnu.org/git/gnulib.git
        gnulib-bootstrap::git+https://github.com/gnulib-modules/bootstrap.git
        0002-cygwin-mingw-Create-UAC-manifest-files.mingw.patch
        0003-Pass-various-runtime-library-flags-to-GCC.mingw.patch
        0005-Fix-seems-to-be-moved.patch
        0006-Fix-strict-ansi-vs-posix.patch
        0008-tests.patch
        0011-Pick-up-clang_rt-static-archives-compiler-internal-l.patch
        0012-Prefer-response-files-over-linker-scripts-for-mingw.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'fe8b80efd34f9385220ebc90aaec945e44de8c343c75719d6ac0d4e472a6eed5'
            '98265e84992e6242ead64bc3f9ec19be6c32a56e7a5b74d86047f9b548bcb1fe'
            'dc39fbe066958178f96108f07db62b48b9339efddf2c21f800ff8d67110ca393'
            '6a94ada08b0a0aa36240efd9ccb826e22ab94ef0969270f2edb8be344dc8c62b'
            'f00b44b49f83b20d4fbde89253666d0eb769172cfd711110f1be6a175294cb27'
            'c727b2b017163cfdeca60820d3cff2dac8968c5630745602b150f92b159af313'
            'c95a65e890b1ae6362807abc66809e72cf81aeea5f9f556e38f9752f974bf435')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed 's/-/+/g;s/^v//'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -p1 -i ${srcdir}/0002-cygwin-mingw-Create-UAC-manifest-files.mingw.patch
  patch -p1 -i ${srcdir}/0003-Pass-various-runtime-library-flags-to-GCC.mingw.patch
  patch -p1 -i ${srcdir}/0005-Fix-seems-to-be-moved.patch
  patch -p1 -i ${srcdir}/0006-Fix-strict-ansi-vs-posix.patch
  patch -p1 -i ${srcdir}/0008-tests.patch
  patch -p1 -i ${srcdir}/0011-Pick-up-clang_rt-static-archives-compiler-internal-l.patch
  patch -p1 -i ${srcdir}/0012-Prefer-response-files-over-linker-scripts-for-mingw.patch

  git submodule init
  git config --local submodule.gnulib.url "$srcdir/gnulib"
  git config --local submodule.gl-mod/bootstrap.url "$srcdir/gnulib-bootstrap"
  git submodule update

  ./bootstrap
}

build() {
  cd "${srcdir}/${_pkgname}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
    lt_cv_sys_lib_dlsearch_path_spec="/usr/${_arch}/lib"
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/${_pkgname}/build-${_arch}
    make DESTDIR=${pkgdir} install
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    
    # remove dir file
    rm -rf ${pkgdir}/usr/${_arch}/share/info/dir
  done
}
