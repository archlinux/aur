pkgname=mingw-w64-libsquish
pkgver=1.13
pkgrel=1
pkgdesc="DXT compression library (mingw-w64)"
arch=(any)
url="http://sourceforge.net/projects/libsquish"
license=("MIT")
makedepends=(mingw-w64-cmake)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/libsquish/libsquish-$pkgver.tgz"
"gcc440.patch")
sha1sums=('7bcdd7d0f0460a29e25dcdab8dc41a30e58bb366'
          '51bcc11eafbf79d9cde24769397c7a42f886154a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  find . -type f -exec dos2unix {} \;
  patch -Np0 -i ../gcc440.patch
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}-shared" && pushd "build-${_arch}-shared"
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release ..
    make
    popd
    mkdir "build-${_arch}-static" && pushd "build-${_arch}-static"
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}-shared"
    make DESTDIR="$pkgdir" install
    install -Dm644 libsquish.dll  "$pkgdir/usr/${_arch}/bin/libsquish.dll"
    cd "${srcdir}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
