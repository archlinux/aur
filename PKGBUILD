# Maintainer: Dee.H.Y <dongfengweixiao at hotmail dot com>
pkgname=dahliaos-files-git
pkgver=r101.4166d0a
pkgrel=3
pkgdesc="File manager application for dahliaOS."
arch=('x86_64')
url="https://github.com/dahliaOS/files"
license=('Apache')
depends=('gtk3')
makedepends=('git' 'cmake' 'ninja' 'imagemagick' 'clang>=11.0.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dahliaOS/files.git'
  "${pkgname%-git}.desktop"
  "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.5-stable.tar.xz")
sha256sums=('SKIP'
  '41a11b723315c19014d21c4b177c513251d03ea773783ab674296035fb52d13c'
  '86643cbfe8acf766a226a6cd4625bb8301c2601ea9bb825448318c8669b72a13')

pkgver() {
  cd "$srcdir/files"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/files"
  $srcdir/flutter/bin/flutter build linux
}

package() {
  cd "$srcdir/files/build/linux/x64/release/bundle"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r * "$pkgdir/opt/${pkgname%-git}"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/files" "$pkgdir/usr/bin/${pkgname%-git}"

  install -Dm644 "$srcdir/files/dahliaOS/files.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
