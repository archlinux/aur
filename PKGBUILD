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
pkgrel=1
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
sha256sums_aarch64=('5ac32eed4110105fbd1a43995d71c319200db8d6a3dcc43a3f74f29b4f0eca5a'
                    'SKIP')
sha256sums_i686=('cc993590d33951a970467101f9d9c17a18d05d11fe7718d1a777391e95c7b662'
                 'SKIP')
sha256sums_riscv64=('8fcb9f2bdde7f0d765912ee124986195b2f9529d9ae8469acdad6d95c60ac705'
                    'SKIP')
sha256sums_x86_64=('33193a6c951cf20edbfd0dd7f54669255cd0e822722bdedb1e782827a44b2a9b'
                   'SKIP')
sha256sums_powerpc64le=('6d69d4cc3ccc84137ca80582d5155a4ef5f2478cd92c6db0f142904e63def2d5'
                        'SKIP')
sha256sums_loong64=('4ee4f4eb560f415b599d5eb19dfadd9276de7eba424e35a6efc35051e191de57'
                    'SKIP')
sha256sums_armv7h=('7e31f1b46e46186733448f7f2ae41b7dc29268fffd09c66890ac9b386a0da8f6'
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
