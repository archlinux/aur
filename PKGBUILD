# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=pixelorama-git
_pkgname=pixelorama
pkgver=1623.5118d30a
pkgrel=2
pkgdesc="A free & open-source 2D sprite editor"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'armv8' 'riscv32' 'riscv64')
url="https://orama-interactive.itch.io/pixelorama"
_url="https://github.com/Orama-Interactive/Pixelorama"
license=('MIT')
depends=('alsa-lib' 'hicolor-icon-theme' 'libglvnd' 'libpulse' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr')
makedepends=('curl' 'godot' 'unzip' 'xorg-server-xvfb')
provides=('pixelorama')
conflicts=('pixelorama-bin' 'pixelorama')
source=("${_pkgname}::git+${_url}.git")
sha512sums=(SKIP)

pkgver()
{
    cd "${_pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  ln -s pixelorama Pixelorama
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
         "${srcdir}/${_pkgname^}/project.godot"

  echo '#!/bin/sh' > "${srcdir}/${_pkgname}/Misc/Linux/${_pkgname}.sh"
  echo "exec /usr/lib/${_pkgname} \"\$@\"" >> "${srcdir}/${_pkgname^}/Misc/Linux/${_pkgname}.sh"
}

build() {
  cd "${srcdir}/${_pkgname^}"
  mkdir -p build
  xvfb-run godot --export "Linux/X11 $(getconf LONG_BIT)-bit" --path . project.godot build/${_pkgname}
}
    
package() {
  _xdg_desktop_name="com.orama_interactive.${_pkgname^}"

  install -Dm755 "${srcdir}/${_pkgname^}/build/${_pkgname}" \
                 "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname^}/build/${_pkgname}.pck" \
                 "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}.pck"

  sed -i 's/usr\/lib\/pixelorama /usr\/lib\/pixelorama\/pixelorama /' "${srcdir}/${_pkgname^}/Misc/Linux/${_pkgname}.sh"
  install -Dm755 "${srcdir}/${_pkgname^}/Misc/Linux/${_pkgname}.sh" \
                 "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname^}/Misc/Linux/${_xdg_desktop_name}.desktop" \
                 "${pkgdir}/usr/share/applications/${_xdg_desktop_name}.desktop"

  install -Dm644 "${srcdir}/${_pkgname^}/Misc/Linux/${_xdg_desktop_name}.appdata.xml" \
                 "${pkgdir}/usr/share/metainfo/${_xdg_desktop_name}.appdata.xml"

  install -Dm644 "${srcdir}/${_pkgname^}/assets/graphics/icons/icon.png" \
                 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  install -Dm644 "${srcdir}/${_pkgname^}/LICENSE" \
                 "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
