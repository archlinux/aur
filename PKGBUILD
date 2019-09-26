# Maintainer:  Christoph Mohr <christoph.mohr@gmail.com>
# Contributor:  Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=ferdi-git
_pkgver=5.3.4
pkgver=${_pkgver//-/_}
pkgrel=3
pkgdesc='Free messaging app for services like WhatsApp, Slack, Messenger and many more. fork removing the non-skippable app delay frequently inviting you to buy a licence'
arch=(x86_64 i686)
url='https://getferdi.com/'
license=(Apache)
conflicts=('ferdi')
depends=(electron4)
makedepends=(expac git npm python2)
source=('git://github.com/getferdi/ferdi.git'
        'ferdi.desktop'
        'ferdi.sh')
sha512sums=('SKIP'
            'e09649fd9daa2b8391ae7a60e3f81c056269d71afc22fe891c89611eb6c927a2b3b9e0bc69aeb859d75bb8bc7a104197d9f956345bd227a5ac995ef93a2bb68c'
            '54586148db4c1df88099485beae49f7a069fdcbca35ebb4fb3df3a15963f295712d8d9dfeddb1402b3676447eb2e9ea07b28808b0c611fca72617e32777ea7e8')

prepare() {
  # Prepare Python 2 for later
  mkdir python2_path
  ln -s `which python2` python2_path/python

  # Small patching
  cd ferdi
  git submodule update --init --recursive


  # Prevent ferdi from being launched in dev mode
  sed -i "s|export const isDevMode = .*|export const isDevMode = false;|g" \
    src/environment.js
  sed -i "s|import isDevMode from 'electron-is-dev'|export const isDevMode = false|g" \
    src/index.js

  # Adjust the electron version to use when building
  electron_version="`expac %v electron4 | cut -d'-' -f1`"
  sed -i "s|\(\s\+\"electron4\":\).*,|\1 \"$electron_version\",|" package.json

  # Adjust node-sass version to avoid build issues
  npm install "node-sass@4.12.0"
  # Prepare the packages for building
}

build() {
  cd ferdi

  # Better configuration for npm cache and calling installed binaries
  export npm_config_cache="$srcdir"/npm_cache
  export PATH="$srcdir/ferdi/node_modules/.bin:$srcdir/python2_path:$PATH"

  
  npm install lerna
  lerna bootstrap
 
  gulp build
  electron-builder --linux dir
}

package() {
  cd ferdi
  # Install the .asar files
  install -dm 755 "$pkgdir"/usr/lib/ferdi
  cp -r --no-preserve=ownership --preserve=mode out/linux-unpacked/resources "$pkgdir"/usr/lib/ferdi/

  # Install icon
  install -Dm 644 "$srcdir"/ferdi.desktop "$pkgdir"/usr/share/applications/ferdi.desktop
  install -Dm 644 build-helpers/images/icon.png "$pkgdir"/usr/share/icons/ferdi.png

  # Install run script
  install -Dm 755 "$srcdir"/ferdi.sh "$pkgdir"/usr/bin/ferdi
}

