# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=libasciichat
pkgver=0.4.12
pkgrel=1
pkgdesc="Development libraries and documentation for ascii-chat"
arch=('x86_64' 'aarch64')
url="https://github.com/zfogg/ascii-chat"
license=('MIT')
depends=('ascii-chat')
makedepends=(
  'git'
  'pkg-config'
  'cmake'
  'ninja'
  'clang'
  'llvm'
  'llvm-libs'
  'musl'
  'mimalloc'
  'zstd'
  'libsodium'
  'portaudio'
  'doxygen'
)
provides=('libasciichat')
conflicts=('libasciichat')
options=('staticlibs' 'lto' 'docs' 'ccache')

validpgpkeys=('F315D1B948F33B2102FBD7B6B95124621822044A')  # Zachary Fogg <me@zfo.gg>
source=("ascii-chat-$pkgver-full.tar.gz::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/ascii-chat-$pkgver-full.tar.gz"
        "ascii-chat-$pkgver-full.tar.gz.asc::https://github.com/zfogg/ascii-chat/releases/download/v$pkgver/ascii-chat-$pkgver-full.tar.gz.asc")
sha256sums=('380bd84ff5811d33a0fdf6c98a0cee3add62deeb93636f9206268b5d8261c91a'
            'SKIP')

prepare() {
  cd "ascii-chat-$pkgver"
  # Create a real git repo with the version tag so git describe works
  rm -rf .git
  git init -q
  git config user.email "build@localhost"
  git config user.name "Build"
  git add -A
  git commit -q -m "v$pkgver"
  git tag "v$pkgver"
}

build() {
  cd "ascii-chat-$pkgver"

  # Strip _FORTIFY_SOURCE from CFLAGS - musl doesn't provide glibc's __*_chk wrappers
  export CFLAGS="${CFLAGS//-Wp,-D_FORTIFY_SOURCE=?/}"
  export CFLAGS="${CFLAGS//-D_FORTIFY_SOURCE=?/}"
  export CFLAGS="$CFLAGS -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0"

  # PortAudio's SSL cert expired Dec 2025 - skip TLS verification for downloads
  export CMAKE_TLS_VERIFY=0

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
  cd "ascii-chat-$pkgver"
  # Install Development, Documentation, and Manpages components
  # NOTE: Also install Unspecified component to get versioned shared library files
  # (CMake's EXPORT splits shared libraries: versioned files → Unspecified, namelink → Development)
  DESTDIR="$pkgdir" cmake --install build --component Unspecified
  DESTDIR="$pkgdir" cmake --install build --component Development
  DESTDIR="$pkgdir" cmake --install build --component Documentation
  DESTDIR="$pkgdir" cmake --install build --component Manpages
}
