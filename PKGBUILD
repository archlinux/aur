# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.9.0
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=('any')
url="https://docs.cozy.io/en/sync/desktop/"
license=('AGPL3')
depends=('electron' 'nodejs-lts-carbon')
makedepends=('npm' 'git' 'node-gyp' 'python2')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/cozy-labs/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        'icons.tar.xz')
sha256sums=('282a22ca9576bbf4d8590a9383f94e3547675f5024217fe3e62f1929ae756365'
            'df0935e38d99c506b622d99d85179ec4612140d78fcd8c73103cb89c4f58ebab'
            'fe182a6ee6b42c26fc5577df7b845798bfddadbbe470ab057e12ca46d6ca93f1'
            '69631fcd5f2334deffd3a5e2708cd06801fd9c22f1ebd2892c2d829dc33adf97')

prepare() {
    cd ${pkgname}-${pkgver}
    npm install --cache "${srcdir}"/npm-cache
}

build() {
    cd ${pkgname}-${pkgver}
    npm run build --cache "${srcdir}"/npm-cache
}

package() {
    cd ${pkgname}-${pkgver}
    npm run dist --dir --cache "${srcdir}"/npm-cache

    install -dm755 "${pkgdir}"/usr/lib/${pkgname}
    cp -r dist/linux-unpacked/resources "${pkgdir}"/usr/lib/${pkgname}/

    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/share/icons/
    cp -r hicolor "${pkgdir}"/usr/share/icons/

    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
