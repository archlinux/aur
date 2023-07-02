# Maintainer: Dee.H.Y <dongfengweixiao at hotmail dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pangolin-desktop-git
pkgver=r2628.d919bd7d
pkgrel=1
pkgdesc="Preview of Pangolin Desktop UI shell, designed for dahliaOS, written in Flutter."
arch=('x86_64')
url="https://github.com/dahliaOS/pangolin_desktop"
license=('Apache')
depends=('gtk3')
makedepends=('git' 'cmake' 'ninja' 'imagemagick' 'clang>=11.0.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dahliaOS/pangolin_desktop.git'
  "${pkgname%-git}.desktop"
  "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.5-stable.tar.xz")
sha256sums=('SKIP'
  '34a50af02e401b6a88e255018fa0cb3f1fce0c064b33b7ca2ddb97ce90c38241'
  '86643cbfe8acf766a226a6cd4625bb8301c2601ea9bb825448318c8669b72a13')

pkgver() {
  cd "$srcdir/pangolin_desktop"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/pangolin_desktop"
  $srcdir/flutter/bin/flutter build linux
}

package() {
  cd "$srcdir/pangolin_desktop/build/linux/x64/release/bundle"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r * "$pkgdir/opt/${pkgname%-git}"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/pangolin_desktop" "$pkgdir/usr/bin/${pkgname%-git}"

  convert \
    "$srcdir/pangolin_desktop/assets/images/logos/pangolin.png" \
    -resize 1024 "$srcdir/pangolin-1024.png"
  install -Dm644 "$srcdir/pangolin-1024.png" \
    "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
