
pkgname=mingw-w64-polyclipping
pkgver=6.4
pkgrel=1
pkgdesc="Polygon clipping library (mingw-w64)"
arch=('any')
url="http://sourceforge.net/projects/polyclipping/"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'dos2unix')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://downloads.sourceforge.net/polyclipping/clipper_ver${pkgver}.zip"
        'http://pkgs.fedoraproject.org/cgit/mingw-polyclipping.git/plain/polyclipping.patch')
sha256sums=('cfa08836e7838773ac79d13e14daf1ce7d2f4faee77329798614813b79151e39'
            'e8363eff5a28ce1159194afa1c6691ec6c493474651644d8e95dc7c8e6ea8cdd')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  # Correct line ends and encodings
  find . -type f -exec dos2unix -k {} \;

  # fedora patch, see https://sourceforge.net/p/polyclipping/bugs/109/
  patch -p0 -i ../polyclipping.patch

  # install static libs, see #119
  sed -i "s|LIBRARY DESTINATION|ARCHIVE DESTINATION lib LIBRARY DESTINATION|g" cpp/CMakeLists.txt
}

build() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS=OFF \
      ../cpp
    make VERBOSE=1
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      ../cpp
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
