# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Adapted for dp1 version by Semyon Maryasin <simeon@maryasin.name>
# Adapted for beta12/release by Adam Goldsmith <contact@adamgoldsmith.name>
# vim: ft=sh

pkgname=pebble-sdk
pkgver=3.0
pkgrel=2
pkgdesc="Pebble SDK, used to develop applications and watchfaces for the Pebble Smartwatch."
url="https://developer.getpebble.com/2/getting-started/"
arch=('i386' 'x86_64')
license=('custom' 'MIT')
install='pebble-sdk.install'
depends=('arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'arm-none-eabi-binutils'
         'libpng12'
         'python2-freetype-py'
         'python2-sh'
         'python2-websocket-client-pebble'
         'python2-pypng'
         'python2-oauth2client'
         'python2-requests'
         'python2-gevent'
         'python2-gevent-websocket'
         'python2-greenlet'
         'python2-peewee'
         'python2-pygeoip'
         'python2-dateutil'
         'python2-six'
         'python2-wsgiref'
         'python2-twisted'
         'python2-autobahn'
         'qemu-fdt')
#         'pypy-backports.ssl_match_hostname'

optdepends=('python2-pyserial: To connect to the Pebble via serial port')
conflicts=('pebble-sdk-beta')
source=("http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk2/PebbleSDK-${pkgver/_/-}.tar.gz"
        'build-command.patch'
        'pebble-sdk.install'
        'pflashFix.patch'
        'python-exec.patch')
sha1sums=('de170797466b8f981f0189456dfed52d9078a830'
          '104715902f0bb884130b9b4395343b2f9bffcc88'
          '7ea5244f828e682d073434078569fab62a1ad996'
          'f8fde627224b7515856dabed3bfcbfa8c8821fa5'
          'e4ed6cca5ffa86b1847c7c601b70280c1139b594')
options=('staticlibs' '!strip')

prepare() {
  cd "$srcdir/PebbleSDK-${pkgver//_/-}"

  # patch for python2 -> python3
  find . -type f \( -path ./bin/pebble -o -path ./Pebble/waf -o \
                    -name '*.py' \) -exec \
    sed -i '1s|^#!/usr/bin/env python$|#!/usr/bin/python2|' {} \;
  patch -p0 -i "$srcdir/build-command.patch"

  # patch phone emulator files to make qemu_micro_flash be accessed readonly
  patch -p0 -i "$srcdir/pflashFix.patch"

  # patch the python executable stub so it handles newlines
  patch -p0 -i "$srcdir/python-exec.patch"

  # Unpack waf and fix python files
  cd Pebble
  ./waf 2>/dev/null || true
  cd .waf*
  find . -type f -name '*.py' -exec \
    sed -i '1s|^#! /usr/bin/env python$|#!/usr/bin/python2|' {} \;
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
