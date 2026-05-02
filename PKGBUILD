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
pkgver=4.5.0
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
sha256sums=('485065e473d135df60f1aff9b2562712d59032b91c50a9f8a2d7e626a49a6541'
            'de5692a10137d14b015a5e02adaf8e03653b91424237e8b5607c84788193f347'
            'ce5fd758553187c6f32c6532e23ae2495c802b51fdb4c27327032efbcfa4632d'
            '53cb3f833f03ad93abb5bfae54a80de49ecb3181018b0237edd5df913aa67434')
sha256sums_x86_64=('3abc38f8240d8d10c7508d2c3ace4f303cbc6e665afd48826cda8187b4e68ed7'
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
  )
  conflicts=(
    "${pkgname%-bin}"
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
  )
  optdepends=(
    'kdialog: Qt-based password prompt'
    'zenity: GTK-based password prompt'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
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
