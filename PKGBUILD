# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

pkgname=nub
pkgver=0.9.3
pkgrel=1
pkgdesc='The fast all-in-one Node.js toolkit'
license=('MIT')
url="https://nubjs.com"
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nubjs/nub/archive/v${pkgver}.tar.gz")
sha256sums=('a59fa2e65d500eace079aa5ee0168af57fac71e2a2dd168dbb6ff11a8d163ffb')

prepare() {
  cd "${pkgname}-${pkgver}"

  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"

  if [[ ${CARCH} == x86_64 ]]; then
    CFLAGS+=' -ffat-lto-objects'
    CXXFLAGS+=' -ffat-lto-objects'
  fi

  cargo build --release --frozen
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  # nubx is the same binary, dispatched on argv[0]
  ln -s ${pkgname} "${pkgdir}/usr/bin/${pkgname}x"

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
