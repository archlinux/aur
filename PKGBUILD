# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# curl "https://releases.zigtools.org/v1/zls/select-version?zig_version=$(zig-mach version | tr -d '\n' | jq -sRr @uri)&compatibility=only-runtime" | jq

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['armv7h']='arm'
  ['loong64']='loongarch64'
  # ['powerpc64le']='powerpc64le'
  ['riscv64']='riscv64'
  # ['s390x']='s390x'
  ['i686']='x86'
  ['x86_64']='x86_64'
)

_basename="zls"
_suffix="-mach"
_pkgname="${_basename}${_suffix}"
pkgname="${_pkgname}-bin"
pkgver=0.17.0dev.44+8da87d4f
_pkgver="${pkgver//dev/-dev}"
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
  'https://builds.zigtools.org/${_basename}-${_arch[${_carch}]}-linux-${_pkgver}.tar.xz'
  'https://builds.zigtools.org/${_basename}-${_arch[${_carch}]}-linux-${_pkgver}.tar.xz.minisig'
)"
done
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68')
sha256sums_aarch64=('ea9a8b194f7e74409e16b26747a1efd40c094381d22e18af340a7b826d454203'
                    'SKIP')
sha256sums_i686=('b89294cacdf93936e278202d339154717a89be4facc0aae6f0c125e5ebde266c'
                 'SKIP')
sha256sums_riscv64=('a70c9fd6948548a765bd64e9bf59bd77a87fc0d3129425a2228a12cc4a6efacb'
                    'SKIP')
sha256sums_x86_64=('9ea223fa88424671555911beba5d689191ae080a4e827ef5c76c8f64e39ff296'
                   'SKIP')
sha256sums_loong64=('e113b5dc5ea416133098c87509fea57ad5bd42c9585314b00dc308fc71720474'
                    'SKIP')
sha256sums_armv7h=('82618b10507eb2ef364f1fb2801f92411bc6ac10df812e81257b6a3cf1b7b77d'
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

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_suffix}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${_pkgname}|g" \
      -i "${_basename}-versioned.sh"

  # chmod +x ./"${_basename}"
}

# pkgver() {
#   cd "${srcdir}"
#   ./"${_basename}" version | sed 's/-//g'
# }

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${_pkgname}/${_basename}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
