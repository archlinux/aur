# Maintainer: Aaron Roque Fonseca <https://github.com/aaronroquefonseca>
# TEMPLATE for AUR `linux-trackpad-driver` (stable source build).
#
# DO NOT publish this file directly. Placeholders 0.1.0 / e4397ff084017ab6718352704705f73807029ea4d959ca426d38d25c73a7b04b
# are filled by packaging/arch/render-aur.sh once tag vX.Y.Z exists and the
# tag tarball digest is known. Publishing SKIP for an immutable release
# archive is forbidden. See packaging/arch/README.md for the contract.

pkgname=linux-trackpad-driver
pkgver=0.1.0
pkgrel=2
pkgdesc="Extensible userspace Linux driver for enhanced trackpad functionality, currently supporting Apple Magic Trackpad 2"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronroquefonseca/linux-trackpad-driver"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc' 'systemd')
makedepends=('cargo')
optdepends=('libinput: pointer/palm processing for passthrough events and hwdb quirks (see INSTALL.md "hwdb note")')
conflicts=('linux-trackpad-driver-bin' 'linux-trackpad-driver-git')
backup=('etc/linux-trackpad-driver/config.toml')
install=ltd.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/aaronroquefonseca/linux-trackpad-driver/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4397ff084017ab6718352704705f73807029ea4d959ca426d38d25c73a7b04b')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/ltd" "${pkgdir}/usr/bin/ltd"
  install -Dm644 "config/default.toml" "${pkgdir}/etc/linux-trackpad-driver/config.toml"
  install -Dm644 "udev/99-linux-trackpad-driver.rules" "${pkgdir}/usr/lib/udev/rules.d/99-linux-trackpad-driver.rules"
  install -Dm644 "systemd/linux-trackpad-driver.service" "${pkgdir}/usr/lib/systemd/system/linux-trackpad-driver.service"
  install -Dm644 "systemd/linux-trackpad-driver-reconnect@.service" "${pkgdir}/usr/lib/systemd/system/linux-trackpad-driver-reconnect@.service"
  install -Dm644 "systemd/linux-trackpad-driver-resume.service" "${pkgdir}/usr/lib/systemd/system/linux-trackpad-driver-resume.service"
  install -Dm755 "systemd/system-sleep/ltd-resume" "${pkgdir}/usr/lib/systemd/system-sleep/ltd-resume"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
