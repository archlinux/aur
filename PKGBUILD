# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgname="${_basename}-master"
pkgver=0.16.0dev.63+60cff3d6
pkgrel=1
pkgdesc="A language server for Zig"
arch=(
  'aarch64'     # 'aarch64'
  'armv7h'      # 'arm'
  'loong64'     # 'loongarch64'
  # 'powerpc64le' # 'powerpc64le'
  'riscv64'     # 'riscv64'
  # 's390x'       # 's390x'
  'i686'        # 'x86'
  'x86_64'      # 'x86_64'
)
url="https://zigtools.org/zls"
_url="https://github.com/zigtools/${_basename}"
license=(
  'MIT'
)
depends=(
  'sh'
  'zig-master'
)
makedepends=(
  'curl'
  'git'
  'jq'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git"
  "${_basename}-versioned.sh"
)
sha256sums=('SKIP'
            'b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68')

prepare() {
  local zig_version="$(zig-master version | tr -d '\n' | jq -sRr @uri)"
  local index_json="$(curl -s "https://releases.zigtools.org/v1/zls/select-version?zig_version=${zig_version}&compatibility=full")"
  local zls_version="$(jq -r '."version"' <<< "${index_json}")"
  local zls_commit="${zls_version##*+}"
  
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig-master|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${pkgname}|g" \
      -i "${_basename}-versioned.sh"

  cd "${_pkgsrc}"
  git -c advice.detachedHead=false checkout "${zls_commit}"

  grep -oP '(?<=\.url = ")[^"]+' build.zig.zon | while read -r zig_fetch_url; do
    zig-master fetch --global-cache-dir "${srcdir}/zig-global-cache" "${zig_fetch_url}"
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
  # 0.16.0 OR 0.15.0-3-g1840a4b8
  git_describe="$(git describe --match "*.*.*" --tags)"

  case "$git_describe" in
    *-*-g*)
      # 3-g1840a4b8
      git_describe_tail="${git_describe#*-}"
      # 3+1840a4b8
      git_describe_normalized="${git_describe_tail//-g/+}"
      # 0.16.0dev.3+1840a4b8
      printf '%s.%s' "$build_version_normalized" "$git_describe_normalized"
      ;;
    *)
      # Tagged release: 0.16.0
      printf '%s' "$git_describe"
      ;;
  esac
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
  DESTDIR="build" zig-master build "${zig_options[@]}"
}

# check() {
#   export PATH="/opt/zig-master:$PATH"
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
#   DESTDIR="check" zig-master build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "build/usr/bin"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${pkgname}/${_basename}"
}
