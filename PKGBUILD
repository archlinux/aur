# Maintainer: Benjamin Valdez <b.valdez.0509+aur<at>gmail.com>
# Contributor: Bruce Zhang <zttt183525594<at>gmail.com>
pkgname=inputactions-kwin
pkgver=0.9.2.1
pkgrel=1
pkgdesc="Bind keyboard, mouse, touchpad and touchscreen actions to system actions"
arch=('x86_64')
url="https://inputactions.org"
license=('GPL-3.0-or-later')
install=$pkgname.install
backup=("etc/$pkgname/reminder.conf")
depends=(
  'yaml-cpp'
  'libyaml-cpp.so'
  'bash'
  'libgcc'
  'libgcc_s.so'
  'libstdc++'
  'libstdc++.so'
  'qt6-base'
  'glibc'
  'libevdev'
  'libevdev.so'
  'kwin'
  'kcmutils'
  'kcoreaddons'
  'ki18n'
  'inputactions-ctl'
)
optdepends=('libnotify: to send a reminder when this package needs to be rebuild')
checkdepends=('gtest' 'cmake')
makedepends=('cmake' 'pkgconf' 'extra-cmake-modules' 'vulkan-headers')
provides=('inputactions')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/InputActions/kwin/releases/download/v$pkgver/source.tar.gz"
  "send-rebuild-reminder"
  "reminder.conf"
  "rebuild-reminder.hook"
)
sha256sums=('e489d64a239570f22b29fab3c3fbbba478816b3a1cf0a8f97e0f570bd97f118e'
            'c0338be975d092e5590fcbabd16805828a6d238b78f1a04047c3317e84eb80d4'
            '6e6e8973160ffd1f02a41549ec1f570c32ec8c9b4ae08f9c0862d0e33aa65636'
            '72a8f214c4982110feeb778bf5f915436aa47ff071d301078e6a9459e06a0b13')

prepare() {
  sed \
    --in-place \
    -e "7,/###/{
      s/declare -r pkgname=.*/declare -r pkgname=$pkgname/
      s/declare -r pkgver=.*/declare -r pkgver=$pkgver/
      s/declare -r pkgrel=.*/declare -r pkgrel=$pkgrel/
    }" \
    "$srcdir/send-rebuild-reminder"

  sed --in-place -e "s/\$pkgname/$pkgname/" "$srcdir/rebuild-reminder.hook"
}

build() {
  local cmake_options=(
    -B build
    -W no-author
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_TESTS=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build --parallel "$(nproc)"
}

check() {
  local ctest_flags=(
    --test-dir build
    # show the stdout and stderr when the test fails
    --output-on-failure
    # execute tests in parallel
    --parallel "$(nproc)"
  )
  ctest "${ctest_flags[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm 644 "$srcdir/rebuild-reminder.hook" "$pkgdir/usr/share/libalpm/hooks/$pkgname-rebuild-reminder.hook"
  install -Dm 755 "$srcdir/send-rebuild-reminder" -t "$pkgdir/usr/share/libalpm/scripts/"
  install -Dm 644 "$srcdir/reminder.conf" -t "$pkgdir/etc/$pkgname"
}
