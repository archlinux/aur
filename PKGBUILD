pkgname=squareline-studio
_pkgname=SquareLine_Studio
pkgver=1.6.1
pkgrel=1
pkgdesc="Visual drag-and-drop UI editor to create beautiful Graphical User Interfaces quickly and easily"
arch=('x86_64')
url="https://squareline.io/"
license=('custom')
source=("https://static.squareline.io/downloads/${_pkgname}_Linux_v${pkgver//./_}.zip")
sha256sums=('28bcfbd475ad1670ec688117cbfeebbd6b0bedb52b16e64011d4c6eeca47ab5d')

prepare() {
  # Packaging folder structure can change.
  # Find lvgl to find the root of the source
  _lvgl_path=$(find "${srcdir}" -type d -name lvgl | head -n 1)
  export _source_dir=$(dirname "${_lvgl_path}")
}

package() {
  install -dm755 ${pkgdir}/opt/
  # Using normalized source path from _source_dir
  cp -a "${_source_dir}" ${pkgdir}/opt/${pkgname}

  cd ${pkgdir}/opt/${pkgname}

  # binary
  chmod 755 ${_pkgname}.x86_64 lvgl/lv_font_conv-linux
  find lvgl/ -type d -name 'lvgl_v*' -exec chmod 755 {}/server/micropython  {}/server/server.py \;

  # desktop entry
  sed "s|__folder__|/opt/${pkgname}|g"  squareline_studio.desktop.template > ${pkgname}.desktop
  install -Dm644 ${pkgname}.desktop -t ${pkgdir}/usr/share/applications
}

# vim: set sw=2 ts=2 et:
