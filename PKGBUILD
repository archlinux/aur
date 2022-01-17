# Maintainer: Sergey Feschukov <snfesh@gmail.com>
# Adapted from Dave Parrish's "A Better PKGBUILD Template for AppImage Packages"

_pkgname=electrum-ravencoin
pkgname="${_pkgname}"-appimage
pkgver=0.4.5
_pkgver=v"${pkgver}"
pkgrel=1
pkgdesc="Electrum Ravencoin Wallet Client. Forked from the Electrum Bitcoin base client"
arch=('x86_64')
url="https://github.com/Electrum-RVN-SIG/electrum-ravencoin"
license=('MIT')
provides=('electrum-ravencoin')
conflicts=('electrum-ravencoin' 'electrum-ravencoin-git')
options=(!strip)
_appimage="${_pkgname}-${pkgver}-x86_64.AppImage"

source=("https://github.com/Electrum-RVN-SIG/electrum-ravencoin/releases/download/${_pkgver}/${_appimage}"
        "${_pkgname}-${pkgver}-LICENCE::https://raw.githubusercontent.com/Electrum-RVN-SIG/${_pkgname}/${_pkgver}/LICENCE"
        )

b2sums=('6bba056fb921491f75b1ecf430bb069802b57b6235e5ac721d024e0acd9d23f1b6d138335aef632b2aafd5036a58f00da0bb9d2812b12a2636ea1381f1b1a8b6'
        'a70dea849f4af001369ba2d35bc79c86d8212f0511f86d6f86f88ba0372ba72ef2ef9e2cee176ca5c85cd8c7fd65a95ed388d11cfb8314252d9c8a7ab66c6110')

noextract=("${_appimage}")

prepare() {
    # Bypass integration
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract &>/dev/null
}

build() {
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-LICENCE" "${pkgdir}/usr/share/licenses/${_pkgname}-${pkgver}-LICENCE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon
    install -dm755 "${pkgdir}/usr/share/icons"
    cp "${srcdir}/squashfs-root/${_pkgname}.png" "${pkgdir}/usr/share/icons/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
