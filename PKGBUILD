# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname=(
  "protoc-gen-grpc-gateway"
  "protoc-gen-openapiv2"
)
_pkgbase="grpc-gateway"
_pkgname=(
  "${_pkgbase}-common"
  "${_binname[@]}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=2.33.0
pkgrel=1
pkgdesc="gRPC to JSON proxy generator following the gRPC HTTP spec"
arch=(
  'aarch64'
  'x86_64'
)
url="https://grpc-ecosystem.github.io/grpc-gateway/"
_url="https://github.com/grpc-ecosystem/${_pkgbase}"
license=(
  'BSD-3-Clause'
)
_pkgsrc="${_pkgbase}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
)
for _name in "${_binname[@]}"; do
  source_aarch64+=("${_name}-${pkgver}-aarch64::${_url}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-arm64")
  source_x86_64+=("${_name}-${pkgver}-x86_64::${_url}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-x86_64")
done
sha256sums=('ec7902ab2f79c912dc54b20500002358a4c2f00e753708de18a5bd196cc9b6ed'
            'a15b1d1b168954c92ff7fb1620382418f7c72f4f4d251ee791d1098ad68ab0c4')
sha256sums_aarch64=('65c06587096d3cb6527cc9ad31e63340dfb4536fab5c5a7568be5e687c34cbcb'
                    'b4bbd6ccd79381664991d395e8c3aa2174973d44d84323c98bce8268b8cd7b03')
sha256sums_x86_64=('82b7858911a3d41994e33fd99d360f5bd13b808f9324dc52b9cbc4d517c13ec5'
                   '005b04e18bee5167fdeddd7c77f59a34a6238d04bc6900c29cf07470ba1c119d')

package_grpc-gateway-common-bin() {
  pkgdesc+=" (common files)"
  arch=('any')
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

for _name in "${_binname[@]}"; do
  eval "
package_${_name}-bin() {
  depends+=(
    '${_pkgbase}-common>=${pkgver}'
    'protobuf'
    'protoc-gen-go'
    'protoc-gen-go-grpc'
  )
  provides=(
    '${_name}=${pkgver}'
  )
  conflicts=(
    '${_name}'
  )
  
  cd \"\${srcdir}\"
  install -vDm755 '${_name}-${pkgver}-${CARCH}' \"\${pkgdir}/usr/bin/${_name}\"

  install -vd \"\${pkgdir}/usr/share/doc\" \"\${pkgdir}/usr/share/licenses\"
  ln -vsf '${_pkgbase}' \"\${pkgdir}/usr/share/doc/${_name}\"
  ln -vsf '${_pkgbase}' \"\${pkgdir}/usr/share/licenses/${_name}\"
}"
done
