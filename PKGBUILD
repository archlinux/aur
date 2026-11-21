# Maintainer: smiley <smiley@archlinux.org>

_pkgname=nearcast
pkgname=nearcast-git
pkgver=0.1.0.r0.gf4247e9
pkgrel=1
pkgdesc='Quick Share (Nearby Share) for Linux: share files and text with Android phones'
arch=('x86_64' 'aarch64')
url='https://github.com/AuthenticSm1les/nearcast'
license=('GPL-3.0-or-later')
provides=('nearcast')
conflicts=('nearcast')
depends=('bluez' 'dbus' 'gcc-libs' 'glibc' 'polkit' 'systemd-libs')
makedepends=('cargo' 'git' 'protobuf')
optdepends=('wpa_supplicant: Wi-Fi Direct transfers through nearcast-netd')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
