# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.10.1
_pkgver="${pkgver%.*}"
pkgrel=3

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['i686']='i386'
  ['riscv64']='riscv64'
  ['x86_64']='x86_64'
)

_pkgname="${_basename}${_pkgver}"
pkgname="${_pkgname}-bin"
pkgdesc="General-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=(
  "${!_arch[@]}"
)
url="https://ziglang.org"
_url="https://codeberg.org/ziglang/${_basename}"
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
source=(
  "${_basename}-${pkgver}-README.md::${_url}/raw/tag/${pkgver}/README.md"
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  '${url}/download/${pkgver}/${_basename}-linux-${_arch[${_carch}]}-${pkgver}.tar.xz'
  '${url}/download/${pkgver}/${_basename}-linux-${_arch[${_carch}]}-${pkgver}.tar.xz.minisig'
)"
done
sha256sums=('e1ea4de611e804f1343dfd8e95dc109196e1ee6ce9f0fb638d79be8daedab673')
sha256sums_aarch64=('db0761664f5f22aa5bbd7442a1617dd696c076d5717ddefcc9d8b95278f71f5d'
                    'SKIP')
sha256sums_i686=('8c710ca5966b127b0ee3efba7310601ee57aab3dd6052a082ebc446c5efb2316'
                 'SKIP')
sha256sums_riscv64=('9db5b59a5112b8beb995094ba800e88b0060e9cf7cfadf4dc3e666c9010dc77b'
                    'SKIP')
sha256sums_x86_64=('6699f0e7293081b42428f32c9d9c983854094bd15fee5489f12c4cf4518cc380'
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

  cd "${srcdir}"
  install -vDm644 "${_basename}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${source_artifact%.tar*}"
  install -vDm755 "${_basename}" "${pkgdir}/opt/${_pkgname}/${_basename}"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cp -a --no-preserve=ownership "doc" -T "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -a --no-preserve=ownership "lib" -t "${pkgdir}/opt/${_pkgname}"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  ln -vsf "/opt/${_pkgname}/${_basename}" "${pkgdir}/usr/bin/${_basename}-${_pkgver}"
  ln -vsf "/opt/${_pkgname}/lib"          "${pkgdir}/usr/lib/${_pkgname}"
}
