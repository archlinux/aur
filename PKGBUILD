# Maintainer: Mohammadreza Khani <mohamadkhani14@gmail.com>
# This PKGBUILD is updated by CI on tagged releases (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.
# Builds the whole workspace from the release tag tarball: eBPF objects first
# (dns-tracker embeds them via include_bytes!), then the Rust binaries.
# The prebuilt variant lives in packaging/arch/netkeep-bin/PKGBUILD.

pkgname=netkeep
pkgver=0.1.0
pkgrel=1
pkgdesc='Linux desktop network flow authorization (daemon, CLI, GPUI tray)'
arch=('x86_64')
url='https://github.com/mohamadkhani/netkeep'
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'gtk-update-icon-cache'
  'hicolor-icon-theme'
  'libxkbcommon'
  'libxcb'
  'sqlite'
  'xdotool'
)
optdepends=(
  'vulkan-driver: GPU rendering for GPUI'
  'systemd-resolved: disable stub listener if using NETKEEP_DNS_FORWARDER on port 53'
)
makedepends=(
  'cargo'
  'rust'      # Arch rust ships rust-src, needed for -Z build-std=core
  'git'       # cargo fetches the gpui fork from GitHub
  'clang'
  'llvm'
  'pkgconf'
)
options=('!lto' '!debug')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mohamadkhani/netkeep/archive/refs/tags/v${pkgver}.tar.gz")
# Checksum is injected by CI from the real tag tarball (not SKIP).
b2sums=('7e04f4df44e0138602dbd2e292ae0493681e0b0f2009b870d9283fa43d3f74eb5070a76e92688a084b4a64e39806b753570ba1e6a645fae59b0f0e5edf83f350')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Isolated CARGO_HOME for bpf-linker (0.11 regressed: rejects memset
  # libcalls — pin 0.10.4, same as packaging/archlinux/PKGBUILD).
  export CARGO_HOME="$srcdir/cargo-home"
  mkdir -p "$CARGO_HOME"
  export PATH="$CARGO_HOME/bin:$PATH"
  cargo install bpf-linker --version 0.10.4 --locked

  export CARGO_TARGET_DIR="$srcdir/$pkgname-$pkgver/target"
  # eBPF first: xtask pins its own CARGO_TARGET_DIR for the bpfel objects
  # (the include_bytes! paths in dns-tracker hardcode them). RUSTC_BOOTSTRAP=1
  # unlocks -Z build-std=core on the stable toolchain.
  RUSTC_BOOTSTRAP=1 cargo xtask build-ebpf-release
  cargo build --workspace --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  local target="$srcdir/$pkgname-$pkgver/target"
  install -Dm755 "$target/release/netkeep-daemon" "$pkgdir/usr/bin/netkeepd"
  install -Dm755 "$target/release/netkeep-cli"    "$pkgdir/usr/bin/netkeep-cli"
  install -Dm755 "$target/release/netkeep-gpui"   "$pkgdir/usr/bin/netkeep-gpui"

  install -Dm644 resources/linux/systemd/netkeepd.service \
    "$pkgdir/usr/lib/systemd/system/netkeepd.service"
  install -Dm644 resources/linux/applications/io.logicamp.Netkeep.desktop \
    "$pkgdir/usr/share/applications/io.logicamp.Netkeep.desktop"
  install -Dm644 resources/linux/icons/hicolor/scalable/apps/io.logicamp.Netkeep.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.logicamp.Netkeep.svg"
  install -Dm644 packaging/archlinux/environment.d-netkeep.conf \
    "$pkgdir/etc/environment.d/netkeep.conf"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
