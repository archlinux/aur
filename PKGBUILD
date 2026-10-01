# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Simon Gomizelj <simongmzlj(at)gmail(dot)com>
# Contributor: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=slack-desktop
pkgver=4.52.171
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils')
optdepends=('libappindicator-gtk3: Systray indicator support'
            'org.freedesktop.secrets: Keyring password store support')
options=('!debug')
source=("https://downloads.slack-edge.com/desktop-releases/linux/x64/${pkgver}/${pkgname}-${pkgver}-amd64.deb"
        "${pkgname}.patch")
noextract=("${pkgname}-${pkgver}-amd64.deb")
b2sums=('a9d2430aa3e2a69c862d6bdb3ac3a3f795a09b29675aeefc456c10270b3f73a8f37669fe3dc3d6f1c2d823804b94e69ca3239001d90a051984690e1555f3d63f'
        '103447636acd7ac2789d7d89008483a2077d862a51a64427a66c51e64dc9eac588de187f13df2778ccb7b24110a36c259b33c0074ff69c9bab3f89283a1efaf1')

package() {
    bsdtar -O -xf "slack-desktop-${pkgver}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Fix hardcoded icon path in .desktop file
    patch -d "${pkgdir}" -p1 <"${pkgname}".patch

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/etc"
    rm -rf "${pkgdir}/usr/lib/slack/src"
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Move license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/lib/slack/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/lib/slack/LICENSE"
}
