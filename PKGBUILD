# Maintainer: m4rsquake <m4rsquake@outlook.com>

pkgname='gui-for-singbox-bin'
_pkgname='GUI.for.SingBox'
pkgver='1.25.4'
pkgrel='3'
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

source=(
    "https://github.com/GUI-for-Cores/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip"
    "https://raw.githubusercontent.com/GUI-for-Cores/${_pkgname}/main/build/appicon.png"
    "${pkgname%-bin}.desktop"
)
sha256sums=('cf2367cb5203c583b4683187cde597e5bd7f9f2e55b08f9f2ba98c422c5bb793'
            '08257d0d21c76a56e48e38105460927293a452ddc6b0b62db401bf5b5b9b7adf'
            'faf593c95517a35b7ddd930cdcb84a595c1ee0cd813cbc61b353af7720c08271')

package() {
    # Binary
    install -Dm755 "${_pkgname}" "${pkgdir}/opt/${pkgname}/${_pkgname}"

    # Create data/sing-box dir and symlink the system sing-box
    # The app resolves relative paths against BasePath (the dir containing the executable),
    # so it looks for the core at: /opt/gui-for-singbox-bin/data/sing-box/sing-box
    install -dm755 "${pkgdir}/opt/${pkgname}/data/sing-box"
    ln -sf /usr/bin/sing-box "${pkgdir}/opt/${pkgname}/data/sing-box/sing-box"

    # Pre-create runtime data directories (the app writes to them at runtime)
    # 777 because /opt/ is root-owned and the user runs as a normal user
    chmod 777 "${pkgdir}/opt/${pkgname}/data"
    install -dm777 "${pkgdir}/opt/${pkgname}/data/.cache/icons"
    install -dm777 "${pkgdir}/opt/${pkgname}/data/.cache/imgs"
    install -dm777 "${pkgdir}/opt/${pkgname}/data/locales"
    install -dm777 "${pkgdir}/opt/${pkgname}/data/plugins"
    install -dm777 "${pkgdir}/opt/${pkgname}/data/rolling-release"
    install -dm777 "${pkgdir}/opt/${pkgname}/data/rulesets"
    install -dm777 "${pkgdir}/opt/${pkgname}/data/subscribes"
    install -dm777 "${pkgdir}/opt/${pkgname}/data/third"

    # Icon
    install -Dm644 "appicon.png" "${pkgdir}/opt/${pkgname}/icon/${pkgname%-bin}.png"

    # Desktop entry
    install -Dm644 "${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
