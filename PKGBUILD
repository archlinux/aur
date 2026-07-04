# Maintainer: allbandee <mw@z.tm.pl>
pkgname=plasma-drop
pkgver=1.5.8
pkgrel=1
pkgdesc="KDE Plasma 6 dropdown app launcher for Wayland (Yakuake-style for any app)"
arch=('x86_64')
url="https://github.com/SkeLLLa/plasma-drop"
license=('GPL-3.0-or-later')
depends=('kwin' 'qt6-base')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ec9effe07819f578460eec2fa3899076de5b5c25064243029d44c56fe288f0df')

prepare() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "x86_64-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo test --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "resources/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
  install -Dm644 "resources/example-config.toml" "${pkgdir}/usr/share/${pkgname}/examples/config.toml"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
