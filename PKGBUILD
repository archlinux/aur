# Maintainer: logan_reed <liulingzhang.work@icloud.com>

pkgname=trae
pkgver=2.3.27642
pkgrel=1
pkgdesc="AI-powered IDE by ByteDance"
arch=('x86_64' 'aarch64')
url="https://www.trae.cn/"
license=('LicenseRef-Trae')
conflicts=('trae-bin')
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'libsecret' 'libxkbfile' 'zeromq')
optdepends=('libappindicator-gtk3: System tray support'
            'xdg-utils: Open URLs and files with default applications'
            'python: Python extension support'
            'nodejs: Node.js extension scripts')
options=('!strip' '!debug')
install=${pkgname}.install
source=("trae.sh" "trae.desktop")
source_x86_64=('https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.27642/linux/Trae-linux-x64.tar.gz')
source_aarch64=('https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.27642/linux/Trae-linux-arm64.tar.gz')
sha512sums=('2659baca6aa6b572d7665670304d5abd7f19a92abdf4c3a231f43158f946b9c84d5fd3b41902dd16192e817b853f72bb688c6f863dff7cc0684ce4719a111b73'
            '8b5e04cd53bf71757eb5042414f3a4c49248d731ef6e7cc981d063c29b5325163e4c8500b8bacd6db2194a2fb050dfbd7b7593c64450f95792d7604d1a54f0a7')
sha512sums_x86_64=('b3d1e97b44fa6505f69c6056d359e2ff50583f3279c76833962d826183498db3fbd52a0e55fa7d5dad13cd2fa20c6a82ae449783a37db311860212025ffd4b83')
sha512sums_aarch64=('58019689a8f8597970da45cb221b6500d1ab150533994c584b19363a0b95c2da32b52688a4f384c572f04bf830612fa94e549495da43f00cc3f35c6cca677662')

package() {
    install -d "${pkgdir}/opt/trae"

    for f in "${srcdir}"/*; do
        case "${f##*/}" in
            trae.sh|trae.desktop|*.tar.*) continue ;;
        esac
        cp -a "$f" "${pkgdir}/opt/trae/"
    done

    # SUID sandbox
    chmod 4755 "${pkgdir}/opt/trae/chrome-sandbox"

    # Launcher
    install -Dm755 "${srcdir}/trae.sh" "${pkgdir}/usr/bin/trae"

    # Desktop entry
    install -Dm644 "${srcdir}/trae.desktop" "${pkgdir}/usr/share/applications/trae.desktop"

    # Icon
    install -Dm644 "${pkgdir}/opt/trae/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/trae.png"

    # License
    install -Dm644 "${pkgdir}/opt/trae/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/trae/resources/app/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices"
    install -Dm644 "${pkgdir}/opt/trae/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

    # Shell completions
    install -Dm644 "${pkgdir}/opt/trae/resources/completions/bash/trae" "${pkgdir}/usr/share/bash-completion/completions/trae"
    install -Dm644 "${pkgdir}/opt/trae/resources/completions/zsh/_trae" "${pkgdir}/usr/share/zsh/site-functions/_trae"

    # Remove unnecessary files
    rm -rf "${pkgdir}/opt/trae/node_modules"
}
