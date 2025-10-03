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
pkgver=1.2.1
pkgrel=3
pkgdesc="Protoc plugin to generate polyglot message validators"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/bufbuild/${_pkgbase}"
license=('Apache-2.0')
_pkgsrc="${_pkgbase}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgbase}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('c740fa572e627e41054e4518768d4c0eb14247a4d810f3fa2d7e031b82256681')
sha256sums_i686=('ae2f136070df6eb1804615cda967f9e5dd7cf10e35a62864aa90643439f479a1')
sha256sums_x86_64=('e7a1d7256184dc6824e8f8e4b672b1281013e321579daffd19b2e3e90b6f7d9f')

package_protoc-gen-validate-bin() {
  depends=('protobuf')
  provides=("${pkgname%-bin}=${pkgver}")
  conflicts=("${pkgname%-bin}")

  cd "${srcdir}"
  install -vDm755 "${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

for _lang in "${_langs[@]}"; do
  eval "
package_${_pkgbase}-${_lang}-bin() {
  pkgdesc+=' - ${_lang} target'
  depends+=('${_pkgbase}=${pkgver}')
  provides=('${_pkgbase}-${_lang}=${pkgver}')
  conflicts=('${_pkgbase}-${_lang}')
  
  install -vDm755 '${_pkgbase}-${_lang}' \"\${pkgdir}/usr/bin/${_pkgbase}-${_lang}\"
}"
done
