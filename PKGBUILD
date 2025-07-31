# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=lvgl-editor-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='LVGL editor (AppImage)'
url='https://lvgl.io/editor'
# The license is not completely clear. It is free (as in beer) for hobby projects
license=('UNLICENSED')
arch=('x86_64')
depends=()
makedepends=()
options=('!strip')

source=(
  "https://github.com/lvgl/lvgl_editor/releases/download/v.${pkgver}/LVGL_Editor-${pkgver}-linux.zip"
  'lvgl-editor'
)

sha256sums=(
  '6dd79435f4402d15cf45147109ee30f53641f9cd0af839285e88c982f4febf2b'
  'e6f3d47b68410a1cd27ac3d5bd10dd660ff0659dab7a48d94c06c8380fcadcff'
)

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  appimg="LVGL Editor-${pkgver}.AppImage"
  chmod 755 "${appimg}"
  "./${appimg}" --appimage-extract
  hardlink --content --maximize squashfs-root
  find squashfs-root -type d -exec chmod go+rx '{}' '+'
  cd squashfs-root
  sed -i 's#Exec=AppRun --no-sandbox %U#Exec=/opt/lvgl-editor/AppRun --no-sandbox %U#' lvgl-editor.desktop
}

package() {
  install -Dm755 lvgl-editor "${pkgdir}/usr/bin/lvgl-editor"
  install -Dm644 squashfs-root/lvgl-editor.desktop "${pkgdir}/usr/share/applications/lvgl-editor.desktop"
  # TODO: icons
  install -dm755 "${pkgdir}/opt"
  mv squashfs-root "${pkgdir}/opt/lvgl-editor"
}
