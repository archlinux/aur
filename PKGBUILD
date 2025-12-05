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
pkgver=0.15.1
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
  "zig>=${pkgver}"
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
sha256sums_aarch64=('a2daa860a0e0cd1410491ff9703c6aaca96defd833b88af6a9811d6ff04fc13b'
                    'SKIP')
sha256sums_i686=('b0a2fd145bd19ed274a4cd523cd682ba00894c549a083aef95cbbde7fa1a2c45'
                 'SKIP')
sha256sums_riscv64=('6ffd523b08b3b1c18ef061653e29e08e7561633c60dcd41f4af2e9985aa32daf'
                    'SKIP')
sha256sums_x86_64=('3bb38f522cb23213e8c075ac6b170273fe49b4274b8c12b034cc496407400067'
                   'SKIP')
sha256sums_powerpc64le=('3b1a55f3e811426f0845f9ea3e16246ecc2896f0e602e87b2959166a5e42aa63'
                        'SKIP')
sha256sums_loong64=('01cd9378af1a4ab3c06984800d041d4b5005ba1bfc3c2d4ca47fdff4eb23fa1c'
                    'SKIP')
sha256sums_armv7h=('4c57284eb605e51ed895e30a07c40579473f56390338af2caa35ce25a2264c8c'
                   'SKIP')

verify() {
  # https://github.com/zigtools/release-worker?tab=readme-ov-file#build-artifacts
  # https://github.com/zigtools/zls/releases/latest
  local zls_minisign="RWR+9B91GBZ0zOjh6Lr17+zKf5BoSuFvrx2xSeDE57uIYvnKBGmMjOex"
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_artifact="${source_arch##*/}"

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
