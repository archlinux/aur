# Maintainer: Dee.H.Y <dongfengweixiao at hotmail dot com>
pkgname=dahliaos-terminal-git
pkgver=r50.b0c7a4e
pkgrel=1
pkgdesc="Terminal emulator for dahliaOS."
arch=('x86_64')
url="https://github.com/dahliaOS/terminal"
license=('Apache')
depends=('gtk3')
makedepends=('git' 'flutter>=3.10.0' 'cmake' 'ninja' 'imagemagick' 'clang>=11.0.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dahliaOS/terminal.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '25840e6169afb96e792b08b77e9ea88c480a24142330b482169e0572c9a55c2b')

pkgver() {
  cd "$srcdir/terminal"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/terminal"
  flutter config --enable-linux-desktop
  flutter build linux
}

package() {
  cd "$srcdir/terminal/build/linux/x64/release/bundle"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r * "$pkgdir/opt/${pkgname%-git}"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/terminal" "$pkgdir/usr/bin/${pkgname%-git}"

  # install -Dm644 "$srcdir/terminal/dahliaOS/clock.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
