# Maintainer: Anton Arnold <aarnold.arch at antonarnold de>
pkgname='mqtt-explorer-beta'
gitver=0.4.0
betaver=3
pkgver=${gitver}.${betaver}
pkgrel=3
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
conflicts=('mqtt-explorer')
provides=('mqtt-explorer')
options=(!strip)
source=("$pkgname-${pkgver}-beta${betaver}.tar.gz::https://github.com/thomasnordquist/MQTT-Explorer/archive/refs/tags/${gitver}-beta${betaver}.tar.gz"
        "mqtt-explorer.desktop"
        "mqtt-explorer-run.sh")
md5sums=('754d67825c99508c80e4403cbed29b2b'
         '8659ae3b43edeefb5f4be07a502a4c68'
         '08bd1c33f5fdbdf8054ee1874289cf1b')

build() {
  cd "MQTT-Explorer-${gitver}-beta${betaver}"

  sed -i 's/"heapdump": "^0.3.12",//' app/package.json
  sed -i 's/if (!/\/*if (!/' app/src/components/Demo/index.tsx
  sed -i 's/return path/\*\/return path/' app/src/components/Demo/index.tsx

  export NODE_OPTIONS=--openssl-legacy-provider
  yarn || sed -i 's/node-gyp rebuild/node-gyp rebuild --openssl_fips=X/' app/package.json
  yarn build
}

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -rT "MQTT-Explorer-${gitver}-beta${betaver}" "${pkgdir}/usr/share/${pkgname}"

  install -Dm 0644 "${srcdir}/mqtt-explorer.desktop" "${pkgdir}/usr/share/applications/mqtt-explorer-beta.desktop"
  install -Dm 0755 "${srcdir}/mqtt-explorer-run.sh" "${pkgdir}/usr/bin/mqtt-explorer-beta"
}
