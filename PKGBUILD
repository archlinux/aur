# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=pixelorama
pkgver=1.1.6
pkgrel=1
pkgdesc="A free & open-source 2D sprite editor"
arch=('x86_64')
url="https://orama-interactive.itch.io/pixelorama"
_url="https://github.com/Orama-Interactive/Pixelorama"
license=('MIT')
depends=('hicolor-icon-theme' 'libglvnd' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr')
makedepends=('curl' 'godot>=4.3' 'godot-export-templates-linux' 'unzip')
provides=('pixelorama')
source=("${pkgname^}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
b2sums=('e12f32858d21253e4ab11f9447590ed0be2cf7e4589802ab34739d0de056d209d78cff3256ea9f24e413cca52e457fc76730879a5a5936395eed7025272eee74')

prepare() {
  # Set godot templates location
  # Adapted from the "luxtorpeda-git" PKGBUILD
  for mode in debug release; do
          local _template=$(find /usr/share/godot/export_templates -type f -name "linux_${mode}.$(uname -m)" -print -quit)
    [[ -z "$_template" ]] && echo "Missing Godot template for $mode" && return 1
    sed -E -e 's&^(custom_template/'${mode}')=.*$&\1="'"${_template}"'"&' \
        -i "${srcdir}/${pkgname^}-${pkgver}/export_presets.cfg"
  done

  sed -i "/enable_file_logging/ s/true/false/" \
         "${srcdir}/${pkgname^}-${pkgver}/project.godot"
 
  echo '#!/bin/sh' > "${srcdir}/${pkgname^}-${pkgver}/Misc/Linux/${pkgname}.sh"
  echo "exec /usr/lib/${pkgname}/${pkgname} \"\$@\"" >> "${srcdir}/${pkgname^}-${pkgver}/Misc/Linux/${pkgname}.sh"
}

build() {
  cd "${srcdir}/${pkgname^}-${pkgver}"
  mkdir -p build
  godot --export-release "Linux $(getconf LONG_BIT)-bit" --display-driver headless --path . project.godot build/${pkgname}
}
    
package() {
  _xdg_desktop_name="com.orama_interactive.${pkgname^}"

  install -Dm755 "${srcdir}/${pkgname^}-${pkgver}/build/${pkgname}" \
                 "${pkgdir}/usr/lib/${pkgname}/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname^}-${pkgver}/build/${pkgname}.pck" \
                 "${pkgdir}/usr/lib/${pkgname}/${pkgname}.pck"

  install -Dm755 "${srcdir}/${pkgname^}-${pkgver}/Misc/Linux/${pkgname}.sh" \
                 "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname^}-${pkgver}/Misc/Linux/${_xdg_desktop_name}.desktop" \
                 "${pkgdir}/usr/share/applications/${_xdg_desktop_name}.desktop"

  install -Dm644 "${srcdir}/${pkgname^}-${pkgver}/Misc/Linux/${_xdg_desktop_name}.appdata.xml" \
                 "${pkgdir}/usr/share/metainfo/${_xdg_desktop_name}.appdata.xml"

  install -Dm644 "${srcdir}/${pkgname^}-${pkgver}/assets/graphics/icons/icon.png" \
                 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -Dm644 "${srcdir}/${pkgname^}-${pkgver}/LICENSE" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
