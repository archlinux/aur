# Maintainer: Marco Ziliani (rylos)
# AUR: rynas-agent (built from source). Copy to PKGBUILD in the AUR repository.
pkgname=rynas-agent
pkgver=0.8.25
pkgrel=1
pkgdesc="rynas PC backup agent: file backups to a rynas NAS and bare-metal restore from any live Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/rylos/rynas"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
# gcc's LTO objects (ring, zstd) cannot be linked by rustc
options=('!lto')
conflicts=('rynas-agent-bin')
optdepends=('btrfs-progs: btrfs snapshots and restores'
            'lvm2: LVM snapshots'
            'dosfstools: restoring an ESP'
            'cryptsetup: restoring LUKS volumes')
source=("rynas-${pkgver}.tar.gz::https://github.com/rylos/rynas/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('70ba1a9a96500a9788e1e490f9f67333fefc3266ee7f5d791932eb940955094f')

prepare() {
  cd "rynas-${pkgver}/crates/rynas-agent"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "rynas-${pkgver}/crates/rynas-agent"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "rynas-${pkgver}/crates/rynas-agent"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "rynas-${pkgver}"
  install -Dm755 crates/rynas-agent/target/release/rynas-agent "$pkgdir/usr/bin/rynas-agent"
  install -Dm644 packaging/agent/rynas-agent.service "$pkgdir/usr/lib/systemd/system/rynas-agent.service"
}
