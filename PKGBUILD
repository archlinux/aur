# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgver=0.16.0
_pkgver="${pkgver%.*}"
pkgrel=1

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['armv7h']='arm'
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
  'https://builds.zigtools.org/${_basename}-${_arch[${_carch}]}-linux-${pkgver}.tar.xz'
  'https://builds.zigtools.org/${_basename}-${_arch[${_carch}]}-linux-${pkgver}.tar.xz.minisig'
)"
done
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68')
sha256sums_aarch64=('430cd293d201eb70ae2519dbc96c854bf8791b8df7fc9392e8d2dc9680a2bed7'
                    'SKIP')
sha256sums_i686=('2f7965da884d74d9f7e8b8ef1208ae137084680ddf8580473ff412f62a4051a8'
                 'SKIP')
sha256sums_riscv64=('2764ac1303a5b398569df0e8702c6f6ef86da915aeff4bf9dd0c22bc55324288'
                    'SKIP')
sha256sums_x86_64=('ded6d562a0b86ee878b1ddf70ffab2797ce3cdca3b02d6077548f9d56dff96b6'
                   'SKIP')
sha256sums_powerpc64le=('d51289187aaa892eb266baaa6c1d7f2a30f6d195eaa295c6f54eef17214f03fa'
                        'SKIP')
sha256sums_loong64=('91128eb73e475cb85f81c40182cb6ce24457b29c857ceb8619205e6cc4bc7b96'
                    'SKIP')
sha256sums_armv7h=('7cf8d11f914127809b89254ad97e4b96d84294370418954a49b78bd623d3c55e'
                   'SKIP')

verify() {
  # https://github.com/zigtools/release-worker?tab=readme-ov-file#build-artifacts
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
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_pkgver}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${_pkgname}|g" \
      -i "${_basename}-versioned.sh"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${_basename}-${_pkgver}"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${_pkgname}/${_basename}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
