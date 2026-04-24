# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="scorecard"
pkgname="${_pkgname}-bin"
pkgver=5.5.0
pkgrel=1
pkgdesc="Security health metrics for Open Source"
arch=(
  'aarch64'
  'x86_64'
)
url="https://scorecard.dev"
_url="https://github.com/ossf/${_pkgname}"
license=(
  'Apache-2.0'
)
makedepends=(
  'slsa-verifier'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-multiple.intoto.jsonl::${_url}/releases/download/v${pkgver}/multiple.intoto.jsonl"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz"
)
sha256sums=('95ae0e8e6896b088fb1134179b9cbfc1ec1fde8622e5d8d6f4a2e45779c965b3')
sha256sums_aarch64=('3ce59d20c1d53e540c4a14e0da1e0d96b3b294e8ddc96a3c5a7b8a637b32991e')
sha256sums_x86_64=('83b90a05c1540ef1390db1cd5711e5fd04be9c1d8537fb84d39d02092d6a8dff')

verify() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"
  
  slsa-verifier verify-artifact "${source_artifact}" \
    --provenance-path "${_pkgsrc}-multiple.intoto.jsonl" \
    --source-uri "${_url#https://}" \
    --source-tag "v${pkgver}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
