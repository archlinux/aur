# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=pebble-sdk
pkgver=2.1.1
pkgrel=2
pkgdesc="Pebble SDK, used to develop applications and watchfaces for the Pebble Smartwatch."
url="https://developer.getpebble.com/2/getting-started/"
arch=('i386' 'x86_64')
license=('custom' 'MIT')
install='pebble-sdk.install'
depends=('arm-none-eabi-gcc' 'python2-pypng' 'python2-autobahn'
         'python2-pyserial' 'python2-sh' 'twisted' 'python2-freetype-py'
         'python2-websocket-client-pebble' 'arm-none-eabi-binutils')
source=("http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk2/PebbleSDK-${pkgver}.tar.gz"
        'python-waf.patch'
        'build-command.patch'
        'pebble-sdk.install')
sha1sums=('d22f1e62c1135fa6de6a42ce0c7b135d6dd66ce4'
          'cd95ccc69820eee60e8e6ff9d85d6edeb7c3b6a8'
          '215c4e3d6b3d4649b4baae27fae66c3d596a307c'
          'a78207f3f9d316950db8979f1045cceabd0f3fa7')
options=('staticlibs' '!strip')

prepare() {
  cd "$srcdir/PebbleSDK-${pkgver//_/-}"
  find . -type f \( -path ./bin/pebble -o -path ./Pebble/waf -o \
                    -name '*.py' \) -exec \
    sed -i '1s|^#!/usr/bin/env python$|#!/usr/bin/python2|' {} \;
  patch -p0 -i "$srcdir/build-command.patch"
  # Unpack waf and fix python files
  cd Pebble
  ./waf 2>/dev/null || true
  cd .waf*
  find . -type f -name '*.py' -exec \
    sed -i '1s|^#! /usr/bin/env python$|#!/usr/bin/python2|' {} \;
  patch -p0 -i "$srcdir/python-waf.patch"
}

package() {
  install -dm755 "$pkgdir/opt/pebble"
  install -dm755 "$pkgdir/usr/bin"
  cd "$srcdir/PebbleSDK-${pkgver//_/-}"
  cp -R * "$pkgdir/opt/pebble"
  rm -r "$pkgdir/opt/pebble/bin"
  ln -s "/opt/pebble/tools/pebble.py" "$pkgdir/usr/bin/pebble"
  touch "$pkgdir/opt/pebble/NO_TRACKING"
}

# vim:set ts=2 sw=2 et:
