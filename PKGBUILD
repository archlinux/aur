# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=libasciichat-git
pkgver=0.4.12.r29.ga8971483
pkgrel=1
pkgdesc="Development libraries and documentation for ascii-chat"
arch=('x86_64' 'aarch64')
url="https://github.com/zfogg/ascii-chat"
license=('MIT')
depends=('zstd' 'libsodium' 'opus' 'mimalloc' 'portaudio')
makedepends=(
  'git'
  'pkg-config'
  'cmake'
  'ninja'
  'make'
  'python'
  'clang'
  'llvm'
  'llvm-libs'
  'lld'
  'libc++'
  'libc++abi'
  'musl'
  'zlib'
  'doxygen'
)
optdepends=('ascii-chat-git')
provides=('libasciichat')
conflicts=('libasciichat')
options=('staticlibs' 'lto' 'docs' 'ccache')

validpgpkeys=('F315D1B948F33B2102FBD7B6B95124621822044A')  # Zachary Fogg <me@zfo.gg>
source=("$pkgname::git+https://github.com/zfogg/ascii-chat.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"

  # Strip _FORTIFY_SOURCE from CFLAGS - musl doesn't provide glibc's __*_chk wrappers
  export CFLAGS="${CFLAGS//-Wp,-D_FORTIFY_SOURCE=?/}"
  export CFLAGS="${CFLAGS//-D_FORTIFY_SOURCE=?/}"
  export CFLAGS="$CFLAGS -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0"

  # Force use of system LLVM tools instead of any custom install in /usr/local
  # This ensures the defer tool links against the correct LLVM version (matching system clang)
  # Same approach as homebrew-ascii-chat Formula to ensure all tools are from the same LLVM
  export PATH="/usr/bin:$PATH"
  export CC=/usr/bin/clang
  export CXX=/usr/bin/clang++

  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DASCIICHAT_LLVM_CONFIG_EXECUTABLE=/usr/bin/llvm-config \
    -DASCIICHAT_CLANG_EXECUTABLE=/usr/bin/clang \
    -DASCIICHAT_CLANG_PLUS_PLUS_EXECUTABLE=/usr/bin/clang++ \
    -DASCIICHAT_LLVM_AR_EXECUTABLE=/usr/bin/llvm-ar \
    -DASCIICHAT_LLVM_RANLIB_EXECUTABLE=/usr/bin/llvm-ranlib \
    -DASCIICHAT_LLVM_NM_EXECUTABLE=/usr/bin/llvm-nm \
    -DASCIICHAT_LLVM_READELF_EXECUTABLE=/usr/bin/llvm-readelf \
    -DASCIICHAT_LLVM_OBJDUMP_EXECUTABLE=/usr/bin/llvm-objdump \
    -DASCIICHAT_LLVM_STRIP_EXECUTABLE=/usr/bin/llvm-strip \
    -DASCIICHAT_LLD_EXECUTABLE=/usr/bin/ld.lld
  # Build libraries and documentation
  cmake --build build --target shared-lib
  cmake --build build --target static-lib
  cmake --build build --target docs
}

package() {
  cd "$pkgname"
  # Install Development, Documentation, and Manpages components
  # All files are now properly assigned to named components (no Unspecified)
  DESTDIR="$pkgdir" cmake --install build --component Development
  DESTDIR="$pkgdir" cmake --install build --component Documentation
  DESTDIR="$pkgdir" cmake --install build --component Manpages
}
