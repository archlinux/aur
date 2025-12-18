# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.12.1
_pkgver="${pkgver%.*}"
pkgrel=1
_llvm=17

pkgname="${_basename}${_pkgver}"
pkgdesc="General-purpose programming language and toolchain for maintaining robust, optimal, and reusable software"
arch=(
  # 'aarch64'     # 'aarch64'
  # 'armv7h'      # 'armv7a'
  # 'powerpc64le' # 'powerpc64le'
  # 'riscv64'     # 'riscv64'
  # 'i686'        # 'x86'
  'x86_64'      # 'x86_64'
)
url="https://ziglang.org"
license=(
  'MIT'
)
depends=(
  'gcc-libs'
  'glibc'

  "clang${_llvm}"
  "lld${_llvm}"
  "llvm${_llvm}-libs"
)
makedepends=(
  'cmake'
  'minisign'

  "llvm${_llvm}"
)
# checkdepends=(
#   'lib32-glibc'
# )
options=(
  'emptydirs'
  '!lto'
  '!strip'
)
_pkgsrc="${_basename}-${pkgver}"
source=(
  "https://ziglang.org/download/${pkgver}/${_pkgsrc}.tar.xz"
  "https://ziglang.org/download/${pkgver}/${_pkgsrc}.tar.xz.minisig"
  "${_basename}_skip_localhost_test.patch"
)
sha256sums=('cca0bf5686fe1a15405bd535661811fac7663f81664d2204ea4590ce49a6e9ba'
            'SKIP'
            'eeb5f0f72035c52bf558ffc77a171a3ddf93eac7d663ef0c82826007763717a8')

verify() {
  # https://ziglang.org/download/
  local ziglang_minisign="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"

  minisign -V \
    -P "${ziglang_minisign}" \
    -m "${_pkgsrc}.tar.xz"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_basename}_skip_localhost_test.patch"
}

build() {
  # export CC="clang-${_llvm}"
  # export CXX="clang++-${_llvm}"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_PREFIX_PATH:PATH="/usr/lib/llvm${_llvm}"
  
    -D ZIG_PIE:BOOL=ON
    -D ZIG_SHARED_LLVM:BOOL=ON
    -D ZIG_USE_LLVM_CONFIG:BOOL=ON
    # -D ZIG_TARGET_TRIPLE:STRING="native-linux.6.15-gnu.2.42"
    -D ZIG_TARGET_MCPU:STRING="baseline"
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
