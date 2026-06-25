# Maintainer: logan_reed <liulingzhang.work@icloud.com>
# Contributor: springtwr <springtwr@outlook.com>

pkgname=trae
pkgver=2.3.44884
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
source_x86_64=("Trae-linux-x64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.44884/linux/Trae-linux-x64.tar.gz")
source_aarch64=("Trae-linux-arm64-${pkgver}-${pkgrel}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.44884/linux/Trae-linux-arm64.tar.gz")
b2sums=('2331b0d37fff8478ea37cbf9e5c2e70a59631aae6efb44741fc6c1a8dce65557098e9dffa8c30148ef27432802bec3d1eda279021421e5d3f979e80900662726'
            '656c5d6bea6ef15185e0d8ee0181276f6de3bfae8e66a2c65772a5f1354727952dd020dca057246139a2bab8f4805057fa2db367a6ba0a1b90d9ffd7fcab8412')
b2sums_x86_64=('e86710dd567533b1039e0fb0335ae330fa13a3c445e46aed3a938b0f6f475aa51482901e53bb1001a1ba9b0ab68c8bee377ae94fad3c5e720e432cce0c731e0a')
b2sums_aarch64=('4d1851a37f39ca752477372e3effffc68ee0b4b11b231e51231df74cde597a3fdd7a1133b486539c1e5ef6633c2d065626112e8352737637f1dc561aea7f30ec')

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
