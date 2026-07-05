# Maintainer: m4rsquake <m4rsquake@outlook.com>

pkgname='gui-for-singbox-bin'
_pkgname='GUI.for.SingBox'
pkgver='1.25.4'
pkgrel='8'
pkgdesc='GUI for SingBox (precompiled binary)'
arch=('x86_64')
license=('GPL3')
depends=(
    'glibc'
    'sing-box'
    'webkit2gtk-4.1'
)
makedepends=('unzip')
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
    "${pkgname%-bin}.install"
    "${pkgname%-bin}.rules"
)
sha256sums=('cf2367cb5203c583b4683187cde597e5bd7f9f2e55b08f9f2ba98c422c5bb793'
            '08257d0d21c76a56e48e38105460927293a452ddc6b0b62db401bf5b5b9b7adf'
            'faf593c95517a35b7ddd930cdcb84a595c1ee0cd813cbc61b353af7720c08271'
            '43f59d6c4414a2367c9b67c5915d749c803455130c1f45948eda88e8722826a4'
            'a3ab0b89a30d8e141a429b003eeb120ac6792542aff14b19a99940b442465f5f')

package() {
    # Binary — the only file under /opt that is package-managed
    install -Dm755 "${_pkgname}" "${pkgdir}/opt/${pkgname}/${_pkgname}"

    # Icon
    install -Dm644 "appicon.png" "${pkgdir}/opt/${pkgname}/icon/${pkgname%-bin}.png"

    # Desktop entry
    install -Dm644 "${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

    # Polkit rules — allow user to manage DNS/routing without password
    install -Dm644 "${pkgname%-bin}.rules" "${pkgdir}/usr/share/polkit-1/rules.d/50-${pkgname%-bin}.rules"

    # NOTE: runtime data directories (data/ and its subdirs) are NOT created here.
    # They are created in the .install script so pacman does NOT track them —
    # this way user plugins/configs survive package upgrades.
}
