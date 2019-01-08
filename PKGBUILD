# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
# Contributor: dpeukert
pkgname=marktext
pkgver=0.13.65
pkgrel=1
pkgdesc='Next generation markdown editor'
arch=('x86' 'x86_64')
url='https://marktext.github.io/website/'
license=('MIT')
depends=('gtk3' 'libxss' 'nss')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('110f3b2a91ac2af2f7ae94abdff5fb6a155e810630f3e87929c61e52786e2e690464803ae239dc3f583ad37fc61e03e57ba394b28ac4d6d95e915382dcdfdc24')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --cache "${srcdir}/npm-cache"
    npm run release:linux
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "$pkgdir/usr/lib"
    cp -r "build/linux-unpacked" "$pkgdir/usr/lib/$pkgname"

    # Symlink main binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install license file
    install -D LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -D build/linux-unpacked/LICENSE.electron.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -D build/linux-unpacked/LICENSES.chromium.html "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"

    # Install desktop file and icon
    install -D "resources/linux/marktext.desktop" "$pkgdir/usr/share/applications/marktext.desktop"
    install -D "build/.icon-set/icon_512x512.png" "$pkgdir/usr/share/pixmaps/marktext.png"
}

# vim:ts=4:sw=4:expandtab
