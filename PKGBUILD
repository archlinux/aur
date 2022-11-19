# Maintainer: Anton Arnold <aarnold.arch at antonarnold de>
pkgname='mqtt-explorer-beta'
gitver=0.4.0
betaver=3
pkgver=${gitver}.${betaver}
pkgrel=2
pkgdesc="A comprehensive and easy-to-use MQTT Client"
arch=('any')
url="https://mqtt-explorer.com/"
license=('CCPL:by-nd')
groups=()
depends=('npm'
         'yarn'
             'git')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("~/.config/MQTT-Explorer/settings.json")
options=(!strip)
install=
changelog=
source=("$pkgname-${pkgver}-beta${betaver}.tar.gz::https://github.com/thomasnordquist/MQTT-Explorer/archive/refs/tags/${gitver}-beta${betaver}.tar.gz"
        "$pkgname-${pkgver}-beta${betaver}-desktop.tar.gz::https://github.com/dave12311/mqtt-explorer.desktop/archive/1.1.tar.gz")
validpgpkeys=("4AEE18F83AFDEB23")

build() {
	export NODE_OPTIONS=--openssl-legacy-provider
        cd "MQTT-Explorer-${gitver}-beta${betaver}"

	sed -i 's/"heapdump": "^0.3.12",//' app/package.json
	sed -i 's/if (!/\/*if (!/' app/src/components/Demo/index.tsx
	sed -i 's/return path/\*\/return path/' app/src/components/Demo/index.tsx

        yarn || sed -i 's/node-gyp rebuild/node-gyp rebuild --openssl_fips=X/' app/package.json
        yarn build
}

package() {
        mkdir -p "$pkgdir/usr/share/$pkgname"
        cp -r MQTT-Explorer-${gitver}-beta${betaver}/* $pkgdir/usr/share/$pkgname/
        mkdir -p "$pkgdir/usr/share/applications"
        sed -i 's/MQTT Explorer/MQTT Explorer Beta/g' mqtt-explorer.desktop-1.1/mqtt-explorer.desktop
        sed -i 's/mqtt-explorer/mqtt-explorer-beta/g' mqtt-explorer.desktop-1.1/mqtt-explorer.desktop
        cp mqtt-explorer.desktop-1.1/mqtt-explorer.desktop $pkgdir/usr/share/applications/mqtt-explorer-beta.desktop
        mkdir -p "$pkgdir/usr/bin"
        echo "#!/bin/bash" > "$pkgdir/usr/share/$pkgname/$pkgname"
        echo "yarn --cwd /usr/share/${pkgname} start" >> "$pkgdir/usr/share/$pkgname/$pkgname"
        chmod 777 "$pkgdir/usr/share/$pkgname/$pkgname"
        ln -s "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
md5sums=('754d67825c99508c80e4403cbed29b2b'
         '306a5ee73ab04fee5eb0f8202d2d90a1')

