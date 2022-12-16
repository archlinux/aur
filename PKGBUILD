# Maintainer: Jaime Martínez Rincón <jaime(at)jamezrin(dot)name>

pkgname=httptoolkit
pkgver=1.12.2
pkgrel=1
epoch=1
pkgdesc="Beautiful, cross-platform & open-source HTTP(S) proxy, analyzer and client."
arch=("x86_64")
url="https://httptoolkit.tech/"
license=('GPL3')
depends=()
makedepends=(npm zip git)
checkdepends=()
optdepends=()
provides=()
conflicts=(httptoolkit-bin)
replaces=()
backup=()
options=()
install=
changelog=
_pkgrepo="https://github.com/httptoolkit/httptoolkit-desktop"
source=("${pkgname}::git+${_pkgrepo}.git#tag=v${pkgver}"
        'httptoolkit.desktop')
noextract=()
md5sums=('SKIP'
         'faf640796c9ad59c3fe56dac09b19767')
validpgpkeys=()

build() {
    cd ${srcdir}/${pkgname}

    # Install node packages
    npm install
    
    # Build the project
    npm run build:src
    npm run build:electron -- --linux dir
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/share/icons"
    install -d "${pkgdir}/usr/share/licenses"
    install -d "${pkgdir}/usr/share/applications"

    cp -r "${srcdir}/${pkgname}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    cp "${srcdir}/${pkgname}/src/icons/icon.png" "${pkgdir}/opt/${pkgname}/icon.png"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}/src/icons/icon.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
    ln -s "/opt/${pkgname}/httptoolkit" "${pkgdir}/usr/bin/${pkgname}"
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i "s|$srcdir||g"
}

