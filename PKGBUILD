# Maintainer: neko_ayaya
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=aionui-bin
_pkgname=aionui
pkgver=1.8.18
pkgrel=1
pkgdesc="Transform your command-line experience into a modern, efficient AI Chat interface."
arch=('x86_64')
url="https://github.com/iOfficeAI/AionUi"
license=('unknown')

depends=(
  'gtk3'
  'nss'
  'libcups'
  'mesa'
  'alsa-lib'
  'python'
  'python-yaml'
  'python-six'
  'python-pillow'
  'python-reportlab'
  'python-lxml'
  'npm'
  'nodejs'
)

optdepends=(
    'python-pypdf: PDF processing skills'
    'python-openpyxl: Excel processing skills'
    'python-defusedxml: XML processing skills'
    'python-pptx: PowerPoint processing skills'
    'python-pdf2image: PDF to image conversion'
    'python-playwright: Xiaohongshu automation'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}_${pkgver}_linux_amd64.deb::${url}/releases/download/v${pkgver}/AionUi-${pkgver}-linux-amd64.deb")

sha256sums_x86_64=('fc26a986f1177b83122d2df8638841952e5ff48496e28b4503f4389e148111ea')

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
