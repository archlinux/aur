# Maintainer: logan_reed <liulingzhang.work@icloud.com>

pkgname=zen-browser-twilight-bin
pkgver=1.20t
pkgrel=3
pkgdesc="Zen Browser - Twilight nightly build, a Firefox-based browser focused on privacy"
arch=('x86_64' 'aarch64')
url="https://zen-browser.app/"
license=('MPL-2.0')
conflicts=('zen-browser' 'zen-browser-bin' 'zen-browser-git')
provides=("zen-browser=$pkgver")
depends=('alsa-lib' 'gtk3' 'libx11' 'mime-types' 'systemd-libs' 'ttf-font')
optdepends=('libpulse: audio support'
            'alsa-lib: audio support'
            'libnotify: notification support'
            'hunspell: spell checking')
options=('!strip' '!debug')
install=${pkgname}.install
source=("zen-browser-twilight.sh"
        "zen-browser-twilight.desktop"
        "policies.json")
source_x86_64=("https://github.com/zen-browser/desktop/releases/download/twilight-1/zen.linux-x86_64.tar.xz")
source_aarch64=("https://github.com/zen-browser/desktop/releases/download/twilight-1/zen.linux-aarch64.tar.xz")
sha512sums=('2e5309cef36d94dfb85c040a1c6f5b1890b96f59dff71bb90bbb0ba6e0ceed2808a217fb80ce2dd6c4172c95ef0adb6d2fa8d2f9d5651995fa0b09e3a1e4548b'
            '70e0d97a3c9d655e1ab142c6e53c9ab107fb01022df13b9e0573779e7c898ecd04d24b2105cf15a0f0a7284767419b6adaef08ceabb411554bd08bab82c4ee9a'
            'f17d02c67f731ea27401176d2fb320a093367d94c8cbfd18a3b76c6f516994b8c547cee970b7bbf0422767064d62410884e07ae6e95b59007b48869e750fdcd9')
sha512sums_x86_64=('a1b61a6165ed7e8f014a9e66821976b47b427614c60f00300e943e06a3f10ed35c6281a5f0749eb969e5e9ba418af7ec0cdfcc2a7dd5776267f780097c596c47')
sha512sums_aarch64=('b03d18148a530f51d99c93c2a93d6a562c0e56f492a45830779d8d07139412e63b7f6cdd5db891629f7ce23f81ccb4ca42080eb6b0650b71e720700cc5d97c76')

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

    # Icons
    for size in 16 32 48 64 128; do
        install -Dm644 "${pkgdir}/opt/${pkgname}/browser/chrome/icons/default/default${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/zen-browser-twilight.png" 2>/dev/null || true
    done

    # Policies - disable auto-update (managed via AUR)
    install -Dm644 "${srcdir}/policies.json" "${pkgdir}/opt/${pkgname}/distribution/policies.json"
}
