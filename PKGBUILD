# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=franz
pkgver=5.0.0_beta.11
pkgrel=1
pkgdesc="Free messaging app for services like WhatsApp, Slack, Messenger and many more."
arch=('i686' 'x86_64')
url="https://meetfranz.com/"
license=('Apache')
depends=('electron' 'libx11' 'libxext' 'libxss' 'libxkbfile')
makedepends=('yarn')
conflicts=('franz-bin')
source=("https://github.com/meetfranz/$pkgname/archive/v${pkgver//_/-}.tar.gz"
        "franz.desktop")
sha256sums=('3819abb6aa4af7615053aa3d48648d27790876b3bdb2029d06323ffcc0bb1bc9'
            'fdff998af9ad9e65d9b86a4469718b9e82c82356fd42904ade69ab5f72a25121')

build() {
  cd "$pkgname-${pkgver//_/-}"
  yarn install --production --non-interactive
  yarn add electron-builder gulpjs/gulp#4.0
  node_modules/.bin/gulp build
  node_modules/.bin/electron-builder --linux dir
}

package() {
  cd "$pkgname-${pkgver//_/-}"

  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share"
  cp -r --preserve=mode out/linux-unpacked "$pkgdir/usr/share/franz"

  install -Dm644 "$srcdir/franz.desktop" "$pkgdir/usr/share/applications/franz.desktop"
  install -Dm644 "build-helpers/images/icon.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/franz.png"
  ln -s "/usr/share/franz/franz" "$pkgdir/usr/bin/franz"
}
