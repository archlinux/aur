# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgbase="aescrypt"
_pkgname=(
  "${_pkgbase}_cli"
  "${_pkgbase}_gui"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=4.7.0
pkgrel=1
pkgdesc="A file encryption software that uses the Advanced Encryption Standard (AES)"
arch=(
  'x86_64'
)
url="https://www.aescrypt.com"
license=(
  'custom:Commercial'
)
makedepends=(
  'gzip'
)
source=(
  "${_pkgbase}_cli-${pkgver}-CHANGELOG.md::https://github.com/terrapane/aescrypt_cli/raw/refs/tags/v${pkgver}/CHANGELOG.md"
  "${_pkgbase}_cli-${pkgver}-README.md::https://github.com/terrapane/aescrypt_cli/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgbase}_gui-${pkgver}-CHANGELOG.md::https://github.com/terrapane/aescrypt_gui/raw/refs/tags/v${pkgver}/CHANGELOG.md"
  "${_pkgbase}_gui-${pkgver}-README.md::https://github.com/terrapane/aescrypt_gui/raw/refs/tags/v${pkgver}/README.md"
)
source_x86_64=(
  "${url}/download/v${pkgver%%.*}/linux/${_pkgbase}_gui-${pkgver}-Linux-x86_64.tar.gz"
  "${url}/download/v${pkgver%%.*}/linux/${_pkgbase}_gui-${pkgver}-Linux-x86_64.tar.gz.sig"
)
# https://www.aescrypt.com/linux_verification.html
sha256sums=('b3a2553a9ed3282f4e7b3207d12b4028af9275995c3e1e6f9365b531c37435f5'
            '339922c60f07f0e3eea66a1d8620e6cbb2cfe4d658b40fe3ea554fa35c0ba278'
            '54aee90b1ab78295b1659ef439cd5daa5d90c488db8fcd71d069cd8c941c8fef'
            '53cb3f833f03ad93abb5bfae54a80de49ecb3181018b0237edd5df913aa67434')
sha256sums_x86_64=('911be439ef3d2f67f8d52ce3f0d2eb01606de0943e8f45f426696689ffaa032f'
                   'SKIP')
validpgpkeys=(
  'C264DC0F1C13A4BB18CAAF1BE7BE982BCD50DDF4' # Terrapane Support <support@terrapane.com> (https://www.terrapane.com/terrapane.asc)
)

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}/${source_artifact%.tar*}"
  find . -type f -name '*.gz' -exec \
    gzip -fd "{}" \;
}

package_aescrypt_cli-bin() {
  pkgdesc+=" (CLI)"
  depends=(
    'glibc'
    'libgcc'
    'libstdc++'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "aescrypt-bin=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    'aescrypt-bin'
  )
  replaces=(
    'aescrypt-bin<=4.4.0-2'
  )

  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vDm644 "${pkgname%-bin}-${pkgver}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/CHANGELOG.md"
  install -vDm644 "${pkgname%-bin}-${pkgver}-README.md"    "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
  
  cd "${source_artifact%.tar*}"
  install -vDm755 "bin/${_pkgbase}" -t "${pkgdir}/usr/bin"
  install -vDm644 "share/licenses/${_pkgbase}_gui/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${_pkgbase}"

  cd "share"
  cp -va --no-preserve=ownership "man" -t "${pkgdir}/usr/share"
}

package_aescrypt_gui-bin() {
  pkgdesc+=" (GUI)"
  arch=(
    'any'
  )
  depends=(
    "${_pkgbase}_cli-bin>=${pkgver}-${pkgrel}"

    'hicolor-icon-theme'
    'perl'
    'which'
  )
  optdepends=(
    'kdialog: Qt-based password prompt'
    'zenity: GTK-based password prompt'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "aescrypt-gui-bin=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    'aescrypt-gui-bin'
  )
  replaces=(
    'aescrypt-gui-bin<=4.4.0-2'
  )

  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vDm644 "${pkgname%-bin}-${pkgver}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/CHANGELOG.md"
  install -vDm644 "${pkgname%-bin}-${pkgver}-README.md"    "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
  
  cd "${source_artifact%.tar*}"
  install -vDm755 "bin/${_pkgbase}-gui" -t "${pkgdir}/usr/bin"

  cd "share"
  cp -va --no-preserve=ownership "applications" "icons" "mime" -t "${pkgdir}/usr/share"
}
