# Maintainer: All Ban Dee <mw@z.tm.pl>
# Co-Maintainer: agony <27015 at riseup dot net>

pkgname=plasma-drop
pkgver=1.17.4
pkgrel=1
pkgdesc="KDE Plasma 6 dropdown app launcher for Wayland (Yakuake-style for any app)"
arch=('x86_64' 'aarch64')
url="https://github.com/SkeLLLa/plasma-drop"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'kwin')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5c226902b0a10d9c3d006f52e4eaa34c1141cc945371f49ec5d2c801084447f9')

prepare() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
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
  install -Dm644 "packaging/systemd/${pkgname}.packaged.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
  install -Dm644 "resources/example-config.toml" "${pkgdir}/usr/share/${pkgname}/examples/config.toml"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
