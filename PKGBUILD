# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=pixelorama
pkgver=0.9
pkgrel=1
pkgdesc="A free & open-source 2D sprite editor"
arch=('i686' 'pentium4' 'x86_64')
url="https://orama-interactive.itch.io/pixelorama"
_url="https://github.com/Orama-Interactive/Pixelorama"
license=('MIT')
depends=('alsa-lib' 'hicolor-icon-theme' 'libglvnd' 'libpulse' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr')
makedepends=('curl' 'godot' 'unzip' 'xorg-server-xvfb')
provides=('pixelorama')
conflicts=('pixelorama-bin' 'pixelorama-git')
source=("${pkgname^}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha512sums=('5ae5a0a621a82d09fe9970503a5848db0fd95830d631a9b433f151351c5ef9b7098603de661c8b9070c73eccfcbc107ac00767e077227e70ab95cd2c8182dbdf')

prepare() {
  # Checks if the user's directory has the export templates
  # and downloads them, if necessary

  # Get Godot Engine version
  _godot_bin=$(which godot)
  _godot_version_full_string=$(strings ${_godot_bin} | grep "Godot Engine v" | sed 's/.*\ v//' | sed 's/\ .*//' | head -1)
  _godot_version=${_godot_version_full_string%.*}
  _godot_version_number=$(echo ${_godot_version} | sed 's/\.[[:alpha:]].*//')

  _templates_home_dir=~/.local/share/godot/templates/${_godot_version}
  
  if [ ! -d ${_templates_home_dir} ]
  then
    _templates_file="Godot_v$(echo ${_godot_version} | sed 's/\(.*\)\./\1-/')_export_templates.tpz"
    _templates_url=https://downloads.tuxfamily.org/godotengine/${_godot_version_number}
    curl -O ${_templates_url}/SHA512-SUMS.txt
    grep ${_templates_file} SHA512-SUMS.txt > ${_templates_file}.sha512sum

    if [ ! -f ${_templates_file} ]
    then
      curl -O ${_templates_url}/${_templates_file}
    fi

    if ! sha512sum -c ${_templates_file}.sha512sum ; then
      curl -O ${_templates_url}/${_templates_file}
    fi

    mkdir -p ${_templates_home_dir}
    unzip ${_templates_file} 'templates/*' -d ${_templates_home_dir}
    cd ${_templates_home_dir}
    mv templates/* .
    rmdir templates
  fi

  sed -i "s/enable_file_logging=true/enable_file_logging=false/" \
         "${srcdir}/${pkgname^}-${pkgver}/project.godot"

  echo '#!/bin/sh' > "${srcdir}/${pkgname^}-${pkgver}/Misc/Linux/${pkgname}.sh"
  echo "exec /usr/lib/${pkgname}/${pkgname} \"\$@\"" >> "${srcdir}/${pkgname^}-${pkgver}/Misc/Linux/${pkgname}.sh"
}

build() {
  cd "${srcdir}/${pkgname^}-${pkgver}"
  mkdir -p build
  xvfb-run godot --export "Linux/X11 $(getconf LONG_BIT)-bit" --path . project.godot build/${pkgname}
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
