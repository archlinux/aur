# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_llvm=19
_basename="zig"
_suffix="-mach"
pkgname="${_basename}${_suffix}"
pkgver=0.14.0dev.2577+271452d22
_pkgver="${pkgver//dev/-dev}"
pkgrel=4
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
  'minisign'
  
  # "llvm>=${_llvm}"
  "llvm${_llvm}"
)
# checkdepends=( # checkdepends_x86_64
#   'lib32-glibc'
# )
options=(
  'emptydirs'
  '!lto'
  '!strip'
)
_pkgsrc="${_basename}-${_pkgver}"
source=(
  "https://pkg.machengine.org/zig/${_pkgsrc}.tar.xz"
  "https://pkg.machengine.org/zig/${_pkgsrc}.tar.xz.minisig"
)
sha256sums=('a979e021e3be89f45eccf6d081032da03afc674db753ab400ad8c85b7ee3c089'
            'SKIP')

verify() {
  # https://ziglang.org/download/
  local ziglang_minisign="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"

  minisign -V \
    -P "${ziglang_minisign}" \
    -m "${_pkgsrc}.tar.xz"
}

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

  install -vd "${pkgdir}/opt/${pkgname}/lib" "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"

  cd "fakeinstall/usr"
  cp -va --no-preserve=ownership "bin"          -T "${pkgdir}/opt/${pkgname}"
  cd "lib"
  cp -a  --no-preserve=ownership "${_basename}" -T "${pkgdir}/opt/${pkgname}/lib"

  ln -vsf "/opt/${pkgname}/${_basename}" "${pkgdir}/usr/bin/${pkgname}"
  ln -vsf "/opt/${pkgname}/lib"          "${pkgdir}/usr/lib/${pkgname}"
}
