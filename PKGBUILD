# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Contributor: springtwr <springtwr@outlook.com>

pkgname=trae-us
pkgver=2.3.103560
pkgrel=2
pkgdesc="AI-powered IDE by ByteDance (US CDN)"
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
source_x86_64=("Trae-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.103560/linux/TRAE-linux-x64.tar.gz")
source_aarch64=("Trae-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.103560/linux/TRAE-linux-arm64.tar.gz")
b2sums=('2331b0d37fff8478ea37cbf9e5c2e70a59631aae6efb44741fc6c1a8dce65557098e9dffa8c30148ef27432802bec3d1eda279021421e5d3f979e80900662726'
            '656c5d6bea6ef15185e0d8ee0181276f6de3bfae8e66a2c65772a5f1354727952dd020dca057246139a2bab8f4805057fa2db367a6ba0a1b90d9ffd7fcab8412')
b2sums_x86_64=('859c942df91ae67a6419220096ba0b222772e63acef13eaedac5d0f763bbdcf2871255813df3c651cab19d022fab811b7bcd0de6ff4655e2e7886de306a1cb96')
b2sums_aarch64=('9ab9228eca0d78ea9595b8a1701096d7b91160011bc8e1a6a8aac4ddee9382213d90d80ebb5e4e4c29eaa3a8dd5563eae9dfb6566aa9514f2ee5413891b0045a')

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
    find "${pkgdir}/opt/trae" -name "*.asc" -delete
    find "${pkgdir}/opt/trae" -name "*.bat" -delete
    find "${pkgdir}/opt/trae" -type d -name "rush-logs" -exec rm -rf {} +

    # Remove bundled GCC runtime libraries (conflict with system gcc-libs, breaks ckg indexing)
    rm -fv "${pkgdir}/opt/trae/resources/app/modules/ckg/binary/libstdc++.so.6"
    rm -fv "${pkgdir}/opt/trae/resources/app/modules/ckg/binary/libgcc_s.so.1"
}
