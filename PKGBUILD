# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['armv7h']='armv7a' # TODO: arm
  # ['loong64']='loongarch64'
  ['powerpc64le']='powerpc64le'
  ['riscv64']='riscv64'
  # ['s390x']='s390x'
  ['i686']='x86'
  ['x86_64']='x86_64'
)

_basename="zig"
_suffix="-mach"
_pkgname="${_basename}${_suffix}"
pkgname="${_pkgname}-bin"
pkgver=0.14.0dev.2577+271452d22
_pkgver="${pkgver//dev/-dev}"
pkgrel=4
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=(
  "${!_arch[@]}"
)
url="https://machengine.org/docs/nominated-zig/"
license=(
  'MIT'
)
makedepends=(
  'minisign'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
options=(
  '!strip'
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  'https://pkg.machengine.org/zig/${_basename}-linux-${_arch[${_carch}]}-${_pkgver}.tar.xz'
  'https://pkg.machengine.org/zig/${_basename}-linux-${_arch[${_carch}]}-${_pkgver}.tar.xz.minisig'
)"
done
sha256sums_aarch64=('cafbc9b83e624d8e7e55c41991c2c8d33b52d25661d94c27f236fb622ce168e4'
                    'SKIP')
sha256sums_i686=('f9a4f54b3f014a704793725e79f9ed377b87af681a8a947804d14d2bf954eb82'
                 'SKIP')
sha256sums_riscv64=('99ee8d18a6f9a513f203a2d8e0024edd8fee710b9ae267ba238bbb98cedbb754'
                    'SKIP')
sha256sums_x86_64=('7be6abdebfa970c6138d165b348d0464e84f16f531e71cb20c0e052fae1d8c8d'
                   'SKIP')
sha256sums_powerpc64le=('1404f4b51b861883145b4757f94c46e9656b0c6b9e00ccd7e8499df691a32974'
                        'SKIP')
sha256sums_armv7h=('ce4a447027be85577f7a739a09345931572dd69f9dc68d5b53d1cf667bfaf664'
                   'SKIP')

verify() {
  # https://ziglang.org/download/
  local ziglang_minisign="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_artifact="${source_arch##*/}"

  minisign -V \
    -P "${ziglang_minisign}" \
    -m "${source_artifact}"
}

package() {
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_artifact="${source_arch##*/}"

  cd "${srcdir}/${source_artifact%.tar*}"
  install -vDm755 "${_basename}" "${pkgdir}/opt/${_pkgname}/${_basename}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cp -a --no-preserve=ownership "doc" -T "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -a --no-preserve=ownership "lib" -t "${pkgdir}/opt/${_pkgname}"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  ln -vsf "/opt/${_pkgname}/${_basename}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -vsf "/opt/${_pkgname}/lib"          "${pkgdir}/usr/lib/${_pkgname}"
}

