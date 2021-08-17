# Maintainer: Sergey Feschukov <snfesh@gmail.com>
# Adapted from Dave Parrish's "A Better PKGBUILD Template for AppImage Packages"

_pkgname=electrum-ravencoin
pkgname="${_pkgname}"-appimage
pkgver=0.4.0
_pkgver=v"${pkgver}"
pkgrel=2
pkgdesc="Electrum Ravencoin Wallet Client. Forked from the Electrum Bitcoin base client"
arch=('x86_64')
url="https://github.com/Electrum-RVN-SIG/electrum-ravencoin"
license=('MIT')
provides=('electrum-ravencoin')
conflicts=('electrum-ravencoin' 'electrum-ravencoin-git')
options=(!strip)
_appimage="${_pkgname}-${pkgver}.AppImage"
validpgpkeys=('6694D8DE7BE8EE5631BED9502BD5824B7F9470E6')

source=("https://github.com/Electrum-RVN-SIG/electrum-ravencoin/releases/download/${_pkgver}/${_appimage}"
        "${_pkgname}-${pkgver}-LICENCE::https://raw.githubusercontent.com/Electrum-RVN-SIG/${_pkgname}/${_pkgver}/LICENCE"
        )

b2sums=('e8b210959fe2bf784349ea0db118da62fd84e1784998ecfe8b50be285b949dcacfe164c407bf3d19e98c45dbdce10a3d256cedda8f4f2866de6a0964b5ac091c'
        'a70dea849f4af001369ba2d35bc79c86d8212f0511f86d6f86f88ba0372ba72ef2ef9e2cee176ca5c85cd8c7fd65a95ed388d11cfb8314252d9c8a7ab66c6110')

noextract=("${_appimage}")

prepare() {
    # Bypass integration
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract &>/dev/null
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=sh -c "PATH=\"\\$HOME/.local/bin:\\$PATH\"; electrum|Exec=sh -c "PATH=\"\\$HOME/.local/bin:\\$PATH\"; ${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
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
