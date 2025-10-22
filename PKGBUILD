# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: José Luis Lafuente <jl@lafuente.me>
# Contributor: Michael Louis Thaler <michael.louis.thaler@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=watchman
pkgver=2025.10.20.00
pkgrel=1
pkgdesc="Watches files and records, or triggers actions, when they change"
url="https://github.com/facebook/watchman"
arch=(x86_64)
license=(MIT)
depends=(
  boost-libs
  "edencommon=$pkgver"
  "fb303=$pkgver"
  "fbthrift=$pkgver"
  fmt
  "folly=$pkgver"
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
  cpptoml
  "fizz=$pkgver"
  gtest
  "mvfst=$pkgver"
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
sha256sums=('088be97d0e3e14874b23436e3eb9ecf9a1df47453a988c7cd8a3b3aa099589bd'
            'd40feab6aa7dc6522c648660e88642fdf721ee1f9d80c23f6891a6381067a38b'
            '3ebc93cb91ec9b9603969e222fd3ffd9baa4a1d07a7b3bd7aabf956ec2e177c8'
            'ca3d163bab055381827226140568f3bef7eaac187cebd76878e0b63e9e442356'
            '5b4b032b68d87d648e268c5c08b4d56993d5c1a661e3925b39f54bdef2dfbc42'
            '853457ad70492fec9d7d020b9e067e2aec2ca419c0a5cddd5d93c5fab354c87a')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 --ignore-whitespace --fuzz=3 -i ../watchman-destdir.patch
  # Use system CMake config instead of bundled module, incompatible with glog
  # v0.7.0+
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=20 \
    -Wno-dev \
    -DBUILD_SHARED_LIBS=ON \
    -DWATCHMAN_STATE_DIR=/var/run/watchman \
    -DUSE_SYS_PYTHON=ON \
    -DENABLE_EDEN_SUPPORT=ON \
    -DWATCHMAN_VERSION_OVERRIDE=$pkgver \
    -DCMAKE_CXX_FLAGS="-include variant -include cstdint"
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  ctest --test-dir build --output-on-failure --exclude-regex "[Bb]ig|[Ii]ntegration"
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/lib/tmpfiles.d" "$srcdir/watchman.conf"
  install -vDm644 -t "$pkgdir/etc" "$srcdir/watchman.json"
  install -vDm644 -t "$pkgdir/usr/lib/systemd/user" \
    "$srcdir/watchman.service" \
    "$srcdir/watchman.socket"
  #cmake install does not catch these shared libs
  install -vDm644 build/lib*.so \
    -t "$pkgdir/usr/lib"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
