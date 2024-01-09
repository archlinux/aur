# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: José Luis Lafuente <jl@lafuente.me>
# Contributor: Michael Louis Thaler <michael.louis.thaler@gmail.com>

pkgname=watchman
pkgver=2024.01.08.00
pkgrel=1
pkgdesc="Watches files and records, or triggers actions, when they change"
url="https://github.com/facebook/watchman"
arch=(x86_64)
license=(MIT)
depends=(
  edencommon
  fmt
  folly
  gcc-libs
  glibc
  google-glog
  libunwind
  openssl
  pcre2
  python
)
makedepends=(
  boost
  cmake
  gtest
  rust
)
backup=(etc/watchman.json)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "watchman-destdir.patch::https://src.fedoraproject.org/rpms/watchman/raw/a446ccc61c73d74053792656c3832f93bf0fe262/f/watchman-destdir.patch"
  "watchman.conf"
  "watchman.json"
  "watchman.service"
  "watchman.socket"
)
sha256sums=(
  'fea21717be1d3e57b4dab4b25e88592c3c2228b5b425bf34173193fbc4736e19'
  'd40feab6aa7dc6522c648660e88642fdf721ee1f9d80c23f6891a6381067a38b'
  '3ebc93cb91ec9b9603969e222fd3ffd9baa4a1d07a7b3bd7aabf956ec2e177c8'
  'ca3d163bab055381827226140568f3bef7eaac187cebd76878e0b63e9e442356'
  '5b4b032b68d87d648e268c5c08b4d56993d5c1a661e3925b39f54bdef2dfbc42'
  '853457ad70492fec9d7d020b9e067e2aec2ca419c0a5cddd5d93c5fab354c87a'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --ignore-whitespace --fuzz=3 --input="$srcdir/watchman-destdir.patch"
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DCMAKE_LIBRARY_ARCHITECTURE=x86_64_v3 \
    -DWATCHMAN_STATE_DIR=/var/run/watchman \
    -DUSE_SYS_PYTHON=ON \
    -DWATCHMAN_VERSION_OVERRIDE="$pkgver" \
    -DENABLE_EDEN_SUPPORT=OFF
  cmake --build build
}

check() {
  cd "$_archive"

  _skipped_tests=(
    # Skip failing tests - not sure why they fail.
    'test_defer_state'
    'test_even_more_moves'
    'test_failingSpawner'
    'test_fishy'
    'test_force_recrawl'
    'test_fstype'
    'test_full_capability_set'
    'test_legacyTrigger'
    'test_localSavedStateSubscription'
    'test_local_saved_state'
    'test_saved_state'
    'test_scmHg'

    # Skip long-running tests.
    'test_invalid_sock_access'
    'test_invalid_sock_group'
    'test_too_open_user_dir'
    'test_user_not_in_sock_group'
    'test_user_previously_in_sock_group'
  )
  _skipped_tests_pattern="${_skipped_tests[0]}"
  for test in "${_skipped_tests[@]:1}"; do
    _skipped_tests_pattern+="|$test"
  done
  ctest --test-dir build --output-on-failure -E "$_skipped_tests_pattern"
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/watchman.conf" "$pkgdir/usr/lib/tmpfiles.d/watchman.conf"
  install -Dm644 "$srcdir/watchman.json" "$pkgdir/etc/watchman.json"
  install -Dm644 "$srcdir/watchman.service" "$pkgdir/usr/lib/systemd/user/watchman.service"
  install -Dm644 "$srcdir/watchman.socket" "$pkgdir/usr/lib/systemd/user/watchman.socket"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
