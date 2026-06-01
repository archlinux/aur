# Maintainer: logan_reed <liulingzhang.work@icloud.com>

pkgname=trae-cn
pkgver=2.3.33255
pkgrel=1
pkgdesc="AI-powered IDE by ByteDance (Chinese Domestic Version)"
arch=('x86_64' 'aarch64')
url="https://www.trae.cn/"
license=('LicenseRef-Trae')
conflicts=('trae-cn-bin')
depends=('nss' 'alsa-lib' 'gtk3' 'at-spi2-core' 'libsecret' 'libxkbfile' 'zeromq')
optdepends=('libappindicator-gtk3: System tray support'
            'xdg-utils: Open URLs and files with default applications'
            'python: Python extension support'
            'nodejs: Node.js extension scripts')
options=('!strip' '!debug')
install=${pkgname}.install
source=("trae-cn.sh" "trae-cn.desktop")
source_x86_64=("Trae_CN-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.33255/linux/Trae_CN-linux-x64.tar.gz")
source_aarch64=("Trae_CN-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.33255/linux/Trae_CN-linux-arm64.tar.gz")
sha512sums=('4f306a3f9b6ba3f7dea613face5d17a76e00f26eb3f37f712ece73d7f4071fb680cc43d601cf3dc38ab4510c351a87fed0d69d632884c15147d0a42e1b6c87f5'
            'b83e27fb8786974b4773cd12d786ca078229786d83d222db60ac812fdda3f475040151064842ee0f6783ffa133db0276c76c5ac927cfa930d366d65519126bac')
sha512sums_x86_64=('5fe94bcdcbca8ea65a6ebc91610737f35d9f2130feab131f5f1e45a88bc97694c9489cd82ecaf0ccf72012d3d00a53569b7f3aeb4f60ac9663216d19a333b9ce')
sha512sums_aarch64=('fa5113a6d40360163d578d11628c37359a3004c50baba8e908ff722b0580fcfa4d5b538666f8d6d570703f0dd0a2408947f00e1f83f50b38de707df813589118')

package() {
    install -d "${pkgdir}/opt/trae-cn"

    for f in "${srcdir}"/*; do
        case "${f##*/}" in
            trae-cn.sh|trae-cn.desktop|*.tar.*) continue ;;
        esac
        cp -a "$f" "${pkgdir}/opt/trae-cn/"
    done

    # SUID sandbox
    chmod 4755 "${pkgdir}/opt/trae-cn/chrome-sandbox"

    # Launcher
    install -Dm755 "${srcdir}/trae-cn.sh" "${pkgdir}/usr/bin/trae-cn"

    # Desktop entry
    install -Dm644 "${srcdir}/trae-cn.desktop" "${pkgdir}/usr/share/applications/trae-cn.desktop"

    # Icon
    install -Dm644 "${pkgdir}/opt/trae-cn/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/trae-cn.png"

    # License
    install -Dm644 "${pkgdir}/opt/trae-cn/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/trae-cn/resources/app/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices"
    install -Dm644 "${pkgdir}/opt/trae-cn/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

    # Shell completions
    install -Dm644 "${pkgdir}/opt/trae-cn/resources/completions/bash/trae-cn" "${pkgdir}/usr/share/bash-completion/completions/trae-cn"
    install -Dm644 "${pkgdir}/opt/trae-cn/resources/completions/zsh/_trae-cn" "${pkgdir}/usr/share/zsh/site-functions/_trae-cn"

    # Remove unnecessary files
    rm -rf "${pkgdir}/opt/trae-cn/node_modules"
    find "${pkgdir}/opt/trae-cn" -name "*.asc" -delete
    find "${pkgdir}/opt/trae-cn" -name "*.bat" -delete
    find "${pkgdir}/opt/trae-cn" -type d -name "rush-logs" -exec rm -rf {} +

    # Remove bundled GCC runtime libraries (conflict with system gcc-libs, breaks ckg indexing)
    rm -fv "${pkgdir}/opt/trae-cn/resources/app/modules/ckg/binary/libstdc++.so.6"
    rm -fv "${pkgdir}/opt/trae-cn/resources/app/modules/ckg/binary/libgcc_s.so.1"
}
