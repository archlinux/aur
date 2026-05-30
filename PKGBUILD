# Maintainer: logan_reed <liulingzhang.work@icloud.com>

pkgname=zen-browser-twilight-bin
pkgver=1.21t
pkgrel=9
pkgdesc="Zen Browser - Twilight nightly build, a Firefox-based browser focused on privacy"
arch=('x86_64' 'aarch64')
url="https://zen-browser.app/"
license=('MPL-2.0')
conflicts=('zen-browser' 'zen-browser-bin' 'zen-browser-git')
provides=("zen-browser=$pkgver")
depends=('alsa-lib' 'gtk3' 'libx11' 'mime-types' 'nspr' 'nss' 'systemd-libs' 'ttf-font')
optdepends=('pulse-native-provider: Audio support'
            'libnotify: Notification integration'
            'networkmanager: Location detection via available WiFi networks'
            'speech-dispatcher: Text-to-Speech'
            'hunspell: Spell checking')
options=('!strip' '!debug')
install=${pkgname}.install
source=("zen-browser-twilight.sh"
        "zen-browser-twilight.desktop"
        "policies.json")
source_x86_64=("zen.linux-x86_64-${pkgver}-${pkgrel}.tar.xz::https://github.com/zen-browser/desktop/releases/download/twilight-1/zen.linux-x86_64.tar.xz")
source_aarch64=("zen.linux-aarch64-${pkgver}-${pkgrel}.tar.xz::https://github.com/zen-browser/desktop/releases/download/twilight-1/zen.linux-aarch64.tar.xz")
sha512sums=('72aab4501229d83641169a1fe624906d8556613c17ca2e8fe6d818270b322503ea51acc6b356f3730cdb5a24a7e2d7aad50db57be5505f2dfc0d0a76fe9ee182'
            '5f16ff2b8b84402b19b735e2b627d8290bdf9289e7ea26973aa6dc339ce6c9835ce6c4c12df881436108894bcee5623e43b5ef090c641031369ac28975b6107e'
            'f17d02c67f731ea27401176d2fb320a093367d94c8cbfd18a3b76c6f516994b8c547cee970b7bbf0422767064d62410884e07ae6e95b59007b48869e750fdcd9')
sha512sums_x86_64=('4249daa25772fe7ce7f7b8019c3e377dc3cfbe3da13415a5b4c3a4202c4768a3d0ef4566b23ad00bc9f7332b4677d4e0817b95f0b6fd8579289cd8dd4c837a88')
sha512sums_aarch64=('ff4f29302ce9cc65eb491762df2842bcaacd1c2e53f4df0ee4ff1288353eff0138e921faaed64c9c5d2bc4312c5b92b4290fa6eb2bc5dff1c10f5e17961d3fc6')

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/zen/." "${pkgdir}/opt/${pkgname}/"

    # SUID sandbox helpers
    chmod 4755 "${pkgdir}/opt/${pkgname}/glxtest"
    chmod 4755 "${pkgdir}/opt/${pkgname}/vaapitest"

    # Launcher
    install -Dm755 "${srcdir}/zen-browser-twilight.sh" "${pkgdir}/usr/bin/zen-browser-twilight"

    # Desktop entry
    install -Dm644 "${srcdir}/zen-browser-twilight.desktop" "${pkgdir}/usr/share/applications/zen-browser-twilight.desktop"

    # Icons (symlinks to avoid duplicating files)
    _iconname="zen-browser-twilight"
    for i in 16x16 32x32 48x48 64x64 128x128; do
        install -d "${pkgdir}/usr/share/icons/hicolor/${i}/apps/"
        ln -s "/opt/${pkgname}/browser/chrome/icons/default/default${i/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_iconname}.png"
    done

    # System dictionaries
    ln -Ts /usr/share/hunspell "${pkgdir}/opt/${pkgname}/dictionaries"
    ln -Ts /usr/share/hyphen "${pkgdir}/opt/${pkgname}/hyphenation"

    # System certificates
    ln -sf /usr/lib/libnssckbi.so "${pkgdir}/opt/${pkgname}/libnssckbi.so"

    # Policies - disable auto-update (managed via AUR)
    install -Dm644 "${srcdir}/policies.json" "${pkgdir}/opt/${pkgname}/distribution/policies.json"
}
