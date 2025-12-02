# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=ascii-chat
pkgver=0.3.13
pkgrel=1
pkgdesc="Video chat in your terminal"
arch=('x86_64')
url="https://github.com/zfogg/ascii-chat"
license=('MIT')
depends=()
makedepends=(
  'cmake'
  'ninja'
  'clang'
  'llvm'
  'llvm-libs'
  'pkg-config'
  'musl'
  'mimalloc'
  'zstd'
  'libsodium'
  'portaudio'
)
optdepends=(
  'v4l-utils: webcam device utilities'
)

source=("$pkgname-$pkgver-full.tar.gz::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-full.tar.gz")
sha256sums=('e3f855af056e314f8451118f71eebb12b3ee1f3c6b2c27a829dad82a5b710ef8')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p .git
  echo "ref: refs/tags/v$pkgver" > .git/HEAD
  touch .git/index
}

build() {
  cd "$pkgname-$pkgver"

  # Strip _FORTIFY_SOURCE from CFLAGS - musl doesn't provide glibc's __*_chk wrappers
  # The -Wp, prefix passes directly to preprocessor, incompatible with musl libc
  # Also explicitly undefine in case system headers auto-enable it
  export CFLAGS="${CFLAGS//-Wp,-D_FORTIFY_SOURCE=?/}"
  export CFLAGS="${CFLAGS//-D_FORTIFY_SOURCE=?/}"
  export CFLAGS="$CFLAGS -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0"

  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  # License is installed by cmake to /usr/share/doc/ascii-chat/LICENSE
}
