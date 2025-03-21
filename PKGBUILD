# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=fht-compositor
pkgver=25.03.1
pkgrel=4
pkgdesc='A dynamic tiling Wayland compositor'
groups=('fht-desktop')
arch=('x86_64')
url="https://github.com/nferhat/$pkgname"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('55789a5c4e8c12b23a5d72d4bf8b8b75fc116e0219c55784f11bd315995d2c3d')
makedepends=(
  'cargo'
  'clang'
  'egl-gbm'
)
depends=(
  'mesa'
  'glibc'
  'seatd'
  'gcc-libs'
  'libinput'
  'libpipewire'
  'systemd-libs'
  'libxkbcommon'
  'libdisplay-info'
)
optdepends=(
  'uwsm: systemd-managed session support'
  'fht-share-picker: XDG screencast portal'
)
options=('!lto') # TODO: temporary for libspa

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS='-C link-arg=/usr/lib/libinput.so -C link-arg=/usr/lib/libxkbcommon.so -C link-arg=/usr/lib/libgbm.so'
  cargo build --frozen --release --features uwsm
}

#check() {
#  cd "$pkgname-$pkgver"
#  cargo test --frozen
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "res/$pkgname.desktop" -t "$pkgdir/usr/share/wayland-sessions"
  install -Dm644 "res/$pkgname-uwsm.desktop" -t "$pkgdir/usr/share/wayland-sessions"
  install -Dm644 "res/$pkgname.portal" -t "$pkgdir/usr/share/xdg-desktop-portal/portals"
  install -Dm644 "res/$pkgname-portals.conf" -t "$pkgdir/usr/share/xdg-desktop-portal"
  install -Dm644 .github/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
