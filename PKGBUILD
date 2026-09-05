# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Contributor: springtwr <springtwr@outlook.com>

pkgname=trae-cn
pkgver=2.3.79946
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
source_x86_64=("Trae_CN-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.79946/linux/TraeCode_CN-linux-x64.tar.gz")
source_aarch64=("Trae_CN-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.79946/linux/TraeCode_CN-linux-arm64.tar.gz")
b2sums=('f7998b11d3f97f84895231ca1ca9a05bd3a97106f363744fc5f13402c15c419cc56d09e52c9366bfbd75c016b0aada69286bef8879df4925df0ef446212d7c45'
            '02d2c5d433e4d56a958bc7766563d977d79070f06c94bfa5829d2eb3c20c50111c3ff5174109bdb6f8f20cafdf4730f053f37c3a7a03e6b0f466446981dcc407')
b2sums_x86_64=('c56b3c098b2e3e1e1a36d7c453fe6fa4f1bc1d00a9321fadfc40df81c4c8b00c3f6a4e240d0f667dd84c4947a60d7c535b196a0f5e765cbbb5037fdac804bbd9')
b2sums_aarch64=('0c1a5fbee188cb88e3f68ba992caffab112eaa0e67ab66056d24ce28ce5a4c0ce44e79078e0f1251b8fffa069e3cf2361b569f148cae1860e751ccef09d95787')

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
