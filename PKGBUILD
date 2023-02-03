# Maintainer: (jmcb) <joelsgp@protonmail.com>
# Contributor: (Joe084) <develon69 at gmail dot com>

pkgname='pico-8'
pkgver='0.2.5f'
pkgrel=1
pkgdesc="A fantasy console for making, sharing and playing tiny games and other computer programs."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="http://www.lexaloffle.com/pico-8.php"
license=('custom:commercial')
depends=('glibc' 'sdl2' 'curl')
optdepends=()
provides=('pico8')

source=("${pkgname}.desktop"
        "${pkgname}.xml")
source_i686=("file://${pkgname}_${pkgver}_i386.zip")
source_x86_64=("file://${pkgname}_${pkgver}_amd64.zip")
source_armv7h=("file://${pkgname}_${pkgver}_raspi.zip")
source_aarch64=("file://${pkgname}_${pkgver}_raspi.zip")

sha256sums=('272f33c38a74456a4d2597a6b1d0c6ee9695d0e47f31ce08018c24a78e62759e'
            '2776340602e7ad29898500c4b2162bb5dd7746b933fb443b551e25a751e375e7')
sha256sums_x86_64=('6331dbf0df58c6a3b150c81ebc55a609331f2678d21ec6e95de9464c75059402')
sha256sums_i686=('ab5c9be12f1a98620ecc62af655554257f2fe45f477542ceb008e71ab9f19a15')
sha256sums_armv7h=('5eca749bc1bcc50f5294e2ab6e0d21094384082103e612fa5b5c93a3f233c26c')
sha256sums_aarch64=('5eca749bc1bcc50f5294e2ab6e0d21094384082103e612fa5b5c93a3f233c26c')


prepare () {
  # Moves content of the subfolder named pico-8 to src root
  mv pico-8/* .
  # Changes license and icon filenames to comply with naming conventions
  mv "license.txt" "LICENSE"
  mv "lexaloffle-pico8.png" "${pkgname}.png"
}


package () {
  local _name=pico8
  local _opt="${pkgdir}/opt/${pkgname}"
  local _share="${pkgdir}/usr/share"

  # Desktop entry
  install -Dm644 "${pkgname}.desktop" "${_share}/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${_share}/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.xml" "${_share}/mime/packages/${pkgname}.xml"
  # License
  install -Dm644 "LICENSE" "${_share}/licenses/${pkgname}/LICENSE"
  # Data and readmes
  install -Dm644 -t "${_opt}" "${_name}.dat" "${pkgname}_manual.txt" readme_*.txt

  # Binary
  local _target
  case $CARCH in
    "x86_64" | "armv7h")
      _target="${_name}_dyn"
      ;;
    "i686")
      _target="${_name}_32bit_dyn"
      ;;
    "aarch64")
      _target="${_name}_64"
      ;;
  esac
  install -Dm755 "${_target}" "${_opt}/${_name}"

  # Links the installed binary to /usr/bin
  local _bin="${pkgdir}/usr/bin"
  mkdir -p "${_bin}"
  ln -s "/opt/${pkgname}/${_name}" "${_bin}/${_name}"
}
