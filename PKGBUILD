# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=ascii-chat
pkgver=0.4.12
pkgrel=1
pkgdesc="Video chat in your terminal - runtime binary"
arch=('x86_64' 'aarch64')
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
)
optdepends=(
  'libasciichat: development headers and libraries'
  'v4l-utils: webcam device utilities'
  'openssh: ssh-agent support for key authentication'
)
provides=('ascii-chat')
conflicts=('ascii-chat')
options=('lto' 'ccache')

source=("$pkgname-$pkgver-full.tar.gz::https://github.com/zfogg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-full.tar.gz")
sha256sums=('380bd84ff5811d33a0fdf6c98a0cee3add62deeb93636f9206268b5d8261c91a')

prepare() {
  cd "$pkgname-$pkgver"
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
  cd "$pkgname-$pkgver"

  # Strip _FORTIFY_SOURCE from CFLAGS - musl doesn't provide glibc's __*_chk wrappers
  export CFLAGS="${CFLAGS//-Wp,-D_FORTIFY_SOURCE=?/}"
  export CFLAGS="${CFLAGS//-D_FORTIFY_SOURCE=?/}"
  export CFLAGS="$CFLAGS -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0"

  # PortAudio's SSL cert expired Dec 2025 - skip TLS verification for downloads
  export CMAKE_TLS_VERIFY=0

  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  # Only build the runtime binary (no libraries or docs)
  cmake --build build --target ascii-chat
}

package() {
  cd "$pkgname-$pkgver"
  # Install only Runtime component (binary + man1 + shell completions)
  DESTDIR="$pkgdir" cmake --install build --component Runtime
}
