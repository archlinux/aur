# Maintainer: Zach Himsel <zach at himsel dot net>
pkgname='mqtt-explorer'
pkgver=0.3.5
pkgrel=13
pkgdesc="A comprehensive and easy-to-use MQTT Client"
arch=('x86_64')
url="https://mqtt-explorer.com/"
license=('CCPL:by-nd')
depends=('nodejs>=17')
makedepends=(
    'git'
    'npm'
    'sed'
    'yarn')
conflicts=('mqtt-explorer-beta') # currently, both programs cannot use the same config file
options=(!strip)
source=(
    "$pkgname-${pkgver}.tar.gz::https://github.com/thomasnordquist/MQTT-Explorer/archive/v$pkgver.tar.gz"
    "mqtt-explorer.desktop"
    "mqtt-explorer-run.sh")
md5sums=('66b04e6991416cf8be67c0d8c3706477'
         '191b5beaddfa840771619ef35aad30ae'
         'ac7b4f2e887c368e68c211ce47207e7b')

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
  mkdir -p "${pkgdir}/usr/share/$pkgname"
  cp -rT "MQTT-Explorer-${pkgver}" "${pkgdir}/usr/share/$pkgname"

  install -Dm 0644 "${srcdir}/mqtt-explorer.desktop" "${pkgdir}/usr/share/applications/mqtt-explorer.desktop"
  install -Dm 0755 "${srcdir}/mqtt-explorer-run.sh" "${pkgdir}/usr/bin/mqtt-explorer"
}
