# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['armv7h']='arm'
  # ['loong64']='loongarch64'
  # ['powerpc64le']='powerpc64le'
  # ['riscv64']='riscv64'
  # ['s390x']='s390x'
  ['i686']='x86'
  ['x86_64']='x86_64'
)

_basename="zls"
_suffix="-mach"
_pkgname="${_basename}${_suffix}"
pkgname="${_pkgname}-bin"
pkgver=0.14.0dev.406+336f468
_pkgver="${pkgver//dev/-dev}"
pkgrel=4
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
  "zig${_suffix}"
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
source=(
  "${_basename}-versioned.sh"
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  'https://builds.zigtools.org/${_basename}-linux-${_arch[${_carch}]}-${_pkgver}.tar.xz'
  'https://builds.zigtools.org/${_basename}-linux-${_arch[${_carch}]}-${_pkgver}.tar.xz.minisig'
)"
done
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68')
sha256sums_aarch64=('978a3fb031d215274b49acb1dbd653e96e978ac65e5d8a0453e9b77bfb5975f2'
                    'SKIP')
sha256sums_i686=('fcc1fad1555a07ccc7cbf530d7c1f5cfbdf9d518d0ec5646fa0931e2cf6ea9f1'
                 'SKIP')
sha256sums_x86_64=('9afa892f88ae9e92b600786e2ee169b6452ccaaae335c3f70381534b3589abac'
                   'SKIP')
sha256sums_armv7h=('cd3ba0704ea6635e34e4bcb2040790d9bd8f22c48db7e9f1b3bd1f149538ef39'
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

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_suffix}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${_pkgname}|g" \
      -i "${_basename}-versioned.sh"

  chmod +x ./"${_basename}"
}

pkgver() {
  cd "${srcdir}"
  ./"${_basename}" version | sed 's/-//g'
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${_pkgname}/${_basename}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
