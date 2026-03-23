# Maintainer: Benjamin Valdez <b.valdez.0509+aur<at>gmail.com>
# Contributor: Bruce Zhang <zttt183525594<at>gmail.com>
pkgname=inputactions-kwin
pkgver=0.9.0.0
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
  "inputactions-ctl=$pkgver"
)
optdepends=('libnotify: to send a reminder when this package needs to be rebuild')
checkdepends=('gtest' 'cmake')
makedepends=('cmake' 'pkgconf' 'extra-cmake-modules' 'git')
provides=('inputactions')
source=(
  "$pkgname-$pkgver.src.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "inputactions-core::git+https://github.com/InputActions/core.git#commit=bc0add8a6e28049570e7cdb6dec94d1597d1c6fe"
  "inputactions-libevdev-cpp::git+https://github.com/InputActions/libevdev-cpp.git#commit=4707a9eab86a686e0c793d0d9510d5d1ac8cb5e1"
  "send-rebuild-reminder"
  "reminder.conf"
  "rebuild-reminder.hook"
)
sha256sums=('aae03398e10708ba08a1610c8ec265dea393fa54a7e5e24474c67ccf177d94e1'
            '6de273d09e7dfddaea0abfc880b80eedda9cdd8c79252c87ce0db5b32f153923'
            'ac267fdcadc34048693785e61c97e3fb3d0665261c09db3d8cca66ea4d6875bc'
            '3ae59b5bea1a0100cc8da51c6a810d70bc989462f2f84beaf6a4f9a06395f62f'
            '57a1e6c7c230c9149e85db13c5dc9f76a4e49c643a03f299750ddc977b36548a'
            '72a8f214c4982110feeb778bf5f915436aa47ff071d301078e6a9459e06a0b13')

prepare() {
  cd $srcdir/kwin-$pkgver/lib
  rmdir core
  ln --symbolic $srcdir/inputactions-core core

  cd $srcdir/inputactions-core/lib
  rmdir libevdev-cpp
  ln --symbolic $srcdir/inputactions-libevdev-cpp libevdev-cpp

  sed \
    --in-place \
    -e "2,/###/{
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
    -S "kwin-$pkgver"
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
