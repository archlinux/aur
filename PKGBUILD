
pkgname=mingw-w64-polyclipping
pkgver=6.2.1
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
md5sums=('040821e66ec529f3d78f8ff7c4e256b2'
         'c410dc52e80d6798b924aaeef6a4181b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  # Correct line ends and encodings
  find . -type f -exec dos2unix -k {} \;

  # fedora patch, see #109
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
