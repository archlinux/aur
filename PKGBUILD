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
pkgver=2.28.0
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
sha256sums=('3a68931f95da4152197b851116679f0d2bebe901835a9534bbe822f8a53d1d2e'
            'a15b1d1b168954c92ff7fb1620382418f7c72f4f4d251ee791d1098ad68ab0c4')
sha256sums_aarch64=('196d445acfb3e4f8b4cf27f73ff1561530b80a71dd53ae02e22ea144f3825668'
                    '0784465f4eb109d79a15adfb82ec16e729436b5e970e99639804c86643484a4d')
sha256sums_x86_64=('1ce4014937cf8b536d0a5029c60e1615c3e76a499c027bad8984e5ebc6646b1f'
                   '708ed31a50ceedccb800c3752b61954dce80372112f5eab2d47003ea8c17c74d')

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
