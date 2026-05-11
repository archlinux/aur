# Maintainer: Benjamin Valdez <b.valdez.0509+aur<at>gmail.com>
# Contributor: Bruce Zhang <zttt183525594<at>gmail.com>
pkgname=inputactions-kwin
pkgver=0.9.1.0
pkgrel=1
pkgdesc="Mouse and touchpad gestures for Plasma 6 Wayland"
arch=('x86_64')
url="https://github.com/InputActions/kwin"
license=('GPL-3.0-or-later')
install=$pkgname.install
backup=("etc/$pkgname/reminder.conf")
depends=(
  'yaml-cpp'
  'bash'
  'libgcc'
  'libstdc++'
  'qt6-base'
  'glibc'
  'libevdev'
  'kwin'
  'kcmutils'
  'kcoreaddons'
  'ki18n'
  'inputactions-ctl'
)
optdepends=('libnotify: to send a reminder when this package needs to be rebuild')
checkdepends=('gtest' 'cmake')
makedepends=('cmake' 'pkgconf' 'extra-cmake-modules' 'git')
provides=('inputactions')
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/source.tar.gz"
  "send-rebuild-reminder"
  "reminder.conf"
  "rebuild-reminder.hook"
)
sha256sums=('68c6731d7bf057195e139f1f823ac8e708b431810d57729af11b3c8ca1040d13'
            '3ae59b5bea1a0100cc8da51c6a810d70bc989462f2f84beaf6a4f9a06395f62f'
            '57a1e6c7c230c9149e85db13c5dc9f76a4e49c643a03f299750ddc977b36548a'
            '72a8f214c4982110feeb778bf5f915436aa47ff071d301078e6a9459e06a0b13')

build() {
  local cmake_options=(
    -B build
    -W no-dev
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
