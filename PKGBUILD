# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgver=0.14.0
_pkgver="${pkgver%.*}"
pkgrel=3

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['armv7h']='armv7a'
  ['loong64']='loongarch64'
  ['powerpc64le']='powerpc64le'
  ['riscv64']='riscv64'
  # ['']='s390x'
  ['i686']='x86'
  ['x86_64']='x86_64'
)

_pkgname="${_basename}${_pkgver}"
pkgname="${_pkgname}-bin"
pkgdesc="A language server for Zig"
arch=(
  "${!_arch[@]}"
)
url="https://zigtools.org/zls"
license=(
  'MIT'
)
depends=(
  'sh'
  "zig${_pkgver}"
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
source=(
  "${_basename}-versioned.sh"
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  'https://builds.zigtools.org/${_basename}-linux-${_arch[${_carch}]}-${pkgver}.tar.xz'
  'https://builds.zigtools.org/${_basename}-linux-${_arch[${_carch}]}-${pkgver}.tar.xz.minisig'
)"
done
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68')
sha256sums_aarch64=('d85f4679af3961db149ead8a355eab4652c3e738eecaad69174cab5f1a1196cc'
                    'SKIP')
sha256sums_i686=('79ca762b6cd5cffc165d473636fe0e1b225d2a4f75e5fed555261be4f046166b'
                 'SKIP')
sha256sums_riscv64=('892915a4b06b0503681e45eb45d7bf67a7d7d48daeb73c4ffd0bfb0d59b27a4b'
                    'SKIP')
sha256sums_x86_64=('661f8d402ba3dc9b04b6e9bc3026495be7b838d2f18d148db2bd98bd699c1360'
                   'SKIP')
sha256sums_powerpc64le=('c5d88b19017d8b9904a03cb088521f5bbd17171214b84bf2e712947f975b5b9f'
                        'SKIP')
sha256sums_loong64=('ce006e31084451a8cdb493965f93f8355485ec4693f54fcba377766ed61597f2'
                    'SKIP')
sha256sums_armv7h=('34a41ddf6790959b220724957dedd2919f276298277f3e985dc68c7f9b47d3a0'
                   'SKIP')

verify() {
  # https://github.com/zigtools/release-worker?tab=readme-ov-file#build-artifacts
  local zls_minisign="RWR+9B91GBZ0zOjh6Lr17+zKf5BoSuFvrx2xSeDE57uIYvnKBGmMjOex"
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_artifact="${source_arch##*/}"

  minisign -V \
    -P "${zls_minisign}" \
    -m "${source_artifact}"
}

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_pkgver}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${_pkgname}|g" \
      -i "${_basename}-versioned.sh"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${_pkgname}/${_basename}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
