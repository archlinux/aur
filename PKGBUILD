# Maintainer: Grey-007 <https://github.com/Grey-007>

pkgname=nolio
pkgver=0.3.0
pkgrel=1
pkgdesc="Minimal calendar-based todo app built with Flutter"
arch=('x86_64')
url="https://github.com/Grey-007/nolio"
license=('MIT')

depends=(
  gtk3
  glib2
  libepoxy
  libxkbcommon
  libglvnd
  mesa
  pango
  cairo
  gdk-pixbuf2
  at-spi2-core
  gcc-libs
)

makedepends=(
  git
  flutter
  clang
  cmake
  ninja
  pkgconf
)

provides=('nolio')
conflicts=('nolio-bin')

source=("git+https://github.com/Grey-007/nolio.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  flutter pub get
}

build() {
  cd "$srcdir/$pkgname"
  flutter build linux --release
}

package() {
  cd "$srcdir/$pkgname/build/linux/x64/release/bundle"

  install -dm755 "$pkgdir/usr/lib/nolio"
  cp -a . "$pkgdir/usr/lib/nolio/"

  chmod +x "$pkgdir/usr/lib/nolio/nolio"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/nolio/nolio "$pkgdir/usr/bin/nolio"

  install -Dm644 \
    "$srcdir/$pkgname/linux/assets/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/nolio.png"

  install -Dm644 \
    "$srcdir/$pkgname/linux/nolio.desktop" \
    "$pkgdir/usr/share/applications/nolio.desktop"
}
