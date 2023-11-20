# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=sentry-native
pkgver=0.6.7
pkgrel=1
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
)
checkdepends=(
  python-pytest
  python-msgpack
)

_breakpad_commit_hash=eb28e7ed9c1c1e1a717fa34ce0178bf471a6311f
_crashpad_commit_hash=3182e3be21a8a753f9f269f0a590370d49c8f3cf
_libunwindstack_ndk_commit_hash=f064cc8da606f38450ff5d345ae716ff9dab3d7c

_lss_commit_hash=9719c1e1e676814c456b55f5f070eabad6709d31
_mini_chromium_commit_hash=6a817b86d4bd0e0672df4a094c4490ecef761a59
_zlib_commit_hash=13dc246a58e4b72104d35f9b1809af95221ebda7

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "breakpad-$_breakpad_commit_hash.tar.gz::https://github.com/getsentry/breakpad/archive/$_breakpad_commit_hash.tar.gz"
  "crashpad-$_crashpad_commit_hash.tar.gz::https://github.com/getsentry/crashpad/archive/$_crashpad_commit_hash.tar.gz"
  "libunwindstack-ndk-$_libunwindstack_ndk_commit_hash.tar.gz::https://github.com/getsentry/libunwindstack-ndk/archive/$_libunwindstack_ndk_commit_hash.tar.gz"

  "lss-$_lss_commit_hash.tar.gz::https://chromium.googlesource.com/linux-syscall-support/+archive/$_lss_commit_hash.tar.gz"
  "zlib-$_zlib_commit_hash.tar.gz::https://chromium.googlesource.com/chromium/src/third_party/zlib/+archive/$_zlib_commit_hash.tar.gz"
  "mini_chromium-$_mini_chromium_commit_hash.tar.gz::https://chromium.googlesource.com/chromium/mini_chromium/+archive/$_mini_chromium_commit_hash.tar.gz"
)
sha256sums=(
  'f60c77fe1a14274886a04d788381bfdc2f80164751af0675c693eb337d86eaa1'
  'fbf8ee18caf3a2ae0a286c0397e2d4f76d2872da1b4374a4fe56e2d8eb5fc18b'
  '9ac75ef2acbb09f652b5ed1994dfeaf422b834b3960cf372d688c2f42f49df4b'
  '7de693def0abff7aee03bc289fb3f7d489b689e972abbe20bd50ac1aa86e81ef'

  # Compressed source archives from chromium.googlesource.com are not
  # deterministic.
  'SKIP'
  'SKIP'
  'SKIP'
)
noextract=(
  "lss-$_lss_commit_hash.tar.gz"
  "zlib-$_zlib_commit_hash.tar.gz"
  "mini_chromium-$_mini_chromium_commit_hash.tar.gz"
)

_archive="$pkgname-$pkgver"

prepare() {
  _mkdir_and_tar() {
    mkdir -p "$1"
    tar -xf "$1.tar.gz" -C "$1"
  }

  _mkdir_and_tar "lss-$_lss_commit_hash"
  _mkdir_and_tar "zlib-$_zlib_commit_hash"
  _mkdir_and_tar "mini_chromium-$_mini_chromium_commit_hash"

  _rm_and_cp() {
    rm -r "$2"
    cp -r "$1" "$2"
  }

  _rm_and_cp "breakpad-$_breakpad_commit_hash" "$_archive/external/breakpad"
  _rm_and_cp "crashpad-$_crashpad_commit_hash" "$_archive/external/crashpad"
  _rm_and_cp "libunwindstack-ndk-$_libunwindstack_ndk_commit_hash" "$_archive/external/libunwindstack-ndk"

  _rm_and_cp "lss-$_lss_commit_hash" "$_archive/external/third_party/lss"
  _rm_and_cp "lss-$_lss_commit_hash" "$_archive/external/crashpad/third_party/lss"
  _rm_and_cp "zlib-$_zlib_commit_hash" "$_archive/external/crashpad/third_party/zlib"
  _rm_and_cp "mini_chromium-$_mini_chromium_commit_hash" "$_archive/external/crashpad/third_party/mini_chromium"
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

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
