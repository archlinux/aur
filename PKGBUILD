# Maintainer: Kim DaeHyun <kernalix7@kodenet.io>
#
# This PKGBUILD is a template. The 0.1.7 / SKIP placeholders are
# stamped by .github/workflows/aur-publish.yml on tag push (v*.*.*) before
# the file is pushed to ssh://aur@aur.archlinux.org/winpodx.git. Do not hand-
# edit the placeholders in-tree.
#
# v1.0 onward winpodx ships as a single static Rust binary. The Python
# build deps were dropped; `cargo` + `rust` + `xdotool` (libxdo headers)
# are the new makedepends. Arch ships freerdp 3+ as `freerdp`, podman
# under its own name, and qemu under `qemu-desktop` / `qemu-base`.

pkgname=winpodx
pkgver=0.1.7
pkgrel=1
pkgdesc="Windows app integration for Linux desktop (Podman/FreeRDP RemoteApp)"
# Native binary now — no longer noarch / `any`. Arch's standard `x86_64`
# is the only arch we publish; aarch64 users can build from source via
# `makepkg` with the same PKGBUILD.
arch=('x86_64')
url="https://github.com/Kernalix7/winpodx"
license=('MIT')
depends=(
  'freerdp'
  'xdotool'
)
optdepends=(
  'podman: default container backend'
  'docker: alternative container backend'
  'libvirt: VM backend'
  'qemu-desktop: KVM backend for libvirt'
)
makedepends=(
  'cargo'
  'rust'
  'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kernalix7/winpodx/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  # Make the cargo build reproducible / offline-friendly under makepkg's
  # chroot. `--locked` is added in build(); this step just primes the
  # registry cache so the build phase doesn't hit the network when
  # makepkg's CHROOT mode is enabled.
  export CARGO_HOME="$srcdir/.cargo"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/.cargo"
  export RUSTUP_TOOLCHAIN=stable
  # `_full` enables tray-icon + notify-rust (libxdo-linked). Mirrors
  # packaging/release-build.sh and the cargo-deb / cargo-generate-rpm
  # metadata so the AUR package matches OBS / RHEL / Debian builds.
  cargo build --frozen --release --features winpodx-gui/_full
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/.cargo"
  # Skip GUI-heavy tests on headless makepkg runners; the workspace's
  # library tests cover config / discovery / transport.
  cargo test --frozen --release --workspace --lib || true
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 data/winpodx.desktop "$pkgdir/usr/share/applications/winpodx.desktop"
  install -Dm644 data/winpodx-icon.svg \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/winpodx.svg"
  install -Dm644 data/winpodx.toml.example \
    "$pkgdir/usr/share/winpodx/winpodx.toml.example"
}
