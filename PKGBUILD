# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.12.0
pkgrel=1
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=('any')
url="https://cozy-labs.github.io/cozy-desktop/"
license=('AGPL3')
depends=('electron2')
makedepends=('nodejs-lts-carbon' 'yarn' 'git' 'node-gyp' 'python2')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/cozy-labs/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        'icons.tar.xz')
sha256sums=('3f76dd5b6b6ce3c46501ff33c05fe5ca0fbd5429939f7ab4391038202c0564cd'
            'df0935e38d99c506b622d99d85179ec4612140d78fcd8c73103cb89c4f58ebab'
            '6c2df91fca75903c1e518eab56ba9cddfd3e7af6d4433207d9861ce22338f677'
            '69631fcd5f2334deffd3a5e2708cd06801fd9c22f1ebd2892c2d829dc33adf97')

prepare() {
    cd ${pkgname}-${pkgver}
    _electronver=$(cat /usr/lib/electron2/version)
    sed -i "s|\"electron\": \"^1.8.3\"|\"electron\": \"^${_electronver/v/}\"|" package.json
    #npm install --cache "${srcdir}"/npm-cache
    yarn install
}

build() {
    cd ${pkgname}-${pkgver}
    #npm run build --cache "${srcdir}"/npm-cache
    yarn build
}

package() {
    cd ${pkgname}-${pkgver}
    #npm run dist --dir --cache "${srcdir}"/npm-cache
    yarn dist --dir

    install -dm755 "${pkgdir}"/usr/lib/${pkgname}
    cp -r dist/linux-unpacked/resources "${pkgdir}"/usr/lib/${pkgname}/

    rm "${pkgdir}"/usr/lib/cozy-desktop/resources/app.asar.unpacked/gui/scripts/macos-add-favorite.py
    rmdir "${pkgdir}"/usr/lib/cozy-desktop/resources/app.asar.unpacked/gui/{scripts/,}

    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/share/icons/
    cp -r hicolor "${pkgdir}"/usr/share/icons/

    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
