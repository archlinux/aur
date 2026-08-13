# Maintainer: neko_ayaya
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=aionui

pkgname=${_appname}-bin
pkgver=2.1.54
pkgrel=1
pkgdesc="Transform your command-line experience into a modern, efficient AI Chat interface."

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/iOfficeAI/AionUi" # <-- 示例网址，请替换为官方项目地址

license=('Apache-2.0')

depends=(
  'gtk3'
  'nss'
  'libcups'
  'mesa'
  'alsa-lib'
)

provides=("${_appname}")
conflicts=("${_appname}")

source_x86_64=("${_appname}_${pkgver}_${arch[0]}.deb::https://static.aionui.com/releases/${pkgver}/AionUi-${pkgver}-${_barch[0]}.deb")
source_aarch64=("${_appname}_${pkgver}_${arch[1]}.deb::https://static.aionui.com/releases/${pkgver}/AionUi-${pkgver}-${_barch[1]}.deb")

sha256sums_x86_64=('d00f16bfd689d94e4f2e5f425322ac1f2990e5e75071e0d9e47baf125dc9a523')
sha256sums_aarch64=('d4bb8970bb7310b85e94919b8fbce9e46db234e0e435451ddfe5c8c4aa36e911')

package() {
  # .deb 包本质是一个 ar 归档文件，先用 ar 命令解开
  ar x "${srcdir}/${_appname}_${pkgver}_${CARCH}.deb"

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
