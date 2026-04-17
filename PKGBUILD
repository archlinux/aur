# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.15.2
_pkgver="${pkgver%.*}"
pkgrel=1

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['armv7h']='arm'
  ['loong64']='loongarch64'
  ['powerpc64le']='powerpc64le'
  ['riscv64']='riscv64'
  # ['s390x']='s390x'
  ['i686']='x86'
  ['x86_64']='x86_64'
)

_pkgname="${_basename}${_pkgver}"
pkgname="${_pkgname}-bin"
pkgdesc="General-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=(
  "${!_arch[@]}"
)
url="https://ziglang.org"
license=(
  'MIT'
)
makedepends=(
  'minisign'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
options=(
  'emptydirs'
  '!strip'
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  '${url}/download/${pkgver}/${_basename}-${_arch[${_carch}]}-linux-${pkgver}.tar.xz'
  '${url}/download/${pkgver}/${_basename}-${_arch[${_carch}]}-linux-${pkgver}.tar.xz.minisig'
)"
done
sha256sums_aarch64=('958ed7d1e00d0ea76590d27666efbf7a932281b3d7ba0c6b01b0ff26498f667f'
                    'SKIP')
sha256sums_i686=('4c6e23f39daa305e274197bfdff0d56ffd1750fc1de226ae10505c0eff52d7a5'
                 'SKIP')
sha256sums_riscv64=('493512bdca485be3c6a9b0f69dcb4cbe4587f3af8e1be282fdd827108ba39930'
                    'SKIP')
sha256sums_x86_64=('02aa270f183da276e5b5920b1dac44a63f1a49e55050ebde3aecc9eb82f93239'
                   'SKIP')
sha256sums_powerpc64le=('e182c5f8d30fc7f97d17d2ffef1488826aa3afaa51e5f0dbe14c597a98b45778'
                        'SKIP')
sha256sums_loong64=('95d6a03e0415dbe30ae9c00d58b5446fd681ebf3d4044a8b707e1784c8074a61'
                    'SKIP')
sha256sums_armv7h=('7d8401495065dae45d6249c68d5faf10508f8203c86362ccb698aeaafc66b7cd'
                   'SKIP')

verify() {
  # https://ziglang.org/download/
  local ziglang_minisign="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  minisign -V \
    -P "${ziglang_minisign}" \
    -m "${source_artifact}"
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}/${source_artifact%.tar*}"
  install -vDm755 "${_basename}" "${pkgdir}/opt/${_pkgname}/${_basename}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cp -a --no-preserve=ownership "doc" -T "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -a --no-preserve=ownership "lib" -t "${pkgdir}/opt/${_pkgname}"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  ln -vsf "/opt/${_pkgname}/${_basename}" "${pkgdir}/usr/bin/${_basename}-${_pkgver}"
  ln -vsf "/opt/${_pkgname}/lib"          "${pkgdir}/usr/lib/${_pkgname}"
}
