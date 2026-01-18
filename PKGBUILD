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
pkgver=1.3.0
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
sha256sums_aarch64=('9ead4932aefa8b9decb17486a8d2cfe04418f92a60d388dfc310615f4d7e6034')
sha256sums_i686=('f3c45f268f0a352ba2af3fd33018cc1ace6d1865477f15f610079f69162cd203')
sha256sums_x86_64=('a534bf56625065095dbd4448f16fd87e15852d61d4e8b162542fae591003989b')

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
