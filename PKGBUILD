# Maintainer: Benjamin Valdez <b.valdez.0509+aur<at>gmail.com>
# Contributor: Bruce Zhang <zttt183525594<at>gmail.com>
pkgname=inputactions-kwin
pkgver=0.7.0
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
sha256sums=('d96936b6ee8bceefe5e15e3af5034d9291177513ca6edbf0dcdb00591ba5c5d1'
            '4bf8bc322e5be1a8f2e50d9e47490b7a8b30e0bd754cb79f3ab1f5960b081f63'
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
  cmake --build build
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
