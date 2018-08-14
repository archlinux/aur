# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=franz
_pkgver=5.0.0-beta.18
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Free messaging app for services like WhatsApp, Slack, Messenger and many more."
arch=('i686' 'x86_64')
url="https://meetfranz.com"
license=('Apache')
depends=('nodejs' 'libx11' 'libxkbfile' 'libxext' 'libxss' 'gconf' 'gtk2' 'alsa-lib' 'nss' 'libxtst' 'nodejs-nan')
makedepends=('npm' 'python2')
source=("https://github.com/meetfranz/$pkgname/archive/v$_pkgver.tar.gz"
	'franz.desktop')
sha256sums=('24768724ea51cc27ccb16997151f0f012c5dd4198ecf32b29826165ef294f2a2'
	    '79813a0f7db258fc7c4969cc20b412771530865bec36c0a4b9e18a2e435d97b8')

build() {
  cd $pkgname-$_pkgver
  npm install --production --non-interactive
  npm add electron-builder gulpjs/gulp#4.0
  node_modules/.bin/gulp build
  node_modules/.bin/electron-builder --linux dir
}

package() {
  cd $pkgname-$_pkgver

  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share
  cp -r --no-preserve=ownership --preserve=mode out/linux-unpacked "$pkgdir"/usr/share/franz

  install -Dm644 "$srcdir"/franz.desktop "$pkgdir"/usr/share/applications/franz.desktop
  install -Dm644 build-helpers/images/icon.png "$pkgdir"/usr/share/icons/hicolor/1024x1024/apps/franz.png
  ln -s /usr/share/franz/franz "$pkgdir"/usr/bin/franz
}
