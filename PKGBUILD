pkgname=any-code-appimage
pkgver=5.28.5
pkgrel=1
pkgdesc='Any Code 是一个为 AI 驱动的代码开发工作流量身打造的专业桌面应用，支持 Claude Code CLI、OpenAI Codex 和 Google Gemini CLI 三大 AI 引擎。'
arch=('x86_64')
url='https://github.com/anyme123/Any-code'
license=()
options=("!strip")
depends=('fuse2')
source=(
  "https://github.com/anyme123/Any-code/releases/download/v${pkgver}/any-code_${pkgver}_amd64.AppImage"
)
sha512sums=('e5f5d06074197ac8ed4b9bc3b07b87be9eddc2c5a75af15a67d21cf69eaea0f566523b6c08a554bf40fe739b7fd4809803f76a67077df7d8b660d6aa37a5c4aa')

_installdir=/opt/any-code

prepare() {
  chmod a+x ./any-code_${pkgver}_amd64.AppImage
  ./any-code_${pkgver}_amd64.AppImage --appimage-extract >/dev/null
  mv "squashfs-root/Any Code.png" "squashfs-root/any-code.png"
  mv "squashfs-root/usr/share/applications/Any Code.desktop" "squashfs-root/any-code.desktop"
  sed -i "s+Exec=any-code+Exec=env ${_installdir}/any-code.AppImage+" "squashfs-root/any-code.desktop"
  sed -i 's#Icon=any-code#Icon=/usr/share/icons/hicolor/apps/any-code.png#g' squashfs-root/any-code.desktop
}

package() {
  install -Dm755 "any-code_${pkgver}_amd64.AppImage" "${pkgdir}/${_installdir}/any-code.AppImage"
  install -Dm644 "squashfs-root/any-code.png" "${pkgdir}/usr/share/icons/hicolor/apps/any-code.png"
  install -Dm644 "squashfs-root/any-code.desktop" "${pkgdir}/usr/share/applications/any-code.desktop"
}
