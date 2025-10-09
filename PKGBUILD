# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgname="${_basename}-master"
pkgver=0.16.0dev.16+fc8e8b2d
pkgrel=1
pkgdesc="A language server for Zig"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'loong64'
  # 'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://zigtools.org/zls"
_url="https://github.com/zigtools/${_basename}"
license=('MIT')
depends=(
  # 'sh'
  'zig-master'
)
makedepends=(
  'curl'
  'git'
  'jq'
)
provides=(
  "${_basename}=${pkgver}"
)
conflicts=(
  "${_basename}"
)
_pkgsrc="${_url##*/}"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

prepare() {
  local zig_version index_json zls_version zls_commit
  zig_version="$(zig version | tr -d '\n' | jq -sRr @uri)"
  index_json="$(curl -s "https://releases.zigtools.org/v1/zls/select-version?zig_version=${zig_version}&compatibility=full")"
  zls_version="$(jq -r '."version"' <<< "${index_json}")"
  zls_commit="${zls_version##*+}"
  
  cd "${srcdir}/${_pkgsrc}"
  git -c advice.detachedHead=false checkout "${zls_commit}"

  grep -oP '(?<=\.url = ")[^"]+' build.zig.zon | while read -r zig_fetch_url; do
    zig fetch --global-cache-dir "${srcdir}/zig-global-cache" "${zig_fetch_url}"
  done
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local build_version build_version_normalized 
  local git_describe git_describe_tail git_describe_normalized
  # 0.16.0-dev
  build_version="$(grep -Po '(?<=\.version = ")[^"]+' build.zig.zon)"
  # 0.16.0dev
  build_version_normalized="${build_version//-/}"
  # 0.15.0-3-g1840a4b8
  git_describe="$(git describe --match "*.*.*" --tags)"
  # 3-g1840a4b8
  git_describe_tail="${git_describe#*-}"
  # 3+1840a4b8
  git_describe_normalized="${git_describe_tail//-g/+}"
  # 0.16.0dev.3+1840a4b8
  printf '%s.%s' "${build_version_normalized}" "${git_describe_normalized}"
}

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    -Dpie=true
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build "${zig_options[@]}"
}

# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.41
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#     -Dpie=true
#   )
# 
#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" zig build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_basename}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
}
