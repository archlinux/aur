# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_langs=(
  'cpp'
  'go'
  'java'
)
_pkgbase="protoc-gen-validate"
_pkgname=(
  "${_pkgbase}"
  "${_langs[@]/#/"${_pkgbase}-"}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=1.3.3
pkgrel=1
pkgdesc="Protoc plugin to generate polyglot message validators"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/bufbuild/${_pkgbase}"
license=(
  'Apache-2.0'
)
_pkgsrc="${_pkgbase}-${pkgver}"
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_arm64.tar.gz"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_386.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums_aarch64=('e34b7526405741d7fafbf6f1c68cdda429b9420190b180a0b023016651215190')
sha256sums_i686=('a6b65da44ee87292d6c0839599a21fd0d06a0f1cde668cf61ef81f5c0551b4e7')
sha256sums_x86_64=('6f851d3636b0c12a9fb5f99bf5c57651319f6a4c1d695f304269f1204dc9e13c')

package_protoc-gen-validate-bin() {
  depends=(
    'protobuf'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm755 "${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

for _lang in "${_langs[@]}"; do
  eval "
package_${_pkgbase}-${_lang}-bin() {
  pkgdesc+=' - ${_lang} target'
  depends+=(
    '${_pkgbase}>=${pkgver}'
  )
  provides=(
    '${_pkgbase}-${_lang}=${pkgver}'
  )
  conflicts=(
    '${_pkgbase}-${_lang}'
  )
  
  install -vDm755 '${_pkgbase}-${_lang}' \"\${pkgdir}/usr/bin/${_pkgbase}-${_lang}\"
}"
done
