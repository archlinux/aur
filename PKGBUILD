# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="matlab-terminal-server"
pkgname="${_pkgname}-bin"
pkgver=0.3.0
pkgrel=1
pkgdesc="Use a terminal in MATLAB® to run command-line interface tools (server)"
arch=(
  'x86_64' # glnxa64
)
url="https://github.com/matlab/terminal-in-matlab"
license=(
  'custom:BSD-2-Clause-alike'
)
depends=(
  'glibc'
  'matlab-release>=R2024b'
)
makedepends=(
  'slsa-verifier'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE.md::${url}/raw/refs/tags/v${pkgver}/LICENSE.md"
  "${_pkgsrc}-multiple.intoto.jsonl::${url}/releases/download/v${pkgver}/multiple.intoto.jsonl"
  "${_pkgsrc}-checksums.txt::${url}/releases/download/v${pkgver}/checksums.txt"
)
source_x86_64=(
  "${_pkgsrc}-glnxa64::${url}/releases/download/v${pkgver}/${_pkgname}-glnxa64"
)
sha256sums=('859ccff34de643af437bb890ffc26ce31914070ccae70b9ada4d2ba936925560'
            '9f70a402df6f13a7e8135705677b96ac1ade94f60ad9c29da9a1cce2a3dfdb9f'
            'aae81235a37c2c272524223c75a77d62fdd7d8ee04a12b46e9f5cb93c65ebbcc'
            'cb6be287c4caa6065bb7edf625c2f3f019c007dc99fd50bca9d4295f6466ca3e')
sha256sums_x86_64=('62cb2538d0dd3e72f630e3b9bbaffe63e2175c553633011aaeee9f474fc232ae')

verify() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url%%::*}"

  slsa-verifier verify-artifact "${source_artifact}" \
    --provenance-path "${_pkgsrc}-multiple.intoto.jsonl" \
    --source-uri "${url#https://}" \
    --source-tag "v${pkgver}"

  slsa-verifier verify-artifact "${_pkgsrc}-checksums.txt" \
    --provenance-path "${_pkgsrc}-multiple.intoto.jsonl" \
    --source-uri "${url#https://}" \
    --source-tag "v${pkgver}"
  sed "s/${_pkgname}-/${_pkgsrc}-/g" "${_pkgsrc}-checksums.txt" | \
    sha256sum -c --ignore-missing -
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url%%::*}"

  cd "${srcdir}"
  install -vDm755 "${source_artifact}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
