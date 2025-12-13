pkgname=any-code-appimage
pkgver=5.9.8
pkgrel=1
pkgdesc='Any Code 是一个为 AI 驱动的代码开发工作流量身打造的专业桌面应用，支持 Claude Code CLI、OpenAI Codex 和 Google Gemini CLI 三大 AI 引擎。'
arch=('x86_64')
url='https://github.com/anyme123/Any-code'
license=()
options=("!strip")
depends=('fuse2')
source=(
    "https://github.com/anyme123/Any-code/releases/download/v${pkgver}/Any.Code_${pkgver}_amd64.AppImage"
)
sha512sums=(
    '2ac55301e7db65317d51d4f52342416f6aa1d6fbfad5e291cf193c08925e4ce8990dcb262bc31600ffdbafd7e6df34fd07a99aba6870c08b3ddf9fe2d36ffcbf'
)

_installdir=/opt/any-code

prepare() {
    chmod a+x ./Any.Code_${pkgver}_amd64.AppImage
    ./Any.Code_${pkgver}_amd64.AppImage --appimage-extract >/dev/null
    mv "squashfs-root/Any Code.png" "squashfs-root/any-code.png"
    mv "squashfs-root/usr/share/applications/Any Code.desktop" "squashfs-root/any-code.desktop"
    sed -i "s+Exec=any-code+Exec=env ${_installdir}/any-code.AppImage+" "squashfs-root/any-code.desktop"
    sed -i 's#Icon=any-code#Icon=/usr/share/icons/hicolor/apps/any-code.png#g' squashfs-root/any-code.desktop
}

package() {
    install -Dm755 "Any.Code_${pkgver}_amd64.AppImage" "${pkgdir}/${_installdir}/any-code.AppImage"
    install -Dm644 "squashfs-root/any-code.png" "${pkgdir}/usr/share/icons/hicolor/apps/any-code.png"
    install -Dm644 "squashfs-root/any-code.desktop" "${pkgdir}/usr/share/applications/any-code.desktop"
}
