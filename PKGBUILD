# Maintainer: Asuna <SpriteOvO[at]gmail[dot]com>

pkgname=tun2proxy
pkgver=0.2.22
pkgrel=1
pkgdesc="Tunnel (TUN) interface for SOCKS and HTTP proxies"
url='https://github.com/tun2proxy/tun2proxy'
arch=('x86_64')
license=('MIT')
makedepends=(cargo)
source=("https://github.com/tun2proxy/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "Cargo.lock") # https://github.com/tun2proxy/tun2proxy/pull/125#issuecomment-2178592528
sha256sums=('b6a4c57395272377138ed5cc588b91f96ed2891283c259ef73f7509e70393d9a'
            'cbaf10e3fca09a4714ea2fa62645636301aa1e64f6a696b86cbdcceb066cae80')

prepare() {
  cd "${pkgname}-${pkgver}"
  cp ../Cargo.lock ./
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --frozen --release --all-features
}

check() {
  cd ${pkgname}-${pkgver}
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
