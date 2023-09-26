# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: José Luis Lafuente <jl@lafuente.me>
# Contributor: Michael Louis Thaler <michael.louis.thaler@gmail.com>

pkgname=watchman
pkgver=2023.09.25.00
pkgrel=1
pkgdesc="Watches files and records, or triggers actions, when they change"
url="https://github.com/facebook/watchman"
arch=(x86_64)
license=(MIT)
depends=(
  boost-libs
  double-conversion
  fmt
  gcc-libs
  gflags
  glibc
  google-glog
  libevent
  libunwind
  openssl
  pcre2
  python
  xz
)
makedepends=(
  boost
  cmake
  edencommon
  folly
  gmock
  rust
)
backup=(etc/watchman.json)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "https://src.fedoraproject.org/rpms/watchman/raw/a446ccc61c73d74053792656c3832f93bf0fe262/f/watchman-destdir.patch"
  "watchman.conf"
  "watchman.json"
  "watchman.service"
  "watchman.socket"
  "0001-Fix-build-with-fmt-10.patch"
)
sha256sums=(
  'ce0f2386e2dc316bfe11194523e3c51c3759af5d7fe7c9ba8a46e0c446ce7b00'
  'd40feab6aa7dc6522c648660e88642fdf721ee1f9d80c23f6891a6381067a38b'
  '3ebc93cb91ec9b9603969e222fd3ffd9baa4a1d07a7b3bd7aabf956ec2e177c8'
  'ca3d163bab055381827226140568f3bef7eaac187cebd76878e0b63e9e442356'
  '5b4b032b68d87d648e268c5c08b4d56993d5c1a661e3925b39f54bdef2dfbc42'
  '853457ad70492fec9d7d020b9e067e2aec2ca419c0a5cddd5d93c5fab354c87a'
  '90e5fd45b1e7380edddbcc9cdfc0eed2fae3696ac9da7c67fdc351b14a5d85f2'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --ignore-whitespace --fuzz=3 --input="$srcdir/watchman-destdir.patch"
  patch --forward --strip=1 --ignore-whitespace --input="$srcdir/0001-Fix-build-with-fmt-10.patch"
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

  exclude_tests=$(
    echo "
      test_defer_state
      test_even_more_moves
      test_failingSpawner
      test_fishy
      test_force_recrawl
      test_fstype
      test_full_capability_set
      test_legacyTrigger
      test_localSavedStateSubscription
      test_scmHg
    " | xargs | sed 's/\s/|/g'
  )
  ctest --test-dir build --output-on-failure \
    -E "($exclude_tests)"
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/watchman.conf" "$pkgdir/usr/lib/tmpfiles.d/watchman.conf"
  install -Dm644 "$srcdir/watchman.json" "$pkgdir/etc/watchman.json"
  install -Dm644 "$srcdir/watchman.service" "$pkgdir/usr/lib/systemd/user/watchman.service"
  install -Dm644 "$srcdir/watchman.socket" "$pkgdir/usr/lib/systemd/user/watchman.socket"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
