# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://github.com/lemonade-sdk/lemonade/releases/tag/v9.0.2
pkgname=lemonade-server
pkgdesc="Lemonade: Local LLM Serving with GPU and NPU acceleration"
pkgver=9.0.2
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
'ef8ad8cc5ed4595548305b0ba6c2c861c1eb3a34f2244bf01d2bcca32ca7d534'
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
