# Maintainer: CPT_Dawn <dawnsp0456@gmail.com>
pkgname=arch-sense
pkgver=1.3.0
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

install=arch-sense.install

source=("arch-sense-1.3.0.tar.gz::https://github.com/CPT-Dawn/Arch-Sense/archive/refs/tags/v1.3.0.tar.gz")
sha256sums=('39522cf8d3538a604c3bb78bfd44d9e1bf3c1ddaea1a8c999edecb2056af3ef9')

prepare() {
  cd "Arch-Sense-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Arch-Sense-${pkgver}"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "Arch-Sense-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "Arch-Sense-${pkgver}"

  install -Dm755 "target/release/arch-sense" "${pkgdir}/usr/bin/arch-sense"
  install -Dm644 "arch-sense.service" "${pkgdir}/usr/lib/systemd/system/arch-sense.service"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/var/lib/arch-sense"

  echo "d /var/lib/arch-sense 0755 root root -" | \
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/arch-sense.conf"
}
