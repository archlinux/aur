pkgname=rkdeveloptool-gui-appimage
pkgver=5.7.1
pkgrel=1
pkgdesc="RKDevelopTool GUI is a graphical front-end for Rockchip's official rkdeveloptool"
arch=('x86_64')
url='https://github.com/gahingwoo/RKDevelopTool-GUI'
license=('GPL-3.0-only')
options=("!strip")
depends=('fuse2')
source=(
  "rkdeveloptool-gui-v${pkgver}-x86_64.AppImage::https://github.com/gahingwoo/RKDevelopTool-GUI/releases/download/${pkgver}/RKDevelopTool-GUI-${pkgver}-x86_64.AppImage"
)
sha256sums=('3b0f96a87b59d85aa30552e1b2f677f49f27e1fa9b1ae4bc9e35586d18ea5060')

_installdir=/opt/rkdeveloptool-gui
_appimage=rkdeveloptool-gui.AppImage
# 安装到 hicolor 的图标固定叫这个名字,desktop 里的 Icon= 也固定成它,
# 这样上游给 png 起什么名都不影响。
_iconname=rkdeveloptool-gui

prepare() {
  # makepkg 默认不清理 $srcdir,重复构建会保留上一版解压出来的旧文件
  rm -rf squashfs-root
  chmod a+x "./rkdeveloptool-gui-v${pkgver}-x86_64.AppImage"
  ./rkdeveloptool-gui-v${pkgver}-x86_64.AppImage --appimage-extract >/dev/null

  # 上游的桌面文件改过名(5.3.0 是 rkdeveloptool-gui.desktop,5.7.1 改成
  # 反向域名式的 io.github.gahingwoo.rkdeveloptool_gui.desktop),所以这里探测。
  local _found=(squashfs-root/*.desktop)
  if [[ ! -f ${_found[0]} ]]; then
    error "在 squashfs-root/ 下没有找到 .desktop 文件,上游布局可能又变了"
    return 1
  fi
  _desktop=$(basename "${_found[0]}")

  sed -i "s#^Exec=.*#Exec=${_installdir}/${_appimage} %U#" "squashfs-root/${_desktop}"
  sed -i "s#^Icon=.*#Icon=${_iconname}#" "squashfs-root/${_desktop}"
}

package() {
  # --noprepare 时 prepare() 里的探测不会执行,这里兜底
  local _desktop=${_desktop:-$(basename squashfs-root/*.desktop)}
  local _icon _size _meta

  install -Dm755 "rkdeveloptool-gui-v${pkgver}-x86_64.AppImage" "${pkgdir}/${_installdir}/${_appimage}"
  install -Dm644 "squashfs-root/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"

  for _icon in squashfs-root/usr/share/icons/hicolor/*/apps/*.png; do
    [[ -f $_icon ]] || continue
    _size=$(basename "$(dirname "$(dirname "$_icon")")")
    install -Dm644 "$_icon" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_iconname}.png"
  done

  for _meta in squashfs-root/usr/share/metainfo/*.xml; do
    [[ -f $_meta ]] || continue
    install -Dm644 "$_meta" "${pkgdir}/usr/share/metainfo/$(basename "$_meta")"
  done
}
