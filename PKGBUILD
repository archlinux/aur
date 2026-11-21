# Maintainer: smiley <smiley@archlinux.org>

_pkgname=wpatui
pkgname=wpatui-git
pkgver=0.1.0.r1.gd782f8f
pkgrel=1
pkgdesc='Terminal front end for wpa_supplicant (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/AuthenticSm1les/wpatui'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'wpa_supplicant')
makedepends=('cargo' 'git')
provides=('wpatui')
conflicts=('wpatui')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/wpatui -t "$pkgdir/usr/bin"
  install -Dm644 dbus/wpatui.conf -t "$pkgdir/usr/share/dbus-1/system.d"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
