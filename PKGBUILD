# Maintainer: Serge K <arch@phnx47.net>

pkgname=nub
pkgver=0.5.0
pkgrel=1
pkgdesc='The fast all-in-one Node.js toolkit'
license=('MIT')
url="https://nubjs.com"
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nubjs/nub/archive/v${pkgver}.tar.gz")
sha256sums=('ce58d2df8338c1c2c5200cba20540ccb9c7bb2d9490bf6d6a14944d559af1211')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=bfd"
  cargo build --release --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  # nubx is the same binary, dispatched on argv[0]
  ln -s ${pkgname} "${pkgdir}/usr/bin/${pkgname}x"

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
