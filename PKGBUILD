# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

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

_basename="zig"
_suffix="-mach"
_pkgname="${_basename}${_suffix}"
pkgname="${_pkgname}-bin"
pkgver=0.16.0dev.3142+5ccfeb926
_pkgver="${pkgver//dev/-dev}"
pkgrel=1
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
  'https://pkg.hexops.org/zig/${_basename}-${_arch[${_carch}]}-linux-${_pkgver}.tar.xz'
  'https://pkg.hexops.org/zig/${_basename}-${_arch[${_carch}]}-linux-${_pkgver}.tar.xz.minisig'
)"
done
sha256sums_aarch64=('4801ddd0fe720e5b0c177230caa2301ed3ce2e3701beec6c18888b49244c1a5a'
                    'SKIP')
sha256sums_i686=('6d9fd848262ab2c30b2025576fa4698bcee38a694efae22c3daa599a13de2cde'
                 'SKIP')
sha256sums_riscv64=('f70af6f2f8408ab25f7033259e7acf01eb3ce6b584ec9001d981b2b2a2648390'
                    'SKIP')
sha256sums_x86_64=('ab4e7bf6358a63e50aeec2243547b63791c75523685ad458d0c339448d723a88'
                   'SKIP')
sha256sums_powerpc64le=('ed57b42dcb718348d13472686347b4f17afacd87cb839483e718e776af2182d6'
                        'SKIP')
sha256sums_loong64=('6c9d70ffa4d254103aab7fa5e9bb7abdc605c45a144fb736129f22d5cec78e8c'
                    'SKIP')
sha256sums_armv7h=('a431a24f43431a8f8d646fbe984b6310c4ec9d124be30916a20ea056d22d19e9'
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
  ln -vsf "/opt/${_pkgname}/${_basename}" "${pkgdir}/usr/bin/${_pkgname}"
  ln -vsf "/opt/${_pkgname}/lib"          "${pkgdir}/usr/lib/${_pkgname}"
}

