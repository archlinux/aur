pkgname=mingw-w64-discord-rpc-api
pkgver=3.3.0
pkgrel=1
pkgdesc="Libraries for Discord Rich Presence (mingw-w64)"
arch=(any)
url="https://github.com/discordapp/discord-rpc"
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("$pkgname-$pkgver.tar.gz"::'https://github.com/discordapp/discord-rpc/archive/v3.3.0.tar.gz')
md5sums=('6f8c49413a2b91c443d812f4bae39938')
sha256sums=('1c625f3546761e778e084fe037540f4fdb5452e9c297ee790bbb43ce3cf955b5')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/discord-rpc-${pkgver}"

  # static
  for _arch in ${_architectures}; do
    mkdir -p build-static-${_arch} && pushd build-static-${_arch}
    ${_arch}-cmake -DBUILD_SHARED_LIBS=OFF -DBUILD_EXAMPLES=OFF -DCMAKE_BUILD_TYPE=Release ..
    make
    popd
  done

  # shared
  for _arch in ${_architectures}; do
    mkdir -p build-shared-${_arch} && pushd build-shared-${_arch}
    ${_arch}-cmake -DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF -DCMAKE_BUILD_TYPE=Release ..
    make
    popd
  done
}

package() {
  # static
  for _arch in ${_architectures}; do
    cd "${srcdir}/discord-rpc-${pkgver}/build-static-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done

  # shared
  for _arch in ${_architectures}; do
    cd "${srcdir}/discord-rpc-${pkgver}/build-shared-${_arch}"
    make DESTDIR="${pkgdir}" install
  done
}
