pkgname=mingw-w64-discord-rpc-api
pkgver=3.4.0
pkgrel=1
pkgdesc="Libraries for Discord Rich Presence (mingw-w64)"
arch=(any)
url="https://github.com/discordapp/discord-rpc"
license=('MIT')
depends=('mingw-w64-crt' 'mingw-w64-rapidjson')
makedepends=('mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/discordapp/discord-rpc/archive/v$pkgver.tar.gz")
sha256sums=('e13427019027acd187352dacba6c65953af66fdf3c35fcf38fc40b454a9d7855')
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
