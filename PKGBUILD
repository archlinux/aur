_qt_module=qtmultimedia
pkgname=mingw-w64-qt5-multimedia
pkgver=5.4.2
pkgrel=1
arch=(any)
pkgdesc="Classes for audio, video, radio and camera functionality (mingw-w64)"
depends=(mingw-w64-qt5-base mingw-w64-qt5-declarative)
makedepends=(mingw-w64-gcc)
options=(!strip !buildflags staticlibs)
groups=(mingw-w64-qt mingw-w64-qt5)
license=("custom, FDL, GPL3, LGPL")
url="http://qt-project.org"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/5.4/${pkgver}/submodules/${_pkgfqn}.tar.xz"
        "qt5-qtmultimedia-mingw-w64-vsnprintf-workaround.patch"
        "qtmultimedia-dont-use-case-sensitive-headers.patch")
md5sums=('b94baed3effda9187d71300b3e37d2d5'
         'c21ff895212a17dc0a748aeadb67601d'
         '7ecd5ee2735440472fae4b7d7a32879e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgfqn}"
  # Some files #include <dshow.h>
  # This is a C header which also #include's stdio.h which adds a #define vsnprintf
  # This #define vsnprint conflicts with QtCore/qstring.h so reorder the includes
  # a bit to prevent this situation
  patch -p0 -i ../qt5-qtmultimedia-mingw-w64-vsnprintf-workaround.patch

  # MinGW headers are case sensitive under Linux
  patch -p1 -i ../qtmultimedia-dont-use-case-sensitive-headers.patch
}

build() {
  cd "${srcdir}/${_pkgfqn}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-qmake-qt5 ../${_qt_module}.pro -Wall
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
