pkgname=any-code-appimage
pkgver=5.18.0
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
sha512sums=('75fe1af30c5a65834de5c98e7a966f28abf52be4a34dd560329b452c2cbe5c0702a5ab4a6a6e3c57bedfa3123bd724b366c7d8d0bbc55232a3f2c037f7ea4d4d')

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
