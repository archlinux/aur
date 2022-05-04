# Maintainer: (Joe084) <develon69 at gmail dot com>

# Common metadata
pkgname='pico-8'
pkgver='0.2.4c'
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
_file_desktop_hash="67a4b92bfa6f074c6413e6cc2b2ee7a5e9d3b901ab29d858e8360a422ad8659515ef5bb8097e353ce75633aab63215668d701209475b38dbd43a4372071b5d8e"
_file_mime_hash="0497c602acbffdbec285ffcdb43ebe55adc793c051ce792933ba2d8d431229f2a938434cd760fbf92133ad6b9604c996b563276166fa883a619cd7313acd4f92"
_file_zip_i686_hash="2d96494054e786ab2638e06da5e861ab8a4bfae6608811da481aa05d720807e620cb2059633f4c4194e3c2cd6a5a22c4ba2b9257e4d1712c1842e0dff5b1c203"
_file_zip_x86_64_hash="451d72988c4c0af01ad6298ee02e0f18584076e2df2b00b72de63ea517129cf4bc613b1be67c533fb328bf9d3aa66f3c4ca86d03c5561438d3555688a05ef508"
_file_zip_arm_hash="f7c3185dd58ea00a761ddf632ade3fc8c19bc6251bd1c4ba02e6e07cb02fc0fa22e394a398377fde01d77a655350f8cdcdac3390218a9e0e9d78baf4fb2fa313"

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
  local _pico8_txt="pico-8_manual.txt"
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
