# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Contributor: springtwr <springtwr@outlook.com>

pkgname=trae
pkgver=2.3.55932
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
source_x86_64=("Trae-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.55932/linux/Trae-linux-x64.tar.gz")
source_aarch64=("Trae-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.55932/linux/Trae-linux-arm64.tar.gz")
b2sums=('2331b0d37fff8478ea37cbf9e5c2e70a59631aae6efb44741fc6c1a8dce65557098e9dffa8c30148ef27432802bec3d1eda279021421e5d3f979e80900662726'
            '656c5d6bea6ef15185e0d8ee0181276f6de3bfae8e66a2c65772a5f1354727952dd020dca057246139a2bab8f4805057fa2db367a6ba0a1b90d9ffd7fcab8412')
b2sums_x86_64=('beab2e81de1b9a2ccfd28e70f65dac4606e0ccc0dee4e736406456e6b0a907b42fc16cddbe03eec97447368254bf5160b9e0db91117b058c9460d641f25b5126')
b2sums_aarch64=('61fb9ff00153a4bded9b9c9a98f627154fdb259c19250b1e32d43122a998c4e54f40bdc017b743edf483f8c2ce4da13584fa46a10073c0de5fee09080ff001a4')

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
