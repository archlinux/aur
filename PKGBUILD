# Maintainer: illusory
pkgname=mactahoe-icon-theme
pkgver=2026.09.10
pkgrel=4
pkgdesc='macOS Tahoe 风格的图标与鼠标指针主题（预编译，无需渲染工具）'
arch=('any')
url='https://github.com/vinceliuice/MacTahoe-icon-theme'
# GitHub 下载加速镜像；换镜像可 makepkg GH_MIRROR=https://另一镜像/
_gh_mirror="${GH_MIRROR:-https://gh-proxy.cn/}"
_gh_mirror="${_gh_mirror%/}/"
license=('GPL-3.0-or-later')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
options=('!strip')
_tag=2026-09-10
source=("${_gh_mirror}https://github.com/vinceliuice/MacTahoe-icon-theme/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('6330369e9e10a28cfc8da598ebf63a7204be705403519963ff84e1cb84719d35')

prepare() {
  cd "MacTahoe-icon-theme-${_tag}"
  # 缓存由 hicolor-icon-theme 提供的 gtk-update-icon-cache 触发器统一生成
  sed -i '/gtk-update-icon-cache/d' install.sh
  # 鼠标指针单独作为 MacTahoe-cursors 主题安装，不重复嵌入图标目录
  sed -i 's/install_theme && install_cursor_theme/install_theme/' install.sh
}

build() {
  true
}

package() {
  cd "MacTahoe-icon-theme-${_tag}"
  install -d "${pkgdir}/usr/share/icons"

  # 图标主题（默认蓝 / light / dark 三套）
  ./install.sh -d "${pkgdir}/usr/share/icons"

  # 鼠标指针主题（独立可选，来自上游预编译的 dist / dist-dark）
  install -d \
    "${pkgdir}/usr/share/icons/MacTahoe-cursors" \
    "${pkgdir}/usr/share/icons/MacTahoe-dark-cursors"
  cp -r cursors/dist/*      "${pkgdir}/usr/share/icons/MacTahoe-cursors/"
  cp -r cursors/dist-dark/* "${pkgdir}/usr/share/icons/MacTahoe-dark-cursors/"
}