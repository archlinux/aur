# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=franz
pkgver=5.0.0_beta.17
pkgrel=1
pkgdesc="Free messaging app for services like WhatsApp, Slack, Messenger and many more."
arch=('i686' 'x86_64')
url="https://meetfranz.com/"
license=('Apache')
depends=('nodejs' 'libx11' 'libxext' 'libxss' 'libxkbfile' 'gconf')
makedepends=('yarn' 'npm' 'git' 'python2')
conflicts=('franz-bin')
source=("https://github.com/meetfranz/$pkgname/archive/v${pkgver//_/-}.tar.gz"
        "franz.desktop")
sha256sums=('380874f4189a54994a46c99380bbda441ff563fe70e95062e12500dc5f8432be'
            '79813a0f7db258fc7c4969cc20b412771530865bec36c0a4b9e18a2e435d97b8')

prepare() {
  cd "$pkgname-${pkgver//_/-}"
  sed -i 's/"electron-updater": "[0-9.^]*"/"electron-updater": "^2.18.2"/' package.json
  sed -i 's/"electron-builder": "[0-9.^]*"/"electron-builder": "^19.47.0"/' package.json
}

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
