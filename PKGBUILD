# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qtactiveqt
pkgname=mingw-w64-qt5-activeqt
pkgver=5.7.0
pkgrel=1
arch=('any')
pkgdesc="ActiveX integration framework (mingw-w64)"
depends=(mingw-w64-qt5-base)
makedepends=(mingw-w64-{gcc,headers,crt,winpthreads} python)
options=(!strip !buildflags staticlibs)
groups=(mingw-w64-qt mingw-w64-qt5)
license=("custom, FDL, GPL3, LGPL")
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        "qt5-activeqt-fix-compilation.patch"
        "qtactiveqt-fix-build.patch"
        "qtactiveqt-win64.patch")
md5sums=('e48d79becdad54a2ac67c36d98654f5b'
         '86c63b9808b0c8c7a8c2203bee73c42b'
         '7a7ba436452aa56613b3fbb15684e094'
         '1264d0274586aec14f96a978b416b048')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgfqn}"
  # Fix linker error:
  # qaxserverbase.cpp:1769: undefined reference to `qt_sendSpontaneousEvent(QObject*, QEvent*)'
  patch -p0 -i ../qt5-activeqt-fix-compilation.patch

  # Don't try to build stuff which requires windows.h with the native Linux gcc
  patch -p1 -i ../qtactiveqt-fix-build.patch

  # dumpcpp and MetaObjectGenerator::readClassInfo do not handle win64
  # https://bugreports.qt.io/browse/QTBUG-46827
  patch -p1 -i ../qtactiveqt-win64.patch
}

build() {
  cd "${srcdir}/${_pkgfqn}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-qmake-qt5 ../${_qt_module}.pro
    make
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make INSTALL_ROOT="$pkgdir" install
    # The .dll's are installed in both bindir and libdir
    # One copy of the .dll's is sufficient
    rm -f "${pkgdir}/usr/${_arch}/lib/"*.dll
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -o -name "*.bat" -o -name "*.def" -o -name "*.exp" -o -name '*.prl' | xargs -rtl1 rm
    find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.a" -o -name "*.dll" | xargs -rtl1 ${_arch}-strip -g
    popd
  done
}
