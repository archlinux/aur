# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=sentry-native
pkgver=0.7.2
_commit=0f1d664759cba187a846a562f9d55f3c62dffaa3
pkgrel=1
pkgdesc="Sentry SDK for C, C++ and native applications"
arch=(x86_64)
url="https://github.com/getsentry/sentry-native"
license=(MIT)
depends=(
  curl
  gcc-libs
  glibc
  zlib
)
makedepends=(
  cmake
  git
)
checkdepends=(
  python-msgpack
  python-pytest
  python-pytest-httpserver
)
source=(
  "git+$url.git#commit=$_commit"
  "git+https://github.com/getsentry/libunwindstack-ndk.git"
  "git+https://github.com/getsentry/breakpad.git"
  "git+https://chromium.googlesource.com/linux-syscall-support.git"
  "git+https://github.com/getsentry/crashpad.git"
  "git+https://chromium.googlesource.com/chromium/mini_chromium.git"
  "git+https://chromium.googlesource.com/chromium/src/third_party/zlib.git"
)
sha256sums=(
  '48003098c6dc2e4737315a83961b2da18737c196c39eaa222cec683ba3d82065'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

_archive="$pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags
}

prepare() {
  cd "$_archive"

  git submodule init
  git config submodule.external/libunwindstack-ndk.url "$srcdir/libunwindstack-ndk"
  git config submodule.external/breakpad.url "$srcdir/breakpad"
  git config submodule.external/third_party/lss.url "$srcdir/linux-syscall-support"
  git config submodule.external/crashpad.url "$srcdir/crashpad"
  git -c protocol.file.allow=always submodule update

  cd external/crashpad
  git submodule init
  git config submodule.third_party/mini_chromium/mini_chromium.url "$srcdir/mini_chromium"
  git config submodule.third_party/zlib/zlib.url "$srcdir/zlib"
  git config submoduel.third_party/lss/lss.url "$srcdir/linux-syscall-support"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$_archive"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  cd "$_archive"

  pytest \
    --ignore external/crashpad/test/win \
    --ignore external/crashpad/snapshot/win
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
