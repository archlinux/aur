# Maintainer:  Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=franz
_pkgver=5.4.1
pkgver=${_pkgver//-/_}
pkgrel=3
# Due to the previous "_beta" naming
epoch=1
pkgdesc='Free messaging app for services like WhatsApp, Slack, Messenger and many more.'
arch=(x86_64 i686)
url='https://meetfranz.com'
license=(Apache)
# Allow to easily switch between Electron versions.
# Expected one is 'electron6', but you can easily switch to mainstream one with
# 'electron'; remember to replace it also in `franz.sh`
_electron='electron6'
depends=($_electron)
makedepends=(expac git npm python)
source=("git+https://github.com/meetfranz/$pkgname#tag=v$_pkgver"
        'franz.desktop'
        'franz.sh')
sha512sums=('SKIP'
            '049c4bf2e0f362f892e8eef28dd18a6c321251c686a9c9e49e4abfb778057de2fc68b95b4ff7bb8030a828a48b58554a56b810aba078c220cb01d5837083992e'
            'd9045b23fd8f2867f845d1c3b579b0fc6c7cf1a4120b9add3d545ff68736b444a21795526eb191b5e76622bd848c75e599ac145137f63375b4fae67490d99f8a')

prepare() {
  # Small patching
  cd $pkgname

  # Prevent franz from being launched in dev mode
  sed -i \
    "s|export const isDevMode = .*|export const isDevMode = false;|g" \
    src/environment.js
  sed -i \
    "s|import isDevMode from 'electron-is-dev'|export const isDevMode = false|g" \
    src/index.js

  # Adjust the electron version to use when building
  electron_version="`expac %v $_electron | cut -d'-' -f1`"
  sed -i "s|\(\s\+\"electron\":\).*,|\1 \"$electron_version\",|" package.json

  # Better configuration for npm cache and calling installed binaries
  export npm_config_cache="$srcdir"/npm_cache

  # Install tricky dependencies before-hand
  npm install node-sass@4.13.1

  # Prepare the packages for building
  npx lerna bootstrap
}

build() {
  cd $pkgname

  # Better configuration for npm cache and calling installed binaries
  export npm_config_cache="$srcdir"/npm_cache

  # Actually build the package
  npx gulp build
  npx electron-builder --linux dir
}

package() {
  cd $pkgname

  # Install the .asar files
  install -dm 755 "$pkgdir"/usr/lib/$pkgname
  cp -r --no-preserve=ownership --preserve=mode out/linux-unpacked/resources "$pkgdir"/usr/lib/$pkgname/

  # Install icon
  install -Dm 644 "$srcdir"/franz.desktop "$pkgdir"/usr/share/applications/franz.desktop
  install -Dm 644 build-helpers/images/icon.png "$pkgdir"/usr/share/icons/franz.png

  # Install run script
  install -Dm 755 "$srcdir"/franz.sh "$pkgdir"/usr/bin/franz
}
