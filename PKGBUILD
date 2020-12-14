# Maintainer:  Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=franz
#pkgver=${_pkgver//-/_} # Leaving it here for possible dev/beta package :)
pkgver=5.6.1
pkgrel=2
# Due to the previous "_beta" naming
epoch=1
pkgdesc='Free messaging app for services like WhatsApp, Slack, Messenger and many more.'
arch=(x86_64 i686)
url='https://meetfranz.com'
license=(Apache)
# Allow to easily switch between Electron versions.
# Expected one is 'electron9' (Electron 9). May change soon.
# This is automatically replaced in `franz.sh` with the package name, as
# the executable matches the package name (as of 2020-11-15).
_electron='electron'
depends=($_electron)
makedepends=(expac git npm python python2)
source=("git+https://github.com/meetfranz/$pkgname#tag=v$pkgver"
        franz.desktop
        franz.sh.in)
sha512sums=('SKIP'
            '049c4bf2e0f362f892e8eef28dd18a6c321251c686a9c9e49e4abfb778057de2fc68b95b4ff7bb8030a828a48b58554a56b810aba078c220cb01d5837083992e'
            '7ccf058421b173830493f35417d204e3a735fc20f801283dad3f658abeb484f6244bc535634c2f02ab2cb8e35a0e1a92dd3d06be5943e121ddccbbee7ad74b48')

prepare() {
  # Small patching
  cd "$pkgname"

  # Adjust the electron version to use when building
  echo "--> Using Electron package: $_electron"
  electron_version="`expac %v $_electron | cut -d'-' -f1`"
  sed -i -E "s|(\s+\"electron\":).*,|\1 \"$electron_version\",|" package.json

  # Prevent franz from being launched in dev mode
  sed -i \
    "s|export const isDevMode = .*|export const isDevMode = false;|g" \
    src/environment.js
  sed -i \
    "s|import isDevMode from 'electron-is-dev'|export const isDevMode = false|g" \
    src/index.js

  # Better configuration for npm cache and calling installed binaries
  export npm_config_cache="$srcdir/npm_cache"

  # Prepare the packages for building
  npx lerna bootstrap
}

build() {
  cd "$pkgname"

  # Better configuration for npm cache and calling installed binaries
  export npm_config_cache="$srcdir/npm_cache"

  # Actually build the package
  npx gulp build
  npx electron-builder --linux dir
}

package() {
  cd $pkgname

  # Point the proper Electron package version, so that people can complain when it's updated.
  # This is for extra safety & reminds me of upgrading the package.
  electron_version="`expac %v $_electron | cut -d'-' -f1`"
  depends=("${_electron}=${electron_version}")

  # Install the .asar files
  install -dm 755 "$pkgdir/usr/lib/$pkgname"
  cp -r --no-preserve=ownership --preserve=mode out/linux-unpacked/resources "$pkgdir/usr/lib/$pkgname/"

  # Install icon
  install -Dm 644 "$srcdir/franz.desktop" "$pkgdir/usr/share/applications/franz.desktop"
  install -Dm 644 build-helpers/images/icon.png "$pkgdir/usr/share/icons/franz.png"

  # Install run script
  sed "s|@ELECTRON@|$_electron|" "$srcdir/franz.sh.in" > franz.sh
  install -Dm 755 franz.sh "$pkgdir/usr/bin/franz"
}
