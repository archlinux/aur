# Maintainer:
# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=min
pkgver=1.32.1
pkgrel=1
pkgdesc='A fast, minimal browser that protects your privacy'
arch=('any')
url='https://minbrowser.org'
license=('Apache-2.0')
_electron=electron29
depends=('bash' "${_electron}" 'nodejs')
makedepends=('git' 'npm')
source=("https://github.com/minbrowser/min/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        'build.patch')
sha256sums=('760fb5d4d10a8d5a44dad6f0e7b3ee58576f46fba5098df39a3fff8576c0086f'
            'bca3356dbf5c783b44d5eb0919e0dbb263869f5d89224cc210d50610f67f3c3c'
            '6dcadaf3e1ae6e619569df9c5500c7786eaebd0f978df14476f92147bc7cd34f'
            '59d84d72eafbbdbcac40576a9a5c2a9098736bf7aa9baa5b63d0e206b635c9fc')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/build.patch"

    sed "s|@ELECTRON@|${_electron}|" -i "${srcdir}/${pkgname}.sh"
    sed -e "s|@ELECTRON_DIST@|/usr/lib/${_electron}|" \
        -e "s|@ELECTRON_VERSION@|$(cat /usr/lib/${_electron}/version)|" \
        -i scripts/createPackage.js

    npm install --omit=optional
}

build() {
    cd "${pkgname}-${pkgver}"
    npm run build
    node ./scripts/buildLinux.js
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/lib"
    cp -r dist/app/linux-unpacked/resources "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 icons/icon256.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
