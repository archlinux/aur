# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="qdl"
pkgname="${_pkgname}-bin"
pkgver=2.9.1
pkgrel=1
pkgdesc="Tool to communicate with Qualcomm System On a Chip bootroms to install or execute code"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/linux-msm/${_pkgname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'glibc'
  'libusb'
  'libxml2-legacy'
  # 'libzip'

  'bzip2'
  'openssl'
  'zlib'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-binary-ubuntu-24-arm64-v${pkgver}.zip"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-binary-ubuntu-24-x64-v${pkgver}.zip"
)
sha256sums=('01b8598cec284ac16bf950b1856b0ea1023d5e2df3a0aa961ec550908922538c'
            '85814c88fc75be2523c03551ee2abefc0c30b423edda343197796e0c0e168058')
sha256sums_aarch64=('517306dc7c762b121bda50b21741f287ac41965fb705f5eae160505c710d32e7')
sha256sums_x86_64=('dc13cc536c84f2091e4751c65e3fbb373dae05edf9707435181813561227fee3')

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # could have used patchelf too probably
  cd "${source_artifact%-v${pkgver}.zip}"
  # install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname}"
  install -vDm644 "libzip.so.4" -t "${pkgdir}/usr/lib/${pkgname}"

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
