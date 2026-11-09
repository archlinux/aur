# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>

pkgname=scdr
pkgver=0.2.0
pkgrel=1
pkgdesc="Process scheduling and priority daemon for EEVDF and sched_ext kernels"
arch=('x86_64' 'aarch64')
url="https://github.com/asafelobotomy/scdr"
license=('MPL-2.0')
depends=('libgcc' 'glibc' 'dbus' 'systemd')
optdepends=('scx-scheds: sched_ext schedulers ([sched_ext])'
            'scx-tools: scx_loader, which scdr drives ([sched_ext])'
            'scx-devbox: sched_ext scheduler that follows scdr profiles'
            'pipewire: audio-client role (pw-dump)'
            'gamemode: game role'
            'power-profiles-daemon: per-power-profile roles')
install=scdr.install
makedepends=('cargo')
# The source archive the release workflow uploads (git archive of the tag),
# not GitHub's generated /archive/ tarball, whose bytes aren't guaranteed.
# The release's `aur` artifact has this PKGBUILD with the real checksum.
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6448b45adfe9f0e19eed66ca0a022e898635c0074bb40fa9f6e26771a4d4360d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  ./packaging/install.sh "$pkgdir" target/release
}
