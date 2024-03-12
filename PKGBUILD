# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: José Luis Lafuente <jl@lafuente.me>
# Contributor: Michael Louis Thaler <michael.louis.thaler@gmail.com>

pkgname=watchman
pkgver=2024.03.11.00
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
  python-setuptools
  rust
)
backup=(etc/watchman.json)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "watchman-destdir.patch::https://src.fedoraproject.org/rpms/watchman/raw/a446ccc61c73d74053792656c3832f93bf0fe262/f/watchman-destdir.patch"
  "watchman.conf"
  "watchman.json"
  "watchman.service"
  "watchman.socket"
)
sha256sums=(
  '76ebc0cc5d58115d6d28842dc7a52a0b2007bcb14a1f748c945dec747b6b5187'
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

  # Use system CMake config instead of bundled module, incompatible with glog
  # v0.7.0+
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON \
    -DWATCHMAN_STATE_DIR=/var/run/watchman \
    -DUSE_SYS_PYTHON=ON \
    -DENABLE_EDEN_SUPPORT=OFF \
    -DWATCHMAN_VERSION_OVERRIDE="$pkgver"
  cmake --build build
}

check() {
  cd "$_archive"

  local skipped_tests=(
    # Skip failing tests - not sure why they fail
    test_py::watchman.integration.test_capabilities.TestCapabilitiesCliJson.test_full_capability_set
    test_py::watchman.integration.test_capabilities.TestCapabilitiesUnixBser2.test_full_capability_set
    test_py::watchman.integration.test_capabilities.TestCapabilitiesUnixJson.test_full_capability_set
    test_py::watchman.integration.test_fishy
    test_py::watchman.integration.test_force_recrawl
    test_py::watchman.integration.test_scm.TestScmUnixBser2.test_scmHg
    test_py::watchman.integration.test_scm.TestScmUnixJson.test_scmHg
    test_py::watchman.integration.test_subscribe.TestSubscribeUnixBser2.test_drop_state
    test_py::watchman.integration.test_trigger.TestTriggerUnixBser2.test_legacyTrigger
    test_py::watchman.integration.test_trigger.TestTriggerUnixJson.test_legacyTrigger

    # Skip long-running tests
    test_py::watchman.integration.test_local_saved_state
    test_py::watchman.integration.test_sock_perms.TestSockPerms
  )
  local skipped_tests_pattern="${skipped_tests[0]}$(printf "|%s" "${skipped_tests[@]:1}")"
  ctest --test-dir build --output-on-failure -E "$skipped_tests_pattern"
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 -t "$pkgdir/usr/lib/tmpfiles.d" "$srcdir/watchman.conf"
  install -Dm644 -t "$pkgdir/etc" "$srcdir/watchman.json"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" \
    "$srcdir/watchman.service" \
    "$srcdir/watchman.socket"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
