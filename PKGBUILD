# Maintainer: bjesus <github@yoavmoshe.com>
pkgname=chords
pkgver=0.2.2
pkgrel=1
pkgdesc='A native GNOME music chords viewer'
arch=('x86_64')
url='https://github.com/bjesus/chords'
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('cargo' 'glib2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}
package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/chords "$pkgdir/usr/bin/chords"
  install -Dm644 data/io.github.bjesus.Chords.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/io.github.bjesus.Chords.gschema.xml"
  install -Dm644 data/io.github.bjesus.Chords.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.bjesus.Chords.svg"
  install -dm755 "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/io.github.bjesus.Chords.desktop" <<EOF
[Desktop Entry]
Name=Chords
Comment=Guitar chords viewer
Exec=chords
Icon=io.github.bjesus.Chords
Terminal=false
Type=Application
Categories=Audio;Music;
EOF
}
