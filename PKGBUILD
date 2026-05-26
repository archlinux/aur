# Maintainer: logan_reed <liulingzhang.work@icloud.com>

pkgname=zen-browser-twilight-bin
pkgver=1.21t
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
source_x86_64=('https://github.com/zen-browser/desktop/releases/download/twilight-1/zen.linux-x86_64.tar.xz')
source_aarch64=('https://github.com/zen-browser/desktop/releases/download/twilight-1/zen.linux-aarch64.tar.xz')
sha512sums=('dae4133154524cca0ed0bed47b9c2a6070be2e9aba603442e3050c40a15fd04b00dd502eeab89b8a0f51ee27020a19b0ee5f2ac87cd4ae9c0694fd21d330c749'
            '5f16ff2b8b84402b19b735e2b627d8290bdf9289e7ea26973aa6dc339ce6c9835ce6c4c12df881436108894bcee5623e43b5ef090c641031369ac28975b6107e'
            'f17d02c67f731ea27401176d2fb320a093367d94c8cbfd18a3b76c6f516994b8c547cee970b7bbf0422767064d62410884e07ae6e95b59007b48869e750fdcd9')
sha512sums_x86_64=('c133c731f4dc20d2f6586499db28205d56f14597fc5229dc860f3b533690c53b9b2d42e0d09c067a13ad17cc167b53d12f04167ed8b4940fb01d21e913590abb')
sha512sums_aarch64=('507275815888e727402fe58cd96cbb0548aad33b70e13eb00b81e79f073afcf5f3930d9836acd8de6e8283ba91db4ae9c99b7f45d27ac757fdd3e5a0ded200ae')

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
