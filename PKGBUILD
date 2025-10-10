# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname=(
  "protoc-gen-grpc-gateway"
  "protoc-gen-openapiv2"
)
_pkgbase="grpc-gateway"
_pkgname=(
  "${_pkgbase}"
  "${_pkgbase}-common"
  "${_binname[@]}"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=2.27.3
pkgrel=1
pkgdesc="gRPC to JSON proxy generator following the gRPC HTTP spec"
arch=('aarch64' 'x86_64')
url="https://grpc-ecosystem.github.io/grpc-gateway/"
_url="https://github.com/grpc-ecosystem/${_pkgbase}"
license=('BSD-3-Clause')
_pkgsrc="${_pkgbase}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
for _name in "${_binname[@]}"; do
  source_aarch64+=("${_name}-${pkgver}-aarch64::${_url}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-arm64")
  source_x86_64+=("${_name}-${pkgver}-x86_64::${_url}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-x86_64")
done
sha256sums=('3a68931f95da4152197b851116679f0d2bebe901835a9534bbe822f8a53d1d2e'
            'a15b1d1b168954c92ff7fb1620382418f7c72f4f4d251ee791d1098ad68ab0c4')
sha256sums_aarch64=('ad7d733f1f22eab9c7a9f7bef83e52bbddc8e18ef364ed880ec0e6840e31f9b4'
                    'deccf6fcba742797e18fad899ace3cbc8922bc10d2ab743e30b164762f3d671a')
sha256sums_x86_64=('282226318aca5208df68f66a5b13461c00ab9792290f3c2d7b465bc5c41f1d8f'
                   'e733a8978d6b60eacb0429af0a6ec24f4a8cf05e98ad7a3735b51fd8cee71452')

package_grpc-gateway-bin() {
  pkgdesc+=" (meta)"
  arch=('any')
  depends=(
    "${_binname[@]/%/"-bin=${pkgver}"}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )
}

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
    '${_pkgbase}-common=${pkgver}'
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
}"
done
