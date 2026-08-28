# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

pkgname=nub
pkgver=0.8.0
pkgrel=1
pkgdesc='The fast all-in-one Node.js toolkit'
license=('MIT')
url="https://nubjs.com"
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nubjs/nub/archive/v${pkgver}.tar.gz")
sha256sums=('f9d9d2e2be64aab0c0c5a0b672f40434973776eac4f8544173cc36246c321992')

prepare() {
  cd "${pkgname}-${pkgver}"

  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"

  CFLAGS+=' -ffat-lto-objects'
  CXXFLAGS+=' -ffat-lto-objects'
  cargo build --release --frozen
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  # nubx is the same binary, dispatched on argv[0]
  ln -s ${pkgname} "${pkgdir}/usr/bin/${pkgname}x"

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
