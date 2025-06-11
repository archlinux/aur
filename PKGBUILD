# Maintainer:

: ${_distributor=}

_pkgname="quickshell"
pkgname="$_pkgname-git"
pkgver=r571.2b01a75
pkgrel=2
pkgdesc="Simple and flexbile QtQuick based desktop shell toolkit"
url='https://git.outfoxxed.me/quickshell/quickshell'
license=('LGPL-3.0-only')
arch=('x86_64' 'aarch64')

depends=(
  'jemalloc'
  'libdrm'
  'libglvnd'
  'libpipewire'
  'libxcb'
  'mesa'
  'pam'
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-wayland'
  'wayland'
)
makedepends=(
  'cli11'
  'cmake'
  'git'
  'ninja'
  'wayland-protocols'
)
checkdepends=(
  'kwin'
  'wlheadless-run' # aur/xwayland-run
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCRASH_REPORTER=OFF
    -DDISTRIBUTOR="${_distributor:-aur/$pkgname}"
    -DDISTRIBUTOR_DEBUGINFO_AVAILABLE=NO
    -DINSTALL_QML_PREFIX=lib/qt6/qml
    -DBUILD_TESTING=$CHECKFUNC
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  local _headless_run=(
    wlheadless-run
    -c kwin --width=1920 --height=1080
  )

  env "${_headless_run[@]}" -- ctest --test-dir build --rerun-failed --output-on-failure || :
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
