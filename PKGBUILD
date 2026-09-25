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
pkgver=0.17.0dev.2228+955228b68
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
sha256sums_aarch64=('defa288a18ca62164d62b405a78be22ede0d0827841c2f060624d0e1511ba96c'
                    'SKIP')
sha256sums_i686=('538cc590e3f104d6e073c33385c1c41341e927e5c20da8c45cb55791e96a6371'
                 'SKIP')
sha256sums_riscv64=('df16a2c8d922c039ac7de0bd699cacf71e180895c5c67c6bb26b0b5050154caf'
                    'SKIP')
sha256sums_x86_64=('7ba127e73adeafd25aee6a16cc6008486c93ea0fcec5bff9d7c6b035785b22c3'
                   'SKIP')
sha256sums_powerpc64le=('41e0c420464410fdd6f7ace51a00d3ff432f7f48fb51951a89066fca880e3ceb'
                        'SKIP')
sha256sums_loong64=('20a7ef68610138cba89f7f141c5a27cc9320f8a27d6f1e3d245f49bca9641c2d'
                    'SKIP')
sha256sums_armv7h=('a99a75f6ee7573577fc3b1f691a93ce462bc43eeaad464a3a21de3105db77e31'
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

