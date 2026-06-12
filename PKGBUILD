# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributer: Felix Laurie von Massenbach <felix@erbridge.co.uk>
pkgname=inky
pkgver=0.15.2
pkgrel=1
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
sha512sums=('51a603539ac4e16f40948d51abee6f510df19dec43432107a7a521bac6699f81cf88ac1cc88d8d281c7824cbb23386977ec419a54c8ae170c7343c437e61a6bc'
            '9b88362b61635a2328bd2439aaeca7b26875e158b3c15f7317d0f0f26306891f48d147cd1d63602e36ee249880c0b500397a20cdff14e090a699925f37e18ef9'
            '84fd0f87bfdf5e1fd6df5f9e253e3aa71373b9ad28a1d027522eceb6cf94a9a370ef239bfe0738ce64efabb3685945fc40c054265418b0a639e26e4213211481')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    rm -rf Inky-linux-x64/
    rm -rf ReleaseUpload

    cd app
    # Update package.json to use latest electron and electron-packager
    sed -i '38 s/18.3.2/20.0.1/' package.json
    sed -i '41 s/30.0.4/42.3.0/' package.json
    npm install

    npx @electron/packager . Inky --platform=linux --arch=x64 --icon=resources/Icon.icns --extend-info=resources/info.plist --prune --asar.unpackDir="main-process/ink" --ignore="inklecate_mac"

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
