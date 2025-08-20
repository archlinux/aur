# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=pixelorama
pkgver=1.1.4
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
b2sums=('8a68071187e05bf982b5e8f625aaf34deef4b265c37f27e4f387d11f644a42688e537cec901f838c0eed91706e9f9618c937daeed0b408c5d7c71ff6485da5a6')

prepare() {
   # Checks if the user's directory has the export templates
   # and creates a symbolic link if necessary
 
   # Get Godot Engine version
   _godot_version_full_string=$(godot --version)
   _godot_version=${_godot_version_full_string%.*}
 
   _templates_home_dir="$HOME/.local/share/godot/export_templates/${_godot_version}"
   _template_file="linux_release.$CARCH"
   
   if [ ! -d ${_templates_home_dir} ]
   then
     mkdir -p $_templates_home_dir
   fi
 
   if [ ! -f ${_templates_home_dir}/${_template_file} ]
   then
     ln -s "/usr/share/godot/export_templates/${_godot_version}/${_template_file}" \
           "${_templates_home_dir}/${_template_file}"
   fi

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
