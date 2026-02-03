# Maintainer: Grey-007 <https://github.com/Grey-007>

pkgname=nolio
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal calendar-based todo app built with Flutter"
arch=('x86_64')
url="https://github.com/Grey-007/nolio"
license=('MIT')

options=('!debug')

depends=(
  'gtk3'
  'libepoxy'
  'xorg-xrandr'
)

makedepends=(
  'flutter'
  'git'
)

source=(
  "$pkgname::git+$url.git"
  "nolio.desktop"
  "nolio.png"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  cd "$srcdir/$pkgname"

  flutter config --enable-linux-desktop
  flutter pub get
  flutter build linux --release
}

package() {
  cd "$srcdir/$pkgname"

  # Install full Flutter bundle
  install -d "$pkgdir/usr/lib/nolio"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/lib/nolio/"

  # Launcher symlink
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/nolio/nolio "$pkgdir/usr/bin/nolio"

  # Desktop entry
  install -Dm644 \
    "$srcdir/nolio.desktop" \
    "$pkgdir/usr/share/applications/nolio.desktop"

  # Icon
  install -Dm644 \
    "$srcdir/nolio.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/nolio.png"
}

