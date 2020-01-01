# Maintainer:  Christoph Mohr <christoph.mohr@gmail.com>
# Contributor:  Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=ferdi
_pkgver="5.4.1-beta.4"
# use beta because of electron 7 compatibility
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='Ferdi is a messaging browser that allows you to combine your favorite messaging services into one application.'
arch=(x86_64 i686)
url='https://getferdi.com/'
license=(Apache)
depends=(electron)
conflicts=('ferdi-git')
makedepends=(expac git npm python2)
_recipes=ecf037c
_server=cca6cd9
source=("git+https://github.com/getferdi/$pkgname#tag=v$_pkgver"
        "git+https://github.com/getferdi/recipes#commit=${_recipes}"
        "git+https://github.com/getferdi/internal-server#commit=${_server}"
        'ferdi.desktop'
        'ferdi.sh')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  # Prepare Python 2 for later
  mkdir python2_path
  ln -s `which python2` python2_path/python

  cd ferdi
  git submodule init
  git config submodule.recipes.url $srcdir/recipes
  git config submodule.src/internal-server.url $srcdir/internal-server

  git submodule update --init --recursive

  # Prevent ferdi from being launched in dev mode
  sed -i "s|export const isDevMode = .*|export const isDevMode = false;|g" \
    src/environment.js
  sed -i "s|import isDevMode from 'electron-is-dev'|export const isDevMode = false|g" \
    src/index.js

  # Adjust the electron version to use when building
  electron_version="`expac %v electron | cut -d'-' -f1`"
  sed -i "s|\(\s\+\"electron\":\).*,|\1 \"$electron_version\",|" package.json

  # Better configuration for npm cache and calling installed binaries
  export npm_config_cache="$srcdir"/npm_cache
  export PATH="$srcdir/$pkgname/node_modules/.bin:$srcdir/python2_path:$PATH"

  # Adjust node-sass version to avoid build issues
  npm install "node-sass@4.13.0"

  # Prepare the packages for building
  npm install lerna
  lerna bootstrap
}

build() {
  cd ferdi

  # Better configuration for npm cache and calling installed binaries
  export npm_config_cache="$srcdir"/npm_cache
  export PATH="$srcdir/ferdi/node_modules/.bin:$srcdir/python2_path:$PATH"

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

