# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Contributor: springtwr <springtwr@outlook.com>

pkgname=trae-us
pkgver=2.3.93439
pkgrel=1
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
source_x86_64=("Trae-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.93439/linux/TRAE-linux-x64.tar.gz")
source_aarch64=("Trae-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.93439/linux/TRAE-linux-arm64.tar.gz")
b2sums=('2331b0d37fff8478ea37cbf9e5c2e70a59631aae6efb44741fc6c1a8dce65557098e9dffa8c30148ef27432802bec3d1eda279021421e5d3f979e80900662726'
            '656c5d6bea6ef15185e0d8ee0181276f6de3bfae8e66a2c65772a5f1354727952dd020dca057246139a2bab8f4805057fa2db367a6ba0a1b90d9ffd7fcab8412')
b2sums_x86_64=('bd22a253b100b0f062fe7bb96efd6afead437e1f78d18be9146c2cb0d2d87ab53b9dc689c7855410ac2ea2f9252d415d415e906614473a5895d713e6b230918b')
b2sums_aarch64=('67e549814e5d9ecc5429eef63deead3ad8264b94debd635e5b3e3ed14c3d6c3a723117ba0eb72d5525aa1302369542d2bd1fd437685f2399ecedb6fd0ac5a20e')

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
