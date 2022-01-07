# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pangolin-desktop-git
pkgver=dap.sigma.r25.g62fc2b74
pkgrel=1
epoch=1
pkgdesc="Preview of Pangolin Desktop UI shell, designed for dahliaOS, written in Flutter."
arch=('x86_64')
url="https://github.com/dahliaOS/pangolin_desktop"
license=('Apache')
depends=('gtk3')
makedepends=('git' 'flutter-git' 'cmake' 'ninja' 'imagemagick')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dahliaOS/pangolin_desktop.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'f9b790200ac34e3dc038b0bc3366d91c08239762466ccc383fc2eb8f03ad2c02')

pkgver() {
  cd "$srcdir/pangolin_desktop"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/pangolin_desktop"
  flutter channel master
  flutter upgrade
  flutter config --enable-linux-desktop
  flutter build linux
}

package() {
  cd "$srcdir/pangolin_desktop/build/linux/release/bundle"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r * "$pkgdir/opt/${pkgname%-git}"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/pangolin_desktop" "$pkgdir/usr/bin/${pkgname%-git}"

  convert \
    data/flutter_assets/assets/images/logos/dahliaOS-logo.png \
      -resize 1024 "$srcdir/dahliaOS_logo-1024.png"
  install -Dm644 "$srcdir/dahliaOS_logo-1024.png" \
    "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"

  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
