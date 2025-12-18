# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_llvm=21
_basename="zig"
_prefix="-master"
pkgname="${_basename}${_prefix}"
pkgver=0.16.0dev.1484+d0ba6642b
pkgrel=3
pkgdesc="General-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=(
  # 'aarch64'     # 'aarch64'
  # 'armv7h'      # 'arm'
  # 'loong64'     # 'loongarch64'
  # 'powerpc64le' # 'powerpc64le'
  # 'riscv64'     # 'riscv64'
  # 's390x'       # 's390x'
  # 'i686'        # 'x86'
  'x86_64'      # 'x86_64'
)
url="https://ziglang.org"
_url="https://codeberg.org/ziglang/${_basename}"
license=(
  'MIT'
)
depends=(
  'gcc-libs'
  'glibc'

  "clang>=${_llvm}"
  "lld>=${_llvm}"
  "llvm-libs>=${_llvm}"
  # "clang${_llvm}"
  # "lld${_llvm}"
  # "llvm${_llvm}-libs"
)
makedepends=(
  'cmake>=3.15'
  'curl'
  'git'
  'jq'
  
  "llvm>=${_llvm}"
  # "llvm${_llvm}"
)
# checkdepends=( # checkdepends_x86_64
#   'lib32-glibc'
# )
options=(
  '!lto'
  '!strip'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git" # #branch=master
  "${_basename}_skip_futex2_test.patch"
)
sha256sums=('SKIP'
            'eb30e0eb00e6ced4c99383f0658a0351f42882e303300ed1828d162d27171cd0')

prepare() {
  local index_json="$(curl -s "${url}/download/index.json")"
  local zig_version="$(jq -r '."master"."version"' <<< "${index_json}")"
  local zig_commit="${zig_version##*+}"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'

    -D ZIG_PIE:BOOL=ON
    -D ZIG_SHARED_LLVM:BOOL=ON
    -D ZIG_USE_LLVM_CONFIG:BOOL=ON
    # -D ZIG_TARGET_TRIPLE:STRING='native-linux.6.6-gnu.2.42'
    -D ZIG_TARGET_MCPU:STRING='baseline'
  )
  
  cd "${srcdir}/${_pkgsrc}"
  git -c advice.detachedHead=false checkout "${zig_commit}"

  for _source in "${source[@]}"; do
    if [[ "${_source%%::*}" == *.patch ]]; then
      patch -Np1 --batch -i "${srcdir}/${_source%%::*}" || true
    fi
  done

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}/build"
  grep -oP 'pub const version:\s*\[:0\]const u8 = "\K[^"]+' 'config.zig' | sed 's/-//g'
}

build() {
  cd "${srcdir}"
  cmake --build "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  DESTDIR="./fakeinstall" cmake --install build
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   # ugly workaround until test target is provided
#   # https://github.com/ziglang/zig/issues/14240
#   ./fakeinstall/usr/bin/zig build test \
#     -Dconfig_h=build/config.h \
#     -Dstatic-llvm=false \
#     -Denable-llvm=true \
#     -Dskip-non-native=true
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -vd "${pkgdir}/opt/${pkgname}/lib" "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"

  cd "fakeinstall/usr"
  cp -va --no-preserve=ownership "bin"          -T "${pkgdir}/opt/${pkgname}"
  cd "lib"
  cp -a  --no-preserve=ownership "${_basename}" -T "${pkgdir}/opt/${pkgname}/lib"

  ln -vsf "/opt/${pkgname}/${_basename}" "${pkgdir}/usr/bin/${pkgname}"
  ln -vsf "/opt/${pkgname}/lib"          "${pkgdir}/usr/lib/${pkgname}"
}
