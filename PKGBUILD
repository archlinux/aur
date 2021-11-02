pkgname=mingw-w64-jxrlib
pkgver=0.2.1
pkgrel=1
pkgdesc="Open source implementation of jpegxr (mingw-w64)"
url="https://archive.codeplex.com/?p=jxrlib"
license=(GPL)
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/glencoesoftware/jxrlib/archive/v$pkgver.tar.gz"
         https://raw.githubusercontent.com/archlinux/svntogit-community/packages/jxrlib/trunk/CMakeLists.txt)
sha256sums=('5ae964ae61f301f38a62b8e18eb8d2eee27eaf2b942477b033435ebf38fa4a19' SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/jxrlib-${pkgver}"
  cp "$srcdir"/CMakeLists.txt .
  curl -L https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-jxrlib/jxrlib_mingw.patch | patch -p1
}

build() {
  cd "$srcdir/jxrlib-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/jxrlib-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
