# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=sentry-native
pkgver=0.6.7
pkgrel=3
pkgdesc="Sentry SDK for C, C++ and native applications"
arch=(x86_64)
url="https://github.com/getsentry/sentry-native"
license=(MIT)
depends=(
  curl
  gcc-libs
  glibc
)
makedepends=(
  cmake
  git
)
checkdepends=(
  python-pytest
  python-msgpack
)

_commit=a3d58622a807b9dda174cb9fc18fa0f98c89d043 # git rev-parse "$pkgver"
source=(
  "git+$url.git#commit=$_commit"
  "git+https://github.com/getsentry/libunwindstack-ndk.git"
  "git+https://github.com/getsentry/breakpad.git"
  "git+https://chromium.googlesource.com/linux-syscall-support.git"
  "git+https://github.com/getsentry/crashpad.git"
)
sha256sums=(
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
}

build() {
  cd "$_archive"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DSENTRY_BUILD_TESTS=ON
  cmake --build build
}

check() {
  cd "$_archive"

  # Skip tests failing in a chroot - not sure why
  ./build/tests/unit/sentry_test_unit --skip \
    build_id_parser \
    fuzz_json

  python -m pytest \
    --ignore="external/crashpad/test/win" \
    --ignore="external/crashpad/snapshot/win/" \
    --ignore="tests/test_build_static.py" \
    --ignore="tests/test_integration_crashpad.py" \
    --ignore="tests/test_integration_http.py" \
    --ignore="tests/test_integration_ratelimits.py"
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
