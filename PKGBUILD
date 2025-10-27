# Maintainer: Benjamin Valdez <b.valdez.0509+aur<at>gmail.com>
# Contributor: Bruce Zhang <zttt183525594<at>gmail.com>
pkgname=inputactions-kwin
pkgver=0.8.3
pkgrel=2
pkgdesc="Mouse and touchpad gestures for Plasma 6 Wayland"
arch=('x86_64')
url="https://github.com/taj-ny/InputActions"
license=('GPL-3.0-or-later')
install=$pkgname.install
backup=("etc/$pkgname/reminder.conf")
depends=('yaml-cpp' 'gcc-libs' 'qt6-base' 'glibc' 'libevdev' 'kwin' 'kcmutils' 'kcoreaddons' 'ki18n')
optdepends=('libnotify: to send a reminder when this package needs to be rebuild')
checkdepends=('gtest' 'cmake')
makedepends=('cmake' 'pkgconf' 'extra-cmake-modules')
provides=('inputactions')
source=(
  "$pkgname-$pkgver.src.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "send-rebuild-reminder"
  "reminder.conf"
  "rebuild-reminder.hook"
)
sha256sums=('d73d72ef6c862b12bcd7a33d278d7ee15bca7b2ea3c19ab62ea7b95579708e4c'
            '3ae59b5bea1a0100cc8da51c6a810d70bc989462f2f84beaf6a4f9a06395f62f'
            '57a1e6c7c230c9149e85db13c5dc9f76a4e49c643a03f299750ddc977b36548a'
            '72a8f214c4982110feeb778bf5f915436aa47ff071d301078e6a9459e06a0b13')

prepare() {
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
    -S "InputActions-$pkgver"
    -W no-dev
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_TESTS=ON
    -D INPUTACTIONS_BUILD_KWIN=ON
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
