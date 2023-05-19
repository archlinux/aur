# Maintainer: Dee.H.Y <dongfengweixiao at hotmail dot com>
pkgname=dahliaos-clock-git
pkgver=r39.5889188
pkgrel=1
pkgdesc="dahliaOS built-in clock and alarms application."
arch=('x86_64')
url="https://github.com/dahliaOS/clock"
license=('Apache')
depends=('gtk3')
makedepends=('git' 'flutter>=3.10.0' 'cmake' 'ninja' 'imagemagick' 'clang>=11.0.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dahliaOS/clock.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '0f974e8e9c49f61aa068254fe7fc31b1b38e1382011176f71f5da6c6318fde51')

pkgver() {
  cd "$srcdir/clock"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/clock"
  flutter config --enable-linux-desktop
  flutter build linux
}

package() {
  cd "$srcdir/clock/build/linux/x64/release/bundle"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r * "$pkgdir/opt/${pkgname%-git}"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/clock" "$pkgdir/usr/bin/${pkgname%-git}"

  install -Dm644 "$srcdir/clock/dahliaOS/clock.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
