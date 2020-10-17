# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

_pkgname=Pixelorama
pkgname=pixelorama
pkgver=0.8.1
pkgrel=1
pkgdesc="A free & open-source 2D sprite editor"
arch=('i686' 'pentium4' 'x86_64')
url="https://orama-interactive.itch.io/pixelorama"
_url="https://github.com/Orama-Interactive/Pixelorama"
license=('MIT')
depends=('alsa-lib' 'hicolor-icon-theme' 'libglvnd' 'libpulse' 'libxcursor' 'libxinerama' 'libxrandr')
makedepends=('curl' 'godot' 'unzip')
provides=('pixelorama')
conflicts=('pixelorama-bin' 'pixelorama-git')
source=("${_pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha512sums=('5d10510ac4452c7a07e1c51a213839ac57af39d7c7f6f6c8c7bc166094c3af7cbb7d8eb343a64ca0cfd1ad269327fac17d0f93625a977cfa27be7663626e446f')

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

  echo "#!/bin/sh" >> "${srcdir}/${_pkgname}-${pkgver}/Misc/Linux/${pkgname}.sh"
  echo "exec /usr/lib/${pkgname}/${pkgname} \"\$@\"" >> "${srcdir}/${_pkgname}-${pkgver}/Misc/Linux/${pkgname}.sh"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p build
  godot --export "Linux/X11 $(getconf LONG_BIT)-bit" --path . project.godot build/${pkgname}
}
    
package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/build/${pkgname}" \
                 "${pkgdir}/usr/lib/${pkgname}/${pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/${pkgname}.pck" \
                 "${pkgdir}/usr/lib/${pkgname}/${pkgname}.pck"

  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/Misc/Linux/${pkgname}.sh" \
                 "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/Misc/Linux/com.orama_interactive.${_pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/com.orama_interactive.${pkgname}.desktop"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/Misc/Linux/com.orama_interactive.${_pkgname}.appdata.xml" \
                 "${pkgdir}/usr/share/metainfo/com.orama_interactive.${pkgname}.appdata.xml"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/graphics/icons/icon.png" \
                 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
