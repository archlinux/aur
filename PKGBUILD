# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v9.0.7
pkgname=lemonade-server
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration"
pkgver=9.0.7
pkgrel=1
arch=('x86_64')
url='https://github.com/lemonade-sdk/lemonade/'
license=('Apache-2.0')
# makedepends=('')
depends=('zstd' 'openssl')
provides=('lemonade-server')

source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/lemonade-sdk/lemonade/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
'9bdaf5d364686d08a54fb70eed8761b44de7bcf40f7b30807573958643961609'
)

build() {
  local cmake_options=(
    -B build
    -S lemonade-$pkgver/src/cpp
    -W no-dev
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -rfv "$pkgdir/usr/include/"
  rm -rfv "$pkgdir/usr/lib"
  mkdir -p -m 777 $pkgdir/usr/share/lemonade-server/llama
}
