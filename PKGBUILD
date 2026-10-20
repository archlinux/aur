# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: redponike <proton (dot) me>
# Contributor: Nicholas Schlabach <Techcable at techcable dot net>

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

_pkgname="zls"
pkgname="${_pkgname}-bin"
pkgver=0.17.0
pkgrel=2
pkgdesc="A language server for Zig"
arch=(
  "${!_arch[@]}"
)
url="https://zigtools.org/zls"
license=(
  'MIT'
)
depends=(
  "zig>=${pkgver%.*}"
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
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  'https://builds.zigtools.org/${_pkgname}-${_arch[${_carch}]}-linux-${pkgver}.tar.xz'
  'https://builds.zigtools.org/${_pkgname}-${_arch[${_carch}]}-linux-${pkgver}.tar.xz.minisig'
)"
done
sha256sums_aarch64=('0d314f3cab30da770328e1b8c84ab89bb308e56dbc26a85ac82429ff02b44873'
                    'SKIP')
sha256sums_i686=('7078dca2564ab8a5ba74b40ca5cee784ebbe35521da6348a0d771bb7ee2ef688'
                 'SKIP')
sha256sums_riscv64=('64c1aa60cbf8e4b478c9b687f5352b6e2e08642d8c94c1242b9971bac0a211e1'
                    'SKIP')
sha256sums_x86_64=('dfa4514e1868803fdf2ae56832c88b9d400094d70ea6bb136b57bcc91af10258'
                   'SKIP')
sha256sums_powerpc64le=('86c89db1bb5f528b63cea41aeec9e80ae5f20a99199db6a37a90d9cbc64c3c26'
                        'SKIP')
sha256sums_loong64=('7c54b1bb617b33e10572c6560f629585ac70189c6af549a33bd7769fa8dacea6'
                    'SKIP')
sha256sums_armv7h=('51542693ec0a19cf870f95e6f06971af84779cbe294d8899fa6484131ced43e7'
                   'SKIP')

verify() {
  # https://github.com/zigtools/release-worker?tab=readme-ov-file#build-artifacts
  # https://github.com/zigtools/zls/releases/latest
  local zls_minisign="RWR+9B91GBZ0zOjh6Lr17+zKf5BoSuFvrx2xSeDE57uIYvnKBGmMjOex"
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  minisign -V \
    -P "${zls_minisign}" \
    -m "${source_artifact}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
