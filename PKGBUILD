# Maintainer: (Joe084) <develon69 at gmail dot com>

# Common metadata
pkgname='pico-8'
pkgver='0.2.2c'
pkgrel=1
pkgdesc="A fantasy console for making, sharing and playing tiny games and other computer programs."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.lexaloffle.com/pico-8.php"
license=('custom:commercial')
depends=('glibc' 'hicolor-icon-theme')
replaces=('pico8-bin')

# Lexaloffle uses other terms for architecture
_arch_i686="i386"
_arch_x86_64="amd64"
_arch_arm="raspi"

# Source filenames and hashes (SHA-512)
_file_desktop="pico-8.desktop"
_file_mime="pico-8.xml"
_file_zip_i686="pico-8_${pkgver}_${_arch_i686}.zip"
_file_zip_x86_64="pico-8_${pkgver}_${_arch_x86_64}.zip"
_file_zip_arm="pico-8_${pkgver}_${_arch_arm}.zip"

# Source files hashes (SHA-512)
_file_desktop_hash="f63b8f4d32b7183c9785a418c7e8d2ea98343edd90c8553397c7d1776b888eb2b49f0308ec7918bde6c41c9a53b6a00318a533d264fa20e0bbd3d8a9f88c2244"
_file_mime_hash="0497c602acbffdbec285ffcdb43ebe55adc793c051ce792933ba2d8d431229f2a938434cd760fbf92133ad6b9604c996b563276166fa883a619cd7313acd4f92"
_file_zip_i686_hash="f02e45c367ef3c6aa3b5d746b2ce839d8cac6808560d0e5893a41aac9546ba7e5b77158687daa45a1d6dab971d38ed096e1f96167d80dad13577931072e0a27a"
_file_zip_x86_64_hash="322b05f8d7c2134906d1546f1771a711534030d8699472cfa242dd96ec5be6f63f0371c14a93965f10b3b8636a9d4064ab4273b48c4aa790a6cda6c7ef6dd27d"
_file_zip_arm_hash="03b5301932bd347cdf4ed3e324da6c4d1ecff46f845edb1cdf8a56e2950b84f838b955e634909a8219aec8c8bfee647602eadd66dc8d166b218c477d0d6229d4"

# Source declaration
source=("${_file_desktop}" "${_file_mime}")
source_i686=("hib://${_file_zip_i686}")
source_x86_64=("hib://${_file_zip_x86_64}")
source_armv6h=("hib://${_file_zip_arm}")
source_armv7h=("hib://${_file_zip_arm}")

# Source files hash declaration (SHA-512)
sha512sums=("${_file_desktop_hash}" "${_file_mime_hash}")
sha512sums_i686=("${_file_zip_i686_hash}")
sha512sums_x86_64=("${_file_zip_x86_64_hash}")
sha512sums_armv6h=("${_file_zip_arm_hash}")
sha512sums_armv7h=("${_file_zip_arm_hash}")

# Gets the current zip used
[ "${CARCH}" = "i686" ] && _platform="${_arch_i686}"
[ "${CARCH}" = "x86_64" ] && _platform="${_arch_x86_64}"
[ "${CARCH}" = "armv6h" ] && _platform="${_arch_arm}"
[ "${CARCH}" = "armv7h" ] && _platform="${_arch_arm}"

# Add a DLAGENTS for hib if it doesn't exist.
# Borrowed from https://aur.archlinux.org/packages/worldofgoo/ PKGBUILD
DLAGENTS+=("hib::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf")

# Prepares sources for building
prepare () {
  # Moves content of the subfolder named pico-8 to src root
  if [ "${_platform}" = "${_arch_i686}" ]; then 
    mv "./pico-8_i386/"* .
  else
    mv "./pico-8/"* .
  fi

  # Changes licence and icon filenames in order to comply naming conventions
  mv "license.txt" "LICENSE"
  mv "lexaloffle-pico8.png" "pico-8.png"
}

# Prepares files for the package creation
package () {
  # Creates variables storing target paths
  local _target_licenses="/usr/share/licenses/${pkgname}"
  local _target_opt="/opt/${pkgname}"
  local _target_bin="/usr/bin"
  local _target_mimepackages="/usr/share/mime/packages"
  local _target_apps="/usr/share/applications"
  local _target_icons="/usr/share/icons/hicolor/128x128/apps"

  # Creates variables storing pkg paths
  local _pkg_licenses="${pkgdir}/${_target_licenses}"
  local _pkg_opt="${pkgdir}/${_target_opt}"
  local _pkg_bin="${pkgdir}/${_target_bin}"
  local _pkg_mimepackages="${pkgdir}/${_target_mimepackages}"
  local _pkg_apps="${pkgdir}/${_target_apps}"
  local _pkg_icons="${pkgdir}/${_target_icons}"

  # Creates pkg directories
  mkdir -p "${_pkg_licenses}"
  mkdir -p "${_pkg_opt}"
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
  local _pico8_icon="pico-8.png"
  local _pico8_mime="${_file_mime}"
  local _pico8_desktop="${_file_desktop}"

  # Installs the extracted files
  install -Dm644 "${_pico8_license}" "${_pkg_licenses}/${_pico8_license}"
  install -Dm755 "${_pico8_bin}" "${_pkg_opt}/${_pico8_bin}"
  install -Dm644 "${_pico8_dat}" "${_pkg_opt}/${_pico8_dat}"
  if [ "${_platform}" != "${_arch_x86_64}" ]; then
    install -Dm644 "${_pico8_dyn}" "${_pkg_opt}/${_pico8_dyn}"
  fi
  install -Dm644 "${_pico8_txt}" "${_pkg_opt}/${_pico8_txt}"
  install -Dm644 "${_pico8_mime}" "${_pkg_mimepackages}/${_pico8_mime}"
  install -Dm644 "${_pico8_desktop}" "${_pkg_apps}/${_pico8_desktop}"
  install -Dm644 "${_pico8_icon}" "${_pkg_icons}/${_pico8_icon}"

  # Links the installed binary to /usr/bin
  ln -s "${_target_opt}/${_pico8_bin}" "${_pkg_bin}/${_pico8_bin}"
}
