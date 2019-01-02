# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=franz
_pkgver=5.0.0-beta.22
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='Free messaging app for services like WhatsApp, Slack, Messenger and many more.'
arch=('x86_64' 'i686')
url='https://meetfranz.com'
license=('Apache')
depends=('electron' 'libx11' 'libxkbfile' 'libxext' 'libxss' 'gconf' 'gtk2' 'alsa-lib' 'nss' 'libxtst')
makedepends=('yarn' 'npm' 'python2' 'git' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/meetfranz/$pkgname/archive/v$_pkgver.tar.gz"
        'franz.desktop'
        'franz.sh')
sha512sums=('f8ece632bc091f2daab12c387059d36218784d87f129614786bd448730739e4a2de38c932ccb8dc72691d0679375d3e7b00f5220247193c779d799319f33e1f0'
            'ef7c06558f60259dd29ead644327a0030c2c26637e51e3ec27a05542efd4752d68a3f4322973f6a90d6658686abce12700a3ad57aff9e517d0c907c952d7a034'
            '8584507cfc2736f4736637925536b2c06063c59cd943346717633564ae88b64c5eea294c8897f1250812478ed493f54a470501e98e99d084a2ff012dff9671f8')

prepare() {
  cd $pkgname-$_pkgver

  # Fix electron-updater version
  sed -i "s|\"electron-updater\":.*|\"electron-updater\": \"^4.0.0\",|g" \
  	package.json

  # Prevent franz from being launched in dev mode
  sed -i "s|export const isDevMode = .*|export const isDevMode = false;|g" \
  	 src/environment.js
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

