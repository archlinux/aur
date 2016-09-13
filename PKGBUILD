# Maintainer: Adam Scott <ascott.ca@gmail.com>
pkgname='pico8-bin'
_pkgname='pico8'
pkgver='0.1.9'
pkgrel=1
pkgdesc="A fantasy console for making, sharing and playing tiny games and other computer programs."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.lexaloffle.com/pico-8.php"
license=('custom:commercial')
depends=('glibc' 'hicolor-icon-theme')
# Lexaloffle uses other terms for architecture
_arch_i386="i386"
_arch_amd64="amd64"
_arch_arm="raspi"
_file_i386="pico-8_${pkgver}_${_arch_i386}.zip"
_file_amd64="pico-8_${pkgver}_${_arch_amd64}.zip"
_file_arm="pico-8_${pkgver}_${_arch_arm}.zip"
_sha256sum_i386="8bfd377990effe22a550e86337fc2979516709a433486011dc80db86eaa778f3"
_sha256sum_amd64="c467f9ee7ca4a88a9b22c1e01e1c0e09d78ce771873d0dd816a6b7ef4d86a421"
_sha256sum_arm="f686c71a411a9b95157b24fe7aada8b7478c90400c1919e7a12466f04911fb8b"
source_i686=("local://${_file_i386}")
source_x86_64=("local://${_file_amd64}")
source_armv6h=("local://${_file_arm}")
source_armv7h=("local://${_file_arm}")
sha256sums_i686=("${_sha256sum_i386}")
sha256sums_x86_64=("${_sha256sum_amd64}")
sha256sums_armv6h=("${_sha256sum_arm}")
sha256sums_armv7h=("${_sha256sum_arm}")

# Gets the current platform
[ "${CARCH}" = "i686" ] && _platform="${_arch_i386}"
[ "${CARCH}" = "x86_64" ] && _platform="${_arch_amd64}"
[ "${CARCH}" = "armv6h" ] && _platform="${_arch_arm}"
[ "${CARCH}" = "armv7h" ] && _platform="${_arch_arm}"

prepare () {
  # As for version 0.1.9, the amd64 release is the only one with a subfolder named pico-8
  if [ "${_platform}" = "${_arch_amd64}" ]; then
    mv "./pico-8/"* .
  fi

  # Changes licence and icon filenames in order to comply naming conventions
  mv "license.txt" "LICENSE"
  mv "lexaloffle-pico8.png" "pico8.png"
}

package () {
  # Creates variables storing target paths
  local _target_licenses="/usr/share/licenses/${pkgname}"
  local _target_share="/usr/share/${_pkgname}"
  local _target_bin="/usr/bin"
  local _target_mimepackages="/usr/share/mime/packages"
  local _target_apps="/usr/share/applications"
  local _target_icons="/usr/share/icons/hicolor/128x128/apps"

  # Creates variables storing pkg paths
  local _pkg_licenses="${pkgdir}/${_target_licenses}"
  local _pkg_share="${pkgdir}/${_target_share}"
  local _pkg_bin="${pkgdir}/${_target_bin}"
  local _pkg_mimepackages="${pkgdir}/${_target_mimepackages}"
  local _pkg_apps="${pkgdir}/${_target_apps}"
  local _pkg_icons="${pkgdir}/${_target_icons}"

  # Creates pkg directories
  mkdir -p "${_pkg_licenses}"
  mkdir -p "${_pkg_share}"
  mkdir -p "${_pkg_bin}"
  mkdir -p "${_pkg_mimepackages}"
  mkdir -p "${_pkg_apps}"
  mkdir -p "${_pkg_icons}"

  # Creates local variables storing filenames
  local _pico8_license="LICENSE"
  local _pico8_bin="pico8"
  local _pico8_dyn="pico8_dyn"
  local _pico8_dat="pico8.dat"
  local _pico8_txt="pico-8.txt"
  local _pico8_mime="pico8.xml"
  local _pico8_desktop="pico8.desktop"
  local _pico8_icon="pico8.png"

  # Creates a MIME configuration file
  cat <<< "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<mime-info xmlns=\"http://www.freedesktop.org/standards/shared-mime-info\">
  <mime-type type=\"application/pico8\">
    <comment>pico-8 file</comment>
    <magic priority=\"50\">
      <match type=\"string\" value=\"pico-8 cartridge\" offset=\"0\"/>
    </magic>
    <glob-deleteall/>
    <glob pattern=\"*.p8\"/>
  </mime-type>
</mime-info>" > "${_pico8_mime}"

  # Creates a desktop entry file
  cat <<< "[Desktop Entry]
Type=Application
Version=1.0
Name=PICO-8
Comment=${pkgdesc}
Exec=/usr/bin/${_pico8_bin}
MimeType=application/pico8
Icon=${_pico8_bin}
Terminal=false
Categories=Development;Game" > "${_pico8_desktop}"

  # The raspi release is now the only one to ship with pico8_dyn
  if [ "${_platform}" = "${_arch_arm}" ]; then
    install -Dm644 "${_pico8_dyn}" "${_pkg_share}/${_pico8_dyn}"
  fi

  # Installs the extracted files
  install -Dm644 "${_pico8_license}" "${_pkg_licenses}/${_pico8_license}"
  install -Dm755 "${_pico8_bin}" "${_pkg_share}/${_pico8_bin}"
  install -Dm644 "${_pico8_dat}" "${_pkg_share}/${_pico8_dat}"
  install -Dm644 "${_pico8_txt}" "${_pkg_share}/${_pico8_txt}"
  install -Dm644 "${_pico8_mime}" "${_pkg_mimepackages}/${_pico8_mime}"
  install -Dm644 "${_pico8_desktop}" "${_pkg_apps}/${_pico8_desktop}"
  install -Dm644 "${_pico8_icon}" "${_pkg_icons}/${_pico8_icon}"

  # Links the installed binary to /usr/bin
  ln -s "${_target_share}/${_pico8_bin}" "${_pkg_bin}/${_pico8_bin}"
}

