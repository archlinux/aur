# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Contributor: springtwr <springtwr@outlook.com>

pkgname=trae-cn
pkgver=2.3.40353
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
source_x86_64=("Trae_CN-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.40353/linux/Trae_CN-linux-x64.tar.gz")
source_aarch64=("Trae_CN-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.40353/linux/Trae_CN-linux-arm64.tar.gz")
b2sums=('f7998b11d3f97f84895231ca1ca9a05bd3a97106f363744fc5f13402c15c419cc56d09e52c9366bfbd75c016b0aada69286bef8879df4925df0ef446212d7c45'
            '02d2c5d433e4d56a958bc7766563d977d79070f06c94bfa5829d2eb3c20c50111c3ff5174109bdb6f8f20cafdf4730f053f37c3a7a03e6b0f466446981dcc407')
b2sums_x86_64=('124065ce9d3ec62708b22696dbb6e311ca55f09eebdb8d99f530cec86bbbc2877839b1416c401477352e1ff63da1dd28f83f950694f5d847ef602b91114cc6b7')
b2sums_aarch64=('d6069c4e8f352a9bb5ec4c79f45c9d1524b0344a9a39bdf174b576c05828787dc3fb6f1075bad276e9cdb9482d5efd982dc377870ab1d2120f46781e9c20e605')

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
