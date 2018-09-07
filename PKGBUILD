# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=franz
_pkgver=5.0.0-beta.18
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Free messaging app for services like WhatsApp, Slack, Messenger and many more."
arch=('x86_64' 'i686')
url="https://meetfranz.com"
license=('Apache')
depends=('electron' 'libx11' 'libxkbfile' 'libxext' 'libxss' 'gconf' 'gtk2' 'alsa-lib' 'nss' 'libxtst')
makedepends=('yarn' 'npm' 'python2' 'git' 'nodejs-lts-carbon')
source=("$pkgname-$pkgver.tar.gz::https://github.com/meetfranz/$pkgname/archive/v$_pkgver.tar.gz"
        'franz.desktop'
        'franz.sh')
sha512sums=('26a7e86d9860138c0dc314c870881509f6a8a0fa9fc5f12cb6e9b03a11698b199d9e23adaf76511f525c7c8803bb8d7d8afc885f8cbae9287d30ee5b6f17662a'
            'ef7c06558f60259dd29ead644327a0030c2c26637e51e3ec27a05542efd4752d68a3f4322973f6a90d6658686abce12700a3ad57aff9e517d0c907c952d7a034'
            '8584507cfc2736f4736637925536b2c06063c59cd943346717633564ae88b64c5eea294c8897f1250812478ed493f54a470501e98e99d084a2ff012dff9671f8')

prepare() {
  # Fix electron-updater version
  sed -i "s|\"electron-updater\":.*|\"electron-updater\": \"^3.0.3\",|g" \
        $pkgname-$_pkgver/package.json
}

build() {
  cd $pkgname-$_pkgver
  yarn install --production --non-interactive
  yarn add 'electron-builder#28.0.0' 'gulpjs/gulp#4.0'

  # Better configuration for npm cache and calling installed binaries
  export npm_config_cache="$srcdir"/npm_cache
  export PATH="$srcdir"/$pkgname-$_pkgver/node_modules/.bin:$PATH

  gulp build
  electron-builder --linux dir
}

package() {
  cd $pkgname-$_pkgver

  # Install the .asar files
  install -dm 755 "$pkgdir"/usr/lib/$pkgname
  cp -r --no-preserve=ownership --preserve=mode out/linux-unpacked/resources "$pkgdir"/usr/lib/$pkgname/

  # Install icon
  install -Dm 644 "$srcdir"/franz.desktop "$pkgdir"/usr/share/applications/franz.desktop
  install -Dm 644 build-helpers/images/icon.png "$pkgdir"/usr/share/icons/franz.png

  # Install run script
  install -Dm 755 "$srcdir"/franz.sh "$pkgdir"/usr/bin/franz
}
