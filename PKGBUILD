# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=pebble-sdk
pkgver=2.0.2
pkgrel=2
pkgdesc="Pebble SDK, used to develop applications and watchfaces for the Pebble Smartwatch."
url="https://developer.getpebble.com/2/getting-started/"
arch=('i386' 'x86_64')
license=('custom' 'MIT')
depends=('arm-none-eabi-gcc' 'python2-pypng' 'python2-autobahn'
         'python2-pyserial' 'python2-sh' 'twisted' 'python2-freetype-py'
         'python2-websocket-client-pebble' 'arm-none-eabi-binutils')
source=('python-waf.patch')
_sdk_sha1sum='c6e2cefb638ebcfffae31c6cc3b175d3e62b3c44'
sha1sums=('cd95ccc69820eee60e8e6ff9d85d6edeb7c3b6a8')
options=('staticlibs' '!strip')

prepare() {
  if [[ -r "$startdir/PebbleSDK-${pkgver//_/-}.tar.gz" ]]; then
    cd "$startdir"
  else
    echo "Please download the Pebble SDK from:"
    echo "https://developer.getpebble.com/2/download/PebbleSDK-${pkgver//_/-}.tar.gz"
    echo "(be sure to be logged in with a Pebble developer account)"
    echo "Then place it in /tmp and press Enter."
    read _
    cd /tmp
    if [[ ! -r "PebbleSDK-${pkgver//_/-}.tar.gz" ]]; then
      echo "Error: PebbleSDK-${pkgver//_/-}.tar.gz does not exist in /tmp!"
      exit 1
    fi
  fi
  echo -e "$_sdk_sha1sum\tPebbleSDK-${pkgver//_/-}.tar.gz" > "$srcdir/SHA1SUMS"
  sha1sum --quiet -c "$srcdir/SHA1SUMS"
  msg "Extracting sources..."
  tar -zxf "PebbleSDK-${pkgver//_/-}.tar.gz" -C "$srcdir"
  cd "$srcdir/PebbleSDK-${pkgver//_/-}"
  msg "Patching shebangs..."
  find . -type f \( -path ./bin/pebble -o -path ./Pebble/waf -o \
                    -name '*.py' \) -exec \
    sed -i '1s|^#!/usr/bin/env python$|#!/usr/bin/python2|' {} \;
}

package() {
  install -dm755 "$pkgdir/opt/pebble"
  install -dm755 "$pkgdir/usr/bin"
  cd "$srcdir/PebbleSDK-${pkgver//_/-}"
  cp -R * "$pkgdir/opt/pebble"
  rm -r "$pkgdir/opt/pebble/bin"
  ln -s "/opt/pebble/tools/pebble.py" "$pkgdir/usr/bin/pebble"
  # Unpack waf and fix python files
  cd "$pkgdir/opt/pebble/Pebble/"
  ./waf 2>/dev/null || true
  cd .waf*
  msg "Patching waf..."
  find . -type f -name '*.py' -exec \
    sed -i '1s|^#! /usr/bin/env python$|#!/usr/bin/python2|' {} \;
  patch -p0 -i "$srcdir/python-waf.patch"
}

# vim:set ts=2 sw=2 et:
