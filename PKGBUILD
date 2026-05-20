# Maintainer: logan_reed <liulingzhang.work@icloud.com>

pkgname=zen-browser-twilight-bin
pkgver=1.20t
pkgrel=4
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
source_x86_64=("https://github.com/zen-browser/desktop/releases/download/twilight-1/zen.linux-x86_64.tar.xz")
source_aarch64=("https://github.com/zen-browser/desktop/releases/download/twilight-1/zen.linux-aarch64.tar.xz")
sha512sums=('dae4133154524cca0ed0bed47b9c2a6070be2e9aba603442e3050c40a15fd04b00dd502eeab89b8a0f51ee27020a19b0ee5f2ac87cd4ae9c0694fd21d330c749'
            '5f16ff2b8b84402b19b735e2b627d8290bdf9289e7ea26973aa6dc339ce6c9835ce6c4c12df881436108894bcee5623e43b5ef090c641031369ac28975b6107e'
            'f17d02c67f731ea27401176d2fb320a093367d94c8cbfd18a3b76c6f516994b8c547cee970b7bbf0422767064d62410884e07ae6e95b59007b48869e750fdcd9')
sha512sums_x86_64=('ab11d83350002a34144ae24045a806cc2c3dcc5701bb7d5c9fb8e3b36b810ea4e982122ec787026052e94a07d149b80cd16433b65f0953f286e83e7d9c61e957')
sha512sums_aarch64=('5d8031f4c925c89a63c6c763136e8a27ad6be0eb93111ff1619d9c2b6f53a69ebf7cadd637e8b0b8bef050dc4b7d27fa778ea2d4b2334c03aae65e78c28113db')

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
