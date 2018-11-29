# Maintainer: Bruno Pagani <archange@archlinux.org>

pkgname=cozy-desktop
pkgver=3.10.2
pkgrel=2
pkgdesc="File synchronisation for Cozy Cloud on Desktop"
arch=('any')
url="https://cozy-labs.github.io/cozy-desktop/"
license=('AGPL3')
depends=('electron2' 'nodejs-lts-carbon')
makedepends=('yarn' 'git' 'node-gyp' 'python2')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/cozy-labs/${pkgname}/archive/v${pkgver}.tar.gz"
        cozy-desktop-electron.patch::"https://patch-diff.githubusercontent.com/raw/cozy-labs/cozy-desktop/pull/1302.patch"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        'icons.tar.xz')
sha256sums=('d4a6738e77188e638e4957015289b2fb7b80106ab636a1329a6bd680aa87bff8'
            '09e396165ba17dd82e76c17226e38b41d984b33cbeb7e57519d41118d5024495'
            'df0935e38d99c506b622d99d85179ec4612140d78fcd8c73103cb89c4f58ebab'
            '6c2df91fca75903c1e518eab56ba9cddfd3e7af6d4433207d9861ce22338f677'
            '69631fcd5f2334deffd3a5e2708cd06801fd9c22f1ebd2892c2d829dc33adf97')

prepare() {
    cd ${pkgname}-${pkgver}
    patch -p1 -i ../cozy-desktop-electron.patch
    sed -i 's/"electron": "^1.8.3"/"electron": "^2.0.14"/' package.json
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

    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/share/icons/
    cp -r hicolor "${pkgdir}"/usr/share/icons/

    install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
