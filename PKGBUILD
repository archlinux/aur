# Maintainer: pika02 <pikakolendo02 at gmail dot com>

pkgname=codex-x-bin
pkgver=0.3.33
pkgrel=1
pkgdesc='OpenAI Codex 桌面端/CLI 的可视化管理工具，具有 Provider/API 切换、会话同步、提示词注入、Skills/MCP 管理、TOML 配置可视化'
arch=('x86_64')
url='https://github.com/yynxxxxx/Codex-X'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'glibc'
         'gcc-libs' 'hicolor-icon-theme')
provides=('codex-x')
conflicts=('codex-x')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Codex-X-${pkgver}-linux-x64.deb"
        "LICENSE::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('68b974a82a8ba7edf3dd783457748201f7c5918c79a25b63a4efb2b48dc39438'
            '7003c0131cc654fc3aae1633fcd0c2ee53d75b945b25d9dbd7070f9abe6b3c0c')

prepare() {
    bsdtar -xOf "${pkgname}-${pkgver}.deb" data.tar.gz | bsdtar -xf - -C "${srcdir}"
    # 修复上游 desktop 文件 Categories 为空的问题
    sed -i 's/^Categories=.*/Categories=Development;/' \
        "${srcdir}/usr/share/applications/Codex-X.desktop"
}

package() {
    install -Dm755 "${srcdir}/usr/bin/codex-x" "${pkgdir}/usr/bin/codex-x"
    install -Dm644 "${srcdir}/usr/share/applications/Codex-X.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    for _size in 32x32 128x128 256x256@2; do
        install -Dm644 \
            "${srcdir}/usr/share/icons/hicolor/${_size}/apps/codex-x.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/codex-x.png"
    done

    install -Dm644 "${srcdir}/usr/lib/Codex-X/THIRD_PARTY_NOTICES.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
