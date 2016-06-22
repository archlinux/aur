# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qtmultimedia
pkgname=mingw-w64-qt5-multimedia
pkgver=5.7.0
pkgrel=1
arch=('any')
pkgdesc="Classes for audio, video, radio and camera functionality (mingw-w64)"
depends=(mingw-w64-qt5-base mingw-w64-qt5-declarative)
makedepends=(mingw-w64-gcc)
options=(!strip !buildflags staticlibs)
groups=(mingw-w64-qt mingw-w64-qt5)
license=("custom, FDL, GPL3, LGPL")
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        "qt5-qtmultimedia-mingw-w64-vsnprintf-workaround.patch")
md5sums=('44c1b9a1dfb0e8b13f2d9571829500ee'
         'c21ff895212a17dc0a748aeadb67601d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

link_header_files() {
  for header in "$@"; do
    ln -s "/usr/${_arch}/include/${header,,}" "./sysinclude/${header}"
  done
}

prepare() {
  cd "${srcdir}/${_pkgfqn}"
  # Some files #include <dshow.h>
  # This is a C header which also #include's stdio.h which adds a #define vsnprintf
  # This #define vsnprint conflicts with QtCore/qstring.h so reorder the includes
  # a bit to prevent this situation
  patch -p0 -i ../qt5-qtmultimedia-mingw-w64-vsnprintf-workaround.patch
}

build() {
  cd "${srcdir}/${_pkgfqn}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    # headers are case sensitive under Linux -> provide symlinks
    mkdir -p ./sysinclude/qtgui && link_header_files {ShlObj,Evr9,Mferror}.h
    ln -s "/usr/${_arch}/include/qt/QtGui/qguiapplication.h" "./sysinclude/qtgui/qguiapplication.h"

    ${_arch}-qmake-qt5 ../${_qt_module}.pro -Wall INCLUDEPATH+="${srcdir}/${_pkgfqn}/build-${_arch}/sysinclude"
    make
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make INSTALL_ROOT="${pkgdir}" install
    # The .dll's are installed in both bindir and libdir
    # One copy of the .dll's is sufficient
    rm -f "${pkgdir}/usr/${_arch}/lib/"*.dll
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -o -name "*.bat" -o -name "*.def" -o -name "*.exp" -o -name '*.prl' | xargs -rtl1 rm
    find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.a" -o -name "*.dll" | xargs -rtl1 ${_arch}-strip -g
    popd
  done
}
