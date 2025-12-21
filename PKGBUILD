# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=libasciichat-git
pkgver=0.4.12.r19.gd162b9f
pkgrel=1
pkgdesc="Development libraries and documentation for ascii-chat"
arch=('x86_64' 'aarch64')
url="https://github.com/zfogg/ascii-chat"
license=('MIT')
depends=('ascii-chat-git')
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

  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  # Build libraries and documentation
  cmake --build build --target shared-lib
  cmake --build build --target static-lib
  cmake --build build --target docs
}

package() {
  cd "$pkgname"
  # Install Development, Documentation, and Manpages components
  DESTDIR="$pkgdir" cmake --install build --component Development
  DESTDIR="$pkgdir" cmake --install build --component Documentation
  DESTDIR="$pkgdir" cmake --install build --component Manpages
}
