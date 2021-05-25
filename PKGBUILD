# Maintainer: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=antares-sql
pkgver=0.1.9
pkgrel=1
pkgdesc="Open source and cross platform SQL client made to be simple and complete"
arch=('x86_64')
url="https://antares-sql.app/"
license=('MIT')
depends=('electron')
makedepends=('nodejs' 'npm' 'yarn' 'python')
source=("https://github.com/Fabio286/antares/archive/refs/tags/v${pkgver}.tar.gz"
        "antares-sql.desktop"
        "antares-sql.sh")
sha256sums=("8895221056d19c09f00e0d5205f691a924d3483f36493fd03f73df729bf971ab"
            "f6a6896f073999658505f18c4d0c22dbff8c66de580dbe7c7130e2497c150df3"
            "a67082f950744166c8edf5eac8f7573e9d8c6e61ff0ca5bfd67a652721de9f9f")

prepare() {
	cd "${srcdir}/antares-${pkgver}"
	sed -i 's/"electron-builder": "[0-9]*\.[0-9]*\.[0-9]*",/"electron-builder": "22.11.5",/' package.json
    yarn install
}

build() {
	cd "${srcdir}/antares-${pkgver}"
	yarn build
    yarn run electron-builder --linux --"x64" --dir -c.electronDist=/usr/lib/electron -c.electronVersion=$(</usr/lib/electron/version)
}

package() {
	cd "${srcdir}"
    install -Dm644 ./antares-sql.desktop "${pkgdir}/usr/share/applications/antares-sql.desktop"
    install -Dm755 ./antares-sql.sh "${pkgdir}/usr/bin/antares-sql"

    cd "antares-${pkgver}"
    install -Dm644 ./dist/linux-unpacked/resources/app.asar "${pkgdir}/usr/lib/antares-sql.asar"
    install -Dm644 ./build/appx/Square150x150Logo.png "${pkgdir}/usr/share/icons/hicolor/150x150/apps/antares-sql.png"
}
