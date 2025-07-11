# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=mint
pkgver=0.26.0
pkgrel=1
pkgdesc='A refreshing language for the front-end web'
arch=('x86_64')
url='https://github.com/mint-lang/mint'
license=('BSD')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
        "baked_file_system.patch")
sha256sums=('d1ae1c04c1a799642bdf88f87e97984a0be70e471d063fa2684968af5730825f'
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

  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
