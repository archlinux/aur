pkgname=mingw-w64-exiv2
pkgver=0.27.5
pkgrel=1
pkgdesc="Exif and Iptc metadata manipulation library and tools (mingw-w64)"
arch=('any')
url="http://www.exiv2.org"
license=('GPL')
makedepends=('mingw-w64-cmake' 'rsync')
depends=('mingw-w64-zlib' 'mingw-w64-gettext' 'mingw-w64-libiconv' 'mingw-w64-expat')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/Exiv2/exiv2/archive/v$pkgver.tar.gz")
sha256sums=('1da1721f84809e4d37b3f106adb18b70b1b0441c860746ce6812bb3df184ed6c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/exiv2-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DEXIV2_BUILD_SAMPLES=OFF -DEXIV2_BUILD_EXIV2_COMMAND=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/exiv2-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
