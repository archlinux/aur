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
pkgver=4.6.0
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
sha256sums=('930f62fa023210fdf4db189641278b8303ec20388e8a9f39683c9e71759bfbec'
            'cf91cd5635ae9d9d4d50a2fa16f17edc58278573cbe4ca075d7278ce73a9381b'
            '9f591bf27e251244e387c87b228e03f8b921d08332e2fb8407badcd0132d3581'
            '53cb3f833f03ad93abb5bfae54a80de49ecb3181018b0237edd5df913aa67434')
sha256sums_x86_64=('0f563cf34ebf803fa3a9e1e9319a18b5114e62ff3e81de84b7c87b95b07cf896'
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
