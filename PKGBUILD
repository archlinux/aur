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
pkgver=0.2.3
pkgrel=1
pkgdesc="Unsupervised text tokenizer for Neural Network-based text generation"
arch=(
  'aarch64'
  'x86_64'
)
url="https://google.github.io/sentencepiece/"
_url="https://github.com/google/${_pkgbase}"
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
  # 'slsa-verifier'
)
_pkgsrc="${_pkgbase}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
  # "${_pkgsrc}-multiple.intoto.jsonl::${_url}/releases/download/v${pkgver}/multiple.intoto.jsonl"
)
source_aarch64=(
  "${_url}/releases/download/v${pkgver}/${_pkgsrc}-Linux-aarch64.7z"
  "${_url}/releases/download/v${pkgver}/${_pkgsrc}-cp${_py/.}-cp${_py/.}-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl"
)
source_x86_64=(
  "${_url}/releases/download/v${pkgver}/${_pkgsrc}-Linux-x86_64.7z"
  "${_url}/releases/download/v${pkgver}/${_pkgsrc}-cp${_py/.}-cp${_py/.}-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl"
)
noextract=(
  "${source_aarch64[1]##*/}"
  "${source_x86_64[1]##*/}"
)
sha256sums=('12cf3d1c5b22ba2d486c5bd19f800a70707e1438d60b4385dfe9c4a17d398144'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_aarch64=('f77f2f5ae11490932ea0d75a5cfccda38edaa486d7a45ec21641509884f3a2bb'
                    '9f77802993eb51a08e856278f73894615b9a6cc3244857fcf962bc657578f591')
sha256sums_x86_64=('ee9b1ee64853f70aee2802f2a7d117c3422d9fa0baaad84a27628b18cf5b57f2'
                   '22dce81a65b8a1819eef9fef4970d6581ea0cbde7f58fbbbb42521535eba15e2')

# verify() {
#   local source_array="source_${CARCH}[1]"
#   local source_url="${!source_array}"
#   local source_artifact="${source_url##*/}"

#   slsa-verifier verify-artifact "${source_artifact}" \
#     --provenance-path "${_pkgsrc}-multiple.intoto.jsonl" \
#     --source-uri "${url#https://}" \
#     --source-tag "v${pkgver}"
# }

prepare() {
  cd "${srcdir}/${_pkgsrc}-Linux-${CARCH}"
  find . -type f,d -name '*absl*' -exec rm -rf "{}" +

  cd "lib/pkgconfig"
  sed -i 's|^prefix=.*|prefix=/usr|g' "${_pkgbase}.pc"
}

package_sentencepiece-bin() {
  depends+=(
    # 'abseil-cpp' # TODO: ?
    'libgomp'
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
  url+="python/"
  depends+=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    "python>=${_py}"
  )
  optdepends=(
    "python-protobuf: return_type='proto'"
    "python-numpy: return_type='numpy'"
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
