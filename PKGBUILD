# Maintainer: neko_ayaya
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=aionui-bin
_pkgname=aionui
pkgver=1.5.5
pkgrel=1
pkgdesc="Transform your command-line experience into a modern, efficient AI Chat interface."
arch=('x86_64')
url="https://github.com/iOfficeAI/AionUi" # <-- 示例网址，请替换为官方项目地址
license=('unknown')

depends=(
  'gtk3'
  'nss'
  'libcups'
  'mesa'
  'alsa-lib'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}_${pkgver}_linux_amd64.deb::${url}/releases/download/v${pkgver}/AionUi-${pkgver}-linux-amd64.deb")

sha256sums_x86_64=('b2a21c8264f20013161f4de9e8d227cd07f96eedec4c85eb5e292d01d38d11a3')

package() {
  # .deb 包本质是一个 ar 归档文件，先用 ar 命令解开
  ar x "${srcdir}/${_pkgname}_${pkgver}_linux_amd64.deb"

  # 将核心文件 data.tar.xz 解压到打包目录中
  # bsdtar 会自动保留正确的文件权限
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  sed -i 's#^Icon=aionui#Icon=/usr/share/icons/hicolor/1024x1024/apps/AionUi.png#' "${pkgdir}/usr/share/applications/AionUi.desktop"
  sed -i 's/^Comment=\${description}/Comment=AionUi for agent/' "${pkgdir}/usr/share/applications/AionUi.desktop"

  # (可选但推荐) 移除 Debian 特有的 lintian 目录，它在 Arch Linux 中没有用处
  rm -rf "${pkgdir}/usr/share/lintian"

  # 确保所有文件的所有者是 root，这是标准做法
  chown -R root:root "${pkgdir}"
}
