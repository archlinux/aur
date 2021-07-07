# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=mint
pkgver=0.14.0
pkgrel=5
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
        "baked_file_system.patch")
sha256sums=('2ccfa50812b8d9f53ea2e66fb427d42730a8b22ce2831c208f5421fc8c4baf28'
            '2d5b204294fc56b91dfe6407d161309f866259e680e09dadb3737d46cb03687a')
makedepends=('shards')
conflicts=('mint-bin')

build() {
  cd "${pkgname}-${pkgver}"

  # Get dependencies
  PATH="/usr/bin" shards

  # Fix issue on baked_file_system crystal dependencies with building in hidden directory
  patch -p1 -i "${srcdir}/baked_file_system.patch"

  # Build binary
  PATH="/usr/bin" shards build --progress --release --no-debug
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "bin/mint" "${pkgdir}/usr/bin/mint"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mint/LICENSE"
}
