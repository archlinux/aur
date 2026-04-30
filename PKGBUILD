# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_py=3.14
_pkgbase="sentencepiece"
_pkgname=(
  "${_pkgbase}"
  "python-${_pkgbase}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=0.2.1
pkgrel=4
pkgdesc="Unsupervised text tokenizer for Neural Network-based text generation"
arch=(
  # 'aarch64'
  'x86_64'
)
url="https://github.com/google/${_pkgbase}"
license=(
  'Apache-2.0'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
makedepends=(
  'python-installer'
  'slsa-verifier'
)
_pkgsrc="${_pkgbase}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
  "${_pkgsrc}-multiple.intoto.jsonl::${url}/releases/download/v${pkgver}/multiple.intoto.jsonl"
)
# source_aarch64=(
#   "${url}/releases/download/v${pkgver}/${_pkgsrc}-Linux-aarch64.7z"
#   "${url}/releases/download/v${pkgver}/${_pkgsrc}-cp${_py/.}-cp${_py/.}-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl"
# )
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgsrc}-Linux-x86_64.7z"
  "${url}/releases/download/v${pkgver}/${_pkgsrc}-cp${_py/.}-cp${_py/.}-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl"
)
noextract=(
  # "${source_aarch64[1]##*/}"
  "${source_x86_64[1]##*/}"
)
sha256sums=('4d52487bc1fc01d5e2b2054be2861326dda7f0bfe42a6f4b46c0a6238f0951fd'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            'be40ea1220e99c8a853738a35db7bd779d6d5cbaca792a97b8734aaadb3ac9a8')
sha256sums_x86_64=('654083fba04d00fdb1d7dcd7924c223f1962336244443fd60125fcf2c15fffb7'
                   '01e6912125cb45d3792f530a4d38f8e21bf884d6b4d4ade1b2de5cf7a8d2a52b')

verify() {
  local source_array="source_${CARCH}[1]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  slsa-verifier verify-artifact "${source_artifact}" \
    --provenance-path "${_pkgsrc}-multiple.intoto.jsonl" \
    --source-uri "${url#https://}" \
    --source-tag "v${pkgver}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}-Linux-${CARCH}/lib/pkgconfig"
  sed -i 's|^prefix=.*|prefix=/usr|g' "${_pkgbase}.pc"
}

package_sentencepiece-bin() {
  depends+=(
    'protobuf'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
    "lib${_pkgbase}.so"
    "lib${_pkgbase}_train.so"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"

  install -vd "${pkgdir}/usr"
  cp -vaT --no-preserve=ownership "${_pkgsrc}-Linux-${CARCH}" "${pkgdir}/usr"
}

package_python-sentencepiece-bin() {
  pkgdesc+=" (Python bindings)"
  url+="/tree/master/python"
  depends+=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    "python>=${_py}"
  )
  optdepends=(
    'python-protobuf'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  local source_array="source_${CARCH}[1]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" "${source_artifact}"
}
