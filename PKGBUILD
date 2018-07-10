# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=coax
pkgver=0+123+gfbb9144
pkgrel=2
pkgdesc='Rust/GTK+ Wire client (insecure)'
arch=(any)
url=https://github.com/wireapp/coax
license=(GPL3)
depends=(libsodium gtk3 openssl sqlite)
makedepends=(git rust-nightly librsvg)
source=(git+$url#commit=fbb9144311b3a5bea626c611dd623086c53fdaf3)
sha512sums=(SKIP)

pkgver() {
  cd coax
  echo 0+$(git rev-list --count HEAD)+g$(git describe --always)
}

build() {
  cd coax
  rustup override set nightly-2018-04-10
  cargo build --release --features=prod
}

package() {
  cd coax
  install -D target/release/coax-gtk $pkgdir/usr/bin/coax
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/coax/LICENSE
  cd coax-gtk/src/gtk
  install -Dm 644 coax.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/coax.svg
  rsvg-convert -w 48 -h 48 coax.svg -o coax.png
  install -Dm 644 coax.png $pkgdir/usr/share/icons/hicolor/48x48/apps/coax.png
  sed -i s%@bindir@/coax-gtk%/usr/bin/coax% coax.desktop
  install -Dm 644 coax.desktop $pkgdir/usr/share/applications/coax.desktop
}
