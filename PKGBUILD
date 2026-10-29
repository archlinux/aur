# Maintainer: Benjamin Valdez <b.valdez.0509+aur<at>gmail.com>
# Contributor: Bruce Zhang <zttt183525594<at>gmail.com>

# Building tests will severely increase the build time, uncomment the following line to opt-in to building tests
# _build_tests=1

pkgbase=inputactions-kwin
pkgname=(inputactions-kwin inputactions-kwin-alpm-hook)
pkgver=0.9.2.1
pkgrel=2
arch=('x86_64')
depends=(
  'yaml-cpp'
  'libyaml-cpp.so'
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
if [ -n "$_build_tests" ]; then
  checkdepends=('gtest' 'cmake')
fi
makedepends=('cmake' 'pkgconf' 'extra-cmake-modules' 'vulkan-headers')
source=(
  "$pkgbase-$pkgver.tar.gz::https://github.com/InputActions/kwin/releases/download/v$pkgver/source.tar.gz"
  "send-rebuild-reminder"
  "reminder.conf"
  "rebuild-reminder.hook"
  "0BSD.txt"
)
sha256sums=('e489d64a239570f22b29fab3c3fbbba478816b3a1cf0a8f97e0f570bd97f118e'
            'c0338be975d092e5590fcbabd16805828a6d238b78f1a04047c3317e84eb80d4'
            '6e6e8973160ffd1f02a41549ec1f570c32ec8c9b4ae08f9c0862d0e33aa65636'
            '72a8f214c4982110feeb778bf5f915436aa47ff071d301078e6a9459e06a0b13'
            '7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3')

prepare() {
  sed \
    --in-place \
    -e "7,/###/{
      s/declare -r pkgname=.*/declare -r pkgname=$pkgbase/
      s/declare -r pkgver=.*/declare -r pkgver=$pkgver/
      s/declare -r pkgrel=.*/declare -r pkgrel=$pkgrel/
    }" \
    "$srcdir/send-rebuild-reminder"

  sed --in-place -e "s/\$pkgname/$pkgbase/" "$srcdir/rebuild-reminder.hook"
}

build() {
  local cmake_options=(
    -B build
    -W no-author
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  if [ -n "$_build_tests" ]; then
    cmake_options+=(-D BUILD_TESTS=ON)
  else
    cmake_options+=(-D BUILD_TESTS=OFF)
  fi
  cmake "${cmake_options[@]}"
  cmake --build build --parallel "$(nproc)"
}

if [ -n "$_build_tests" ]; then
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
fi

package_inputactions-kwin() {
  pkgdesc="Bind keyboard, mouse, touchpad and touchscreen actions to system actions"
  url="https://inputactions.org"
  license=('GPL-3.0-or-later')
  install=$pkgbase.install
  optdepends=('inputactions-kwin-alpm-hook: to send a reminder when this package needs to be rebuild')
  provides=('inputactions')

  DESTDIR="$pkgdir" cmake --install build
}

package_inputactions-kwin-alpm-hook() {
  pkgdesc="Send a configurable reminder to rebuild inputactions-kwin (unofficial)"
  arch=('any')
  license=('0BSD')
  depends=('libnotify' 'bash')
  backup=("etc/$pkgbase/reminder.conf")

  install -Dm 644 "$srcdir/rebuild-reminder.hook" "$pkgdir/usr/share/libalpm/hooks/$pkgbase-rebuild-reminder.hook"
  install -Dm 755 "$srcdir/send-rebuild-reminder" -t "$pkgdir/usr/share/libalpm/scripts/"
  install -Dm 644 "$srcdir/reminder.conf" -t "$pkgdir/etc/$pkgbase"
  install -Dm 644 "$srcdir/0BSD.txt" "$pkgdir/usr/share/licenses/inputactions-kwin-alpm-hook/0BSD.txt"
}
