# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="scorecard"
pkgname="${_pkgname}-bin"
pkgver=5.6.0
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
sha256sums=('3809c2eb615de4fcbb9dc68915082b80a6959085f246ee96fb7627cd2391a173')
sha256sums_aarch64=('3eacaceb3fdee6d0ba5df6ede45d1ada73321949029921bb63633802e8ec5951')
sha256sums_x86_64=('19bde07129450cb65a95c6e3b9f34e034341579e6f0e241546ec3ae6efb2dd9a')

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
