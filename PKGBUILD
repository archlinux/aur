# Maintainer:  Christoph Mohr <christoph.mohr@gmail.com>
# Contributor:  Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=ferdi-git
_pkgver=5.3.4
pkgver=${_pkgver//-/_}
pkgrel=4
pkgdesc='Free messaging app for services like WhatsApp, Slack, Messenger and many more. fork removing the non-skippable app delay frequently inviting you to buy a licence'
arch=(x86_64 i686)
url='https://getferdi.com/'
license=(Apache)
conflicts=('ferdi')
depends=(electron)
makedepends=(expac git npm python2)
source=('git://github.com/getferdi/ferdi.git'
        'git://github.com/getferdi/recipes.git'
        'ferdi.desktop'
        'ferdi.sh')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  # Prepare Python 2 for later
  mkdir python2_path
  ln -s `which python2` python2_path/python

  # Small patching
  cd ferdi/recipes
  git submodule init
  git config submodule.recipes.url $srcdir/recipes
  
  git submodule update --init --recursive

  cd ..

  # Prevent ferdi from being launched in dev mode
  sed -i "s|export const isDevMode = .*|export const isDevMode = false;|g" \
    src/environment.js
  sed -i "s|import isDevMode from 'electron-is-dev'|export const isDevMode = false|g" \
    src/index.js

  # Adjust node-sass version to avoid build issues
  npm install "node-sass@4.12.0"
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
  install -Dm 755 out/linux-unpacked/resources/app.asar "$pkgdir/usr/lib/ferdi/resources/app.asar"

  # Install icon
  install -Dm 644 "$srcdir/ferdi.desktop" "$pkgdir/usr/share/applications/ferdi.desktop"
  install -Dm 644 build-helpers/images/icon.png "$pkgdir/usr/share/icons/ferdi.png"

  # Install run script
  install -Dm 755 "$srcdir/ferdi.sh" "$pkgdir/usr/bin/ferdi"
}


