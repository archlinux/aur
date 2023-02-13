# Maintainer: Zach Himsel <zach at himsel dot net>
pkgname='mqtt-explorer'
pkgver=0.3.5
pkgrel=8
pkgdesc="A comprehensive and easy-to-use MQTT Client"
arch=('any')
url="https://mqtt-explorer.com/"
license=('CCPL:by-nd')
depends=(
    'npm'
    'yarn'
    )
makedepends=(
    'git'
    'sed'
    )
conflicts=('mqtt-explorer-beta') # currently, both programs cannot use the same config file
backup=("~/.config/MQTT-Explorer/settings.json")
options=(!strip)
validpgpkeys=("4AEE18F83AFDEB23")
source=(
    "$pkgname-${pkgver}.tar.gz::https://github.com/thomasnordquist/MQTT-Explorer/archive/v$pkgver.tar.gz"
    "$pkgname-${pkgver}-desktop.tar.gz::https://github.com/dave12311/mqtt-explorer.desktop/archive/1.1.tar.gz"
    )
md5sums=(
    '66b04e6991416cf8be67c0d8c3706477'
    '306a5ee73ab04fee5eb0f8202d2d90a1'
    )

build() {
  cd "MQTT-Explorer-${pkgver}"

  sed -i 's/"heapdump": "^0.3.12",//' app/package.json
  sed -i 's/if (!/\/*if (!/' app/src/components/Demo/index.tsx
  sed -i 's/return path/\*\/return path/' app/src/components/Demo/index.tsx

  export NODE_OPTIONS=--openssl-legacy-provider
  yarn || sed -i 's/node-gyp rebuild/node-gyp rebuild --openssl_fips=X/' app/package.json
  yarn build
}

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r MQTT-Explorer-${pkgver}/* $pkgdir/usr/share/$pkgname/
  mkdir -p "$pkgdir/usr/share/applications"
  cp mqtt-explorer.desktop-1.1/mqtt-explorer.desktop $pkgdir/usr/share/applications/
  mkdir -p "$pkgdir/usr/bin"
  echo "#!/bin/bash" > "$pkgdir/usr/share/$pkgname/$pkgname"
  echo "yarn --cwd /usr/share/mqtt-explorer start" >> "$pkgdir/usr/share/$pkgname/$pkgname"
  chmod 777 "$pkgdir/usr/share/$pkgname/$pkgname"
  ln -s "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
