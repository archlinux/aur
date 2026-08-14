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
pkgver=2.30.0
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
sha256sums_aarch64=('0f74b7795bafc429b6fbae59d8d5d5600aae6dcd9bd25477a728e4bb67c75aaf'
                    '9e96450bed8db2d1c98e93eb745e5d31b4fe9474549e4ab8cb598b239f2e18b1')
sha256sums_x86_64=('3451a430e9dfaa43d199825426e96382348f69c4a42402a5b3f06fdd917c18ca'
                   '79fc245bcaf02d75a85934cf11035688de11191110e3b30b7a1859cc9492ca13')

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
