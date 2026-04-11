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
pkgver=0.16.0dev.300+f391142c
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
sha256sums_aarch64=('562d28283b570a22aae3805cf1dc16d9f6bfdd246e94e8ef09a866c681fc0709'
                    'SKIP')
sha256sums_i686=('29d0d64c69816dce5371aef284cc14dde68baeac9af533d662d9874df31440a4'
                 'SKIP')
sha256sums_riscv64=('214b619c854a22a34f69230b92a133f94e0b60528ca842c0aaab8e72626e4b3b'
                    'SKIP')
sha256sums_x86_64=('af74e603d3d592581c91fcc6b2aeffbfb56a89169c831c910a02f02f91e45f9d'
                   'SKIP')
sha256sums_loong64=('7ca00d55068483394fcba1c310ea5a9987a4d3d08d15428c9757356ec6147bbd'
                    'SKIP')
sha256sums_armv7h=('8bd546b49cd9707751ac08abea5fc6d1447c36f59a8c02f2ad2237b65931e061'
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
