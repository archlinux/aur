# Maintainer: logan_reed <liulingzhang.work@icloud.com>

pkgname=trae-sg
pkgver=2.3.30128
pkgrel=2
pkgdesc="AI-powered IDE by ByteDance (Singapore CDN)"
arch=('x86_64' 'aarch64')
url="https://www.trae.cn/"
license=('LicenseRef-Trae')
provides=("trae=$pkgver")
conflicts=('trae' 'trae-bin')
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'libsecret' 'libxkbfile' 'zeromq')
optdepends=('libappindicator-gtk3: System tray support'
            'xdg-utils: Open URLs and files with default applications'
            'python: Python extension support'
            'nodejs: Node.js extension scripts')
options=('!strip' '!debug')
install=trae.install
source=("trae.sh" "trae.desktop")
source_x86_64=("Trae-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.tar.gz")
source_aarch64=("Trae-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.tar.gz")
sha512sums=('2659baca6aa6b572d7665670304d5abd7f19a92abdf4c3a231f43158f946b9c84d5fd3b41902dd16192e817b853f72bb688c6f863dff7cc0684ce4719a111b73'
            '8b5e04cd53bf71757eb5042414f3a4c49248d731ef6e7cc981d063c29b5325163e4c8500b8bacd6db2194a2fb050dfbd7b7593c64450f95792d7604d1a54f0a7')
sha512sums_x86_64=('7fa54bfcb82b7c3f6f3918186d11b1556bd556fc8010b5412543c83e2de1af39db7976d7395856287156b8fe97fc0ef43cfefb8f9f6a6e2a5cb88101e2593eda')
sha512sums_aarch64=('e2239a6bbcf29a99026c020ad07d819de547b577f82101e37bd87d427dfb41f7ef69104bffa5ac6ce393783af0a80b08a10697874bd2b5fe08004d688b4a9c8a')

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
