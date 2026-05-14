# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zig"
pkgver=0.15.2
_pkgver="${pkgver%.*}"
pkgrel=2
_llvm=20

pkgname="${_basename}${_pkgver}"
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
license=(
  'MIT'
)
depends=(
  'glibc'
  'libstdc++'

  "clang${_llvm}"
  "lld${_llvm}"
  "llvm${_llvm}-libs"
)
makedepends=(
  'cmake>=3.15'
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
  "${_basename}_skip_futex_test.patch"
)
sha256sums=('d9b30c7aa983fcff5eed2084d54ae83eaafe7ff3a84d8fb754d854165a6e521c'
            'SKIP'
            'eeb5f0f72035c52bf558ffc77a171a3ddf93eac7d663ef0c82826007763717a8'
            'eb30e0eb00e6ced4c99383f0658a0351f42882e303300ed1828d162d27171cd0')

verify() {
  # https://ziglang.org/download/
  local ziglang_minisign="RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U"

  minisign -V \
    -P "${ziglang_minisign}" \
    -m "${source[0]##*/}"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_basename}_skip_localhost_test.patch"
  patch -Np1 -i "${srcdir}/${_basename}_skip_futex_test.patch"
}

build() {
  # export CC="clang-${_llvm}"
  # export CXX="clang++-${_llvm}"
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    # -D CMAKE_PREFIX_PATH:PATH="/usr/lib/llvm${_llvm}"
  
    # -D ZIG_VERSION:STRING="${pkgver}"
    -D ZIG_PIE:BOOL=ON
    -D ZIG_SHARED_LLVM:BOOL=ON
    -D ZIG_USE_LLVM_CONFIG:BOOL=ON
    # -D ZIG_TARGET_TRIPLE:STRING="native-linux.6.15-gnu.2.42"
    -D ZIG_TARGET_MCPU:STRING="baseline"
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"

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

  ln -vsf "/opt/${pkgname}/${_basename}" "${pkgdir}/usr/bin/${_basename}-${_pkgver}"
  ln -vsf "/opt/${pkgname}/lib"          "${pkgdir}/usr/lib/${pkgname}"
}
