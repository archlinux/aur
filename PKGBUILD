# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributer: Felix Laurie von Massenbach <felix@erbridge.co.uk>
pkgname=inky
pkgver=0.15.1
pkgrel=2
pkgdesc="Editor for ink: inkle's narrative scripting language"
arch=('x86_64')
url="http://www.inklestudios.com/ink"
license=('MIT')
options=('!strip')
depends=('icu' 'electron')
conflicts=('inky-bin')
provides=('inky')
makedepends=('npm')
optdepends=('mono: for exporting to web and JSON')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/inkle/inky/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.png::https://github.com/inkle/inky/raw/${pkgver}/resources/Icon1024.png"
        "${pkgname}.desktop")
sha512sums=('af79de801a71aaa4bb7a214b26f886b5395491a4bc82de7455cd4d94f387f4de7a939390cb9614430079f49b501c9450d1ed02216be4123d580ee4c2a592c70b'
            '4f465c45c1c61ede58db0a36682f575b7d755c9c28b0261a7892045813986d12f77d3d5c8881d9c476e07ca5169ed163c89f56a8a4049c6f0337db6cab3275e5'
            '84fd0f87bfdf5e1fd6df5f9e253e3aa71373b9ad28a1d027522eceb6cf94a9a370ef239bfe0738ce64efabb3685945fc40c054265418b0a639e26e4213211481')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    npm install electron-packager

    rm -rf Inky-linux-x64/
    rm -rf ReleaseUpload

    cd app && npm install

    npm exec @electron/packager . Inky --platform=linux --arch=x64 --icon=resources/Icon.icns --extend-info=resources/info.plist --prune --asar.unpackDir="main-process/ink" --ignore="inklecate_mac"
    }

package() {
    cd "$srcdir/"
    install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${pkgname}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    cd "$srcdir/$pkgname-$pkgver/app/Inky-linux-x64"
    
    install -d -m755 "${pkgdir}/usr/share/${pkgname}"

    cp -a -r * "${pkgdir}/usr/share/${pkgname}"

    install -D -m755 Inky "${pkgdir}/usr/share/${pkgname}/Inky"

    install -d -m755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/Inky" "${pkgdir}/usr/bin/${pkgname}"
    cd "${pkgdir}/usr"
    rm -rf src/
}
