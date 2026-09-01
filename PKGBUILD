# Maintainer: m4rsquake <m4rsquake@outlook.com>

pkgname=gui-for-singbox-bin
_pkgname=GUI.for.SingBox
_installdir=gui-for-singbox
pkgver=1.26.1
pkgrel=12
pkgdesc='GUI for SingBox, a GUI client application for sing-box.'
arch=('x86_64')
license=('GPL3')
depends=(
    'glibc'
    'libcap'
    'polkit'
    'sing-box-bin'
    'webkit2gtk-4.1'
)
provides=("${pkgname%-bin}")
conflicts=(
    'gui-for-singbox'
    'gui.for.singbox'
)
url="https://github.com/GUI-for-Cores/${_pkgname}"
install="${pkgname%-bin}.install"

source=(
    "https://github.com/GUI-for-Cores/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip"
    "https://raw.githubusercontent.com/GUI-for-Cores/${_pkgname}/main/build/appicon.png"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}-launcher"
    "${pkgname%-bin}.install"
    "${pkgname%-bin}.rules"
    "${pkgname%-bin}-setcap.hook"
)
sha256sums=('4413dae481af1500e9576f61a14e9434aa42a8a1708a433b5a377dceaa3b7486'
            '08257d0d21c76a56e48e38105460927293a452ddc6b0b62db401bf5b5b9b7adf'
            'ac72d374ce5cfaf485fe640a17b8b320c6fea98f68b7e6a92aa78d142fba1916'
            'a15e696f65bb1eb6bb53db85414d20b25549d3fa8eb52b70e6ee56f3bcbf5d82'
            '1810de67d465b42c2b1b5a7442fb57331de4848a778768fe8995df25aa588edb'
            'cfcb61f2a3ef7c9b0480235079648c2807358a76edfed0926f781af446495d0b'
            '36a738c513f47651016e5e74339e937b145fcf126de104e55f956868e4599ac9')

package() {
    # Binary
    install -Dm755 "${_pkgname}" "${pkgdir}/opt/${_installdir}/${_pkgname}"

    # Icon
    install -Dm644 "appicon.png" "${pkgdir}/opt/${_installdir}/icon/${pkgname%-bin}.png"

    # Desktop entry
    install -Dm644 "${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Stable command entry point
    install -Dm755 "${pkgname%-bin}-launcher" "${pkgdir}/usr/bin/${_pkgname}"

    # Restore the core capability whenever its binary is installed or upgraded
    install -Dm644 "${pkgname%-bin}-setcap.hook" \
        "${pkgdir}/usr/share/libalpm/hooks/50-${_installdir}-setcap.hook"

    # Allow the desktop core process to configure systemd-resolved for TUN
    install -Dm644 "${pkgname%-bin}.rules" "${pkgdir}/usr/share/polkit-1/rules.d/50-${_installdir}.rules"

    # NOTE: runtime data directories are created in .install, not tracked by pacman.
}
