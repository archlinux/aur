# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=min
pkgver=1.35.1
pkgrel=1
pkgdesc='A fast, minimal browser that protects your privacy'
arch=('any')
url='https://minbrowser.org'
license=('Apache-2.0')
_electron=electron36
depends=('bash' "${_electron}" 'nodejs')
makedepends=('git' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/minbrowser/min/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        'build.patch')
sha256sums=('8f50e56c7daeed12de5c2a5aec0aedf4aa7aa7f1d8b56b3976bed1d50af64bc0'
            'bca3356dbf5c783b44d5eb0919e0dbb263869f5d89224cc210d50610f67f3c3c'
            '6dcadaf3e1ae6e619569df9c5500c7786eaebd0f978df14476f92147bc7cd34f'
            'ac7c5ceaf6da8fbeeb2720aa2c11098dcaff4dde1254d022dbf804599020e0d6')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/build.patch"

    sed -e "s|@ELECTRON_DIST@|/usr/lib/${_electron}|" \
        -e "s|@ELECTRON_VERSION@|$(cat /usr/lib/${_electron}/version)|" \
        -i scripts/createPackage.js
    sed "s|@ELECTRON@|${_electron}|" -i "${srcdir}/${pkgname}.sh"

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
