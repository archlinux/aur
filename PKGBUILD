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
pkgver=2.32.0
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
sha256sums=('6dcf81c7466d78141a69097bf1ea7c61365d2b7be7e0d208990d9aa2dc189a9d'
            'a15b1d1b168954c92ff7fb1620382418f7c72f4f4d251ee791d1098ad68ab0c4')
sha256sums_aarch64=('d282f2f67c57d104f380518ba5250338926c6a765508477272068aaf05d4c2eb'
                    '5228b2588b4892994b31195a646bfd14196ad7fe2cc1e90ca0725030d99eb00f')
sha256sums_x86_64=('8280ca4c6255714346915535aeb86e588c4525a7e1b49d94ae7a0966761d5da4'
                   'a41111bb4fefc8320f6a68b128cb0f6b0c78b4f94b40354d3bbc3b4f74c52977')

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
