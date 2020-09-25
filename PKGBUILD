# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

_pkgname=Pixelorama
pkgname=pixelorama
pkgver=0.8
pkgrel=1
pkgdesc="A free & open-source 2D sprite editor, made with the Godot Engine"
arch=('i686' 'pentium4' 'x86_64')
url="https://www.orama-interactive.com/pixelorama"
_url="https://github.com/Orama-Interactive/Pixelorama"
license=('MIT')
depends=('libpulse' 'alsa-lib' 'libxrandr' 'libglvnd' 'libxcursor' 'libxinerama' 'hicolor-icon-theme')
makedepends=('curl' 'godot' 'unzip')
provides=('pixelorama')
conflicts=('pixelorama-bin' 'pixelorama-git')
source=("${_pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha512sums=('f9496d52a4053257ba0a87244b860a6540d02db1f1adc770a6b5753b01f2b908708f98d2c1981651f40c4910238ffb7ccec8a435d5cef88927ce50ba31b9f638')

prepare() {
  # Checks if the user's directory has the export templates
  # and downloads them, if necessary

  # Get Godot Engine version
  godot_bin=$(which godot)
  godot_version_full_string=$(strings ${godot_bin} | grep "Godot Engine v" | sed 's/.*\ v//' | sed 's/\ .*//' | head -1)
  godot_version=${godot_version_full_string%.*}
  godot_version_number=$(echo ${godot_version} | sed 's/\.[[:alpha:]].*//')

  templates_home_dir=~/.local/share/godot/templates/${godot_version}
  
  if [ ! -d ${templates_home_dir} ]
  then
    templates_file="Godot_v$(echo ${godot_version} | sed 's/\(.*\)\./\1-/')_export_templates.tpz"
    templates_url=https://downloads.tuxfamily.org/godotengine/${godot_version_number}
    curl -O ${templates_url}/SHA512-SUMS.txt
    grep ${templates_file} SHA512-SUMS.txt > ${templates_file}.sha512sum
    if [ ! -f ${templates_file} ]
    then
      curl -O ${templates_url}/${templates_file}
    fi
    if ! sha512sum -c ${templates_file}.sha512sum ; then
      curl -O ${templates_url}/${templates_file}
    fi
    mkdir -p ${templates_home_dir}
    unzip ${templates_file} 'templates/*' -d ${templates_home_dir}
    cd ${templates_home_dir}
    mv templates/* .
    rmdir templates
  fi

  sed -i "s/enable_file_logging=true/enable_file_logging=false/" \
         "${srcdir}/${_pkgname}-${pkgver}/project.godot"

  echo "#!/bin/sh" >> ${srcdir}/${pkgname}
  echo "exec /usr/lib/${pkgname}/${pkgname} \"\$@\"" >> ${srcdir}/${pkgname}
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p build
  godot --export "Linux/X11 $(getconf LONG_BIT)-bit" --path . project.godot build/${pkgname}
}
    
package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/share/metainfo"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

  install -Dm755 "${srcdir}/${pkgname}" \
                 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/build/${pkgname}" \
                 "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/${pkgname}.pck" \
                 "${pkgdir}/usr/lib/${pkgname}/${pkgname}.pck"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/Misc/Linux/com.orama_interactive.${_pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/com.orama_interactive.${pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/Misc/Linux/com.orama_interactive.${_pkgname}.appdata.xml" \
                 "${pkgdir}/usr/share/metainfo/com.orama_interactive.${pkgname}.appdata.xml"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/graphics/icons/icon.png" \
                 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
