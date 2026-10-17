# Maintainer: Aaron Roque Fonseca <https://github.com/aaronroquefonseca>
# AUR package `linux-trackpad-driver-git` (VCS snapshot of main).
#
# Publish: copy this file as PKGBUILD plus ltd.install into the separate AUR
# repo `linux-trackpad-driver-git`, then `makepkg --printsrcinfo > .SRCINFO`.
# Do not repush for mere pkgver bumps (see AUR VCS guidelines); pkgver()
# auto-updates on build. Pre-first-tag fallback is plain `r<revcount>.<hash>`
# so it sorts below the first `0.1.0.r...` tag build (no version rollback).

pkgname=linux-trackpad-driver-git
pkgver=r214.b01ae61
pkgrel=1
pkgdesc="Userspace Rust driver for Apple Magic Trackpad 2 (USB/BT core-init) — git snapshot"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronroquefonseca/linux-trackpad-driver"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc' 'systemd')
makedepends=('cargo' 'git')
optdepends=('libinput: pointer/palm processing for passthrough events and hwdb quirks (see INSTALL.md "hwdb note")')
provides=('linux-trackpad-driver')
conflicts=('linux-trackpad-driver' 'linux-trackpad-driver-bin')
backup=('etc/linux-trackpad-driver/config.toml')
install=ltd.install
source=("${pkgname}::git+https://github.com/aaronroquefonseca/linux-trackpad-driver.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}"

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
