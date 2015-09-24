# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Adapted for dp1 version by Semyon Maryasin <simeon@maryasin.name>
# Adapted for beta12/release by Adam Goldsmith <contact@adamgoldsmith.name>
# vim: ft=sh

pkgname=pebble-sdk
pkgver=3.4
pkgrel=1
pkgdesc="Pebble SDK, used to develop applications and watchfaces for the Pebble Smartwatch."
url="https://developer.getpebble.com/2/getting-started/"
arch=('i386' 'x86_64')
license=('custom' 'MIT')
install='pebble-sdk.install'
depends=('arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'arm-none-eabi-binutils'
         'libpng12'
         'python2-freetype-py'
         'python2-sh'
         'python2-libpebble2-git'
         'python2-enum34'
         'python2-httplib2'
         'python2-oauth2client'
         'python2-progressbar'
         'python2-pyasn1'
         'python2-pyasn1-modules'
         'python2-pypng'
		 'python2-pyqrcode'
         'python2-requests'
         'python2-rsa'
         'python2-six'
         'python2-websocket-client'
         'python2-wheel'
         'python2-colorama'
         'python2-pyserial'
         'python2-gevent'
         'python2-gevent-websocket'
         'python2-greenlet'
         'python2-peewee'
         'python2-pygeoip'
         'python2-dateutil'
         'python2-wsgiref')
optdepends=('qemu-fdt')
conflicts=('pebble-sdk-beta')
source=("http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk2/PebbleSDK-${pkgver/_/-}.tar.gz"
        'pebble-sdk.install'
        'pflashFix.patch'
        'analyticsFix.patch'
		'buildFix.patch'
        'pebble.sh')
sha1sums=('2d895ba0746aeccb43863d43b641a4b192fc0bb5'
          '7ea5244f828e682d073434078569fab62a1ad996'
          '050db72f8259daac7bd0605369677e69ecca7821'
          'b0988936c15f98202fc13323a21452794acdbbde'
          'dfa24b631be575d8dce5ee6045a87ede4c0ac9e3'
          'af0c0deb6e474318a4dc81442d39d9d8befc9685')
options=('staticlibs' '!strip')

prepare() {
  cd "$srcdir/PebbleSDK-${pkgver//_/-}"
  # patch phone emulator files to make qemu_micro_flash be accessed readonly
  patch -p0 -i "$srcdir/pflashFix.patch"

  # patch analytics NO_TRACKING path
  patch -p0 -i "$srcdir/analyticsFix.patch"

  # fix for broken python2/3 detection
  patch -p0 -i "$srcdir/buildFix.patch"

  # Unpack waf
  cd Pebble
  python2 ./waf 2>/dev/null || true
}

package() {
  install -dm755 "$pkgdir/opt/pebble"
  install -dm755 "$pkgdir/usr/bin"
  cd "$srcdir/PebbleSDK-${pkgver//_/-}"
  cp -R Pebble Examples Documentation version.txt README.txt pebble-tool "$pkgdir/opt/pebble"
  cp "$srcdir/pebble.sh" "$pkgdir/usr/bin/pebble"
  touch "$pkgdir/opt/pebble/NO_TRACKING"
}

# vim:set ts=2 sw=2 et:
