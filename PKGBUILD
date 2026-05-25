# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=prismlauncher-ecoson-themes
pkgver=1.0
pkgrel=1
pkgdesc="Ecoson dark theme collection and icon pack for Prism Launcher"
arch=('any')
url="https://github.com/PrinceAkaid/Ecoson-Themes"
license=('MIT')
optdepends=('prismlauncher: the launcher these themes are for')
install=ecoson.install
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-themes.zip::${_dl}/Ecoson-Theme_Pack.zip"
        "${pkgname}-${pkgver}-icons.zip::${_dl}/Ecoson-Icon_Pack.zip"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/${pkgver}/LICENSE")
noextract=("${pkgname}-${pkgver}-themes.zip"
           "${pkgname}-${pkgver}-icons.zip")
sha256sums=('bf7a4b8b58f5c2d6c76e3d48c4360a58d0c3c78a395d0da787b2c552476ce3e3'
            '6f56bd9862501abab133833cd8c4e6c35ea93f6f72e7d8618b57a92763be5368'
            '2161bb8df64b8640e39188bce63c45b9a1948090d60227376c4c2a6707470ac4')

latestver() {
    gh api repos/PrinceAkaid/Ecoson-Themes/releases/latest --jq '.tag_name'
}

prepare() {
    mkdir -p themes icons
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-themes.zip" -C themes
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-icons.zip" -C icons
}

package() {
    _themedir="${pkgdir}/usr/share/prismlauncher/themes"
    _icondir="${pkgdir}/usr/share/prismlauncher/iconthemes"

    for d in "${srcdir}"/themes/Ecoson\ */; do
        _name=$(basename "$d")
        install -d "${_themedir}/${_name}"
        cp -r "$d"/* "${_themedir}/${_name}/"
    done

    install -d "${_icondir}"
    cp -r "${srcdir}/icons/Ecoson" "${_icondir}/Ecoson"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
