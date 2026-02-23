# Maintainer: CPT_Dawn <dawnsp0456@gmail.com>
pkgname=arch-sense
pkgver=1.0.0
pkgrel=1
pkgdesc="Acer Predator PH16-71 control center for Arch Linux — thermal profiles, fan control, battery management, and keyboard RGB via a Rust TUI"
arch=('x86_64')
url="https://github.com/CPT-Dawn/Arch-Sense"
license=('MIT')
depends=('libusb' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=(
  'nvidia-utils: GPU temperature monitoring via nvidia-smi'
  'linuwu-sense-dkms: kernel module for sysfs hardware controls'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CPT-Dawn/Arch-Sense/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('61d06138ae9622aa877a20c6765f8dce864f55d9b34642b10195cfa264b0d309')

prepare() {
  cd "Arch-Sense-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Arch-Sense-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "Arch-Sense-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "Arch-Sense-${pkgver}"
  install -Dm755 "target/release/arch-sense" "${pkgdir}/usr/bin/arch-sense"
  install -Dm644 "arch-sense.service" "${pkgdir}/usr/lib/systemd/system/arch-sense.service"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
