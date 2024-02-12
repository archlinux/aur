# Maintainer: Julius Michaelis <gitter@liftm.de.de>

_name=niri
pkgname="$_name-git"
pkgver=0.1.0.f58e56d
pkgrel=2
pkgdesc="A scrollable-tiling Wayland compositor"
arch=('x86_64')
url="https://github.com/YaLTeR/$_name"
license=(GPL3)
depends=(wayland libpipewire seatd clang libxkbcommon mesa libinput)
makedepends=(rust git)
source=(git+$url.git)
sha512sums=(SKIP)
conflicts=(niri)

prepare() {
  cd "$srcdir/$_name"
  echo >>Cargo.toml '
  [profile.aur]
  inherits = "release"
  lto = true
  codegen-units = 1'
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_name"
  cargo build --profile aur --offline --target "$CARCH-unknown-linux-gnu"
}

package() {
  cd "$srcdir/$_name"
  install -Dm0755 "target/$CARCH-unknown-linux-gnu/aur/$_name" "$pkgdir/usr/bin/$_name"
  install -Dm0755 "resources/$_name-session" "$pkgdir/usr/bin/$_name-session"
  install -Dm0644 "resources/$_name.desktop" "$pkgdir/usr/share/wayland-sessions/$_name.desktop"
  install -Dm0644 "resources/$_name-portals.conf" "$pkgdir/usr/share/xdg-desktop-portal/$_name-portals.conf"
  install -Dm0644 "resources/$_name.service" "$pkgdir/usr/lib/systemd/user/$_name.service"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
