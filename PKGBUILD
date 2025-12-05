# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=ascii-chat-git
pkgver=0.3.55.r0.gc59e4c0
pkgrel=1
pkgdesc="Video chat in your terminal (development version)"
arch=('x86_64')
url="https://github.com/zfogg/ascii-chat"
license=('MIT')
depends=()
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
optdepends=(
  'v4l-utils: webcam device utilities'
  'openssh: ssh-agent support for key authentication'
)
provides=('ascii-chat')
conflicts=('ascii-chat')
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
  cmake --build build
  cmake --build build --target shared-lib
  cmake --build build --target static-lib
  cmake --build build --target docs
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" cmake --install build
}
