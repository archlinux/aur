# Maintainer: Daan Hessen <daanh2002@gmail.com>
pkgname=sonyctl
pkgver=0.1.2
pkgrel=1
pkgdesc="A Rust API/CLI that allows every device on your network to control your Sony headphones"
arch=('x86_64')
url="https://github.com/DaanHessen/sonyctl"
license=('AGPL-3.0-or-later')
depends=('dbus' 'bluez' 'bluez-utils')
# sdptool, used to resolve the vendor RFCOMM channel.
optdepends=('bluez-deprecated-tools: RFCOMM channel auto-detection')
install=sonyctl.install
makedepends=('cargo')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1ab919933459914613cd3dfb4ad1c766c4dc578c84d7f862ef9442135710ae86')

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Disable LTO so ring links correctly, and remap the build path so the
  # binary carries no reference to $srcdir.
  export RUSTFLAGS="-C lto=off --remap-path-prefix=$srcdir=/"
  cargo build --release --locked --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  # The live tests are #[ignore]d and need the headphones connected.
  cargo test --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 docs/protocol.md "${pkgdir}/usr/share/doc/${pkgname}/protocol.md"

  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

  install -Dm755 "contrib/waybar/${pkgname}-waybar.sh" \
    "${pkgdir}/usr/share/${pkgname}/waybar/${pkgname}-waybar.sh"
}
