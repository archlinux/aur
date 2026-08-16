# Maintainer: Jag_k <30597878+jag-k@users.noreply.github.com>

pkgname=clipboard-transformer
pkgver=0.1.4
pkgrel=1
pkgdesc='Rule-based clipboard transformer (built from source)'
arch=('x86_64')
url='https://github.com/jag-k/clipboard-transformer'
license=('MPL-2.0')
depends=('glibc' 'libgcc' 'xdg-desktop-portal')
makedepends=('cargo')
optdepends=(
  'wayland: native Wayland clipboard support'
  'xdg-utils: fallback for opening support links'
)
conflicts=('clipboard-transformer-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6e29b2c9e5ae800760d6a1eae237df0bae582185153c4d25294ed5f21dc1d9e1')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features --bin clipboard-transformer
  cargo build --frozen --release --features desktop --bin clipboard-transformer-app
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 target/release/clipboard-transformer \
    "${pkgdir}/usr/bin/clipboard-transformer"
  install -Dm0755 target/release/clipboard-transformer-app \
    "${pkgdir}/usr/bin/clipboard-transformer-app"
  install -Dm0644 package/linux/dev.jag-k.clipboard-transformer.desktop \
    "${pkgdir}/usr/share/applications/dev.jag-k.clipboard-transformer.desktop"
  install -Dm0644 package/linux/dev.jag-k.clipboard-transformer.service \
    "${pkgdir}/usr/share/dbus-1/services/dev.jag-k.clipboard-transformer.service"
  install -Dm0644 assets/generated/linux/app-icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/clipboard-transformer-app.png"
  install -Dm0644 assets/tray.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/status/clipboard-transformer-symbolic.svg"
  install -Dm0644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
