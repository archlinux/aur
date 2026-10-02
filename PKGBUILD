# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.16.0
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
sha256sums_aarch64=('ea4b09bfb22ec6f6c6ceac57ab63efb6b46e17ab08d21f69f3a48b38e1534f17'
                    'SKIP')
sha256sums_i686=('4e34e279a9f856358de420490b531974c3d37f8f3707eef9f0342e92c14c301f'
                 'SKIP')
sha256sums_riscv64=('bc069b0f2f568f54bafbdfc1d65b12fd386ed6a652044a37aee6a4f72f14076e'
                    'SKIP')
sha256sums_x86_64=('70e49664a74374b48b51e6f3fdfbf437f6395d42509050588bd49abe52ba3d00'
                   'SKIP')
sha256sums_powerpc64le=('18800b45c08bf40b335ca5ab79aea70aca287ca969036e938155772becaeebeb'
                        'SKIP')
sha256sums_loong64=('2503be8ecc5965f1f7962471d267d9f83fcb3cc2f7ff78ac34093b9722bbea93'
                    'SKIP')
sha256sums_armv7h=('f85116bf2f9189bb6ae280c7f92f03b89c2551a88e17881c0c2df86bf4e42c50'
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
  install -vDm755 "${_basename}" -t "${pkgdir}/opt/${_pkgname}"
  install -vDm644 "README.md"    -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE"      -t "${pkgdir}/usr/share/licenses/${_pkgname}"

  cp -a --no-preserve=ownership "doc" -T "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -a --no-preserve=ownership "lib" -t "${pkgdir}/opt/${_pkgname}"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  ln -vsf "/opt/${_pkgname}/${_basename}" "${pkgdir}/usr/bin/${_basename}-${_pkgver}"
  ln -vsf "/opt/${_pkgname}/lib"          "${pkgdir}/usr/lib/${_pkgname}"
}
