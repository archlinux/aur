# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_llvm=19
_basename="zig"
_suffix="-mach"
pkgname="${_basename}${_suffix}"
pkgver=0.14.0dev.2577+271452d22
pkgrel=1
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
url="https://machengine.org/docs/nominated-zig/"
_url="https://codeberg.org/ziglang/${_basename}"
license=(
  'MIT'
)
depends=(
  'gcc-libs'
  'glibc'

  # "clang>=${_llvm}"
  # "lld>=${_llvm}"
  # "llvm-libs>=${_llvm}"
  "clang${_llvm}"
  "lld${_llvm}"
  "llvm${_llvm}-libs"
)
makedepends=(
  'cmake>=3.15'
  'curl'
  'git'
  'jq'
  
  # "llvm>=${_llvm}"
  "llvm${_llvm}"
)
# checkdepends=( # checkdepends_x86_64
#   'lib32-glibc'
# )
options=(
  '!lto'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#commit=${pkgver##*+}"
)
sha256sums=('de5f26d99e3a5da91914b9d7592b0d5926c271b0952bd355b2657ae89691939a')

build() {
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

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  DESTDIR="./fakeinstall" cmake --install "build"
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

  cd "fakeinstall/usr"
  install -vd "${pkgdir}/opt/${pkgname}"
  cp -va --no-preserve=ownership "bin" -T "${pkgdir}/opt/${pkgname}"
  cp -a  --no-preserve=ownership "lib" -t "${pkgdir}/opt/${pkgname}"

  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
  ln -vsf "/opt/${pkgname}/${_basename}" "${pkgdir}/usr/bin/${pkgname}"
  ln -vsf "/opt/${pkgname}/lib"          "${pkgdir}/usr/lib/${pkgname}"
}
