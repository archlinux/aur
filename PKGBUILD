# Maintainer: Marcel W. Wysocki <maci.stgn@gmail.com>

pkgname=xdg-desktop-portal-generic
pkgver=0.9.0
pkgrel=3
pkgdesc='Generic XDG desktop portal backend for Wayland compositors (experimental, see .install notes)'
arch=('x86_64')
url='https://github.com/lamco-admin/xdg-desktop-portal-generic'
license=('MIT' 'Apache-2.0')
depends=('xdg-desktop-portal' 'pipewire' 'libxkbcommon' 'wayland')
makedepends=('cargo' 'clang' 'pkgconf')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        '0001-fix-input-capture-for-deskflow-on-wayland.patch')
sha256sums=('a0764233f051bac8ce5ef7fb1824d2a32c46a356537bff89b06f5ed93c1c5341'
            'b7eca6f2cffc82dd6b584a006d9ebc71e048853ddcc8e363cace2f0f5473a02f')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "../0001-fix-input-capture-for-deskflow-on-wayland.patch"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  # Arch package etiquette: avoid /usr/libexec. Other portal backends and
  # xdg-desktop-portal itself install the binary directly under /usr/lib.
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/lib/$pkgname"
  install -Dm644 data/generic.portal "$pkgdir/usr/share/xdg-desktop-portal/portals/generic.portal"
  install -Dm644 data/org.freedesktop.impl.portal.desktop.generic.service \
    "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.generic.service"
  install -Dm644 "data/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  sed -i "s|/usr/libexec/$pkgname|/usr/lib/$pkgname|g" \
    "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.generic.service" \
    "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
