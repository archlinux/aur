# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>

pkgname=umr-git
epoch=1
pkgver=1.0.11.r261.g8797dc7
pkgrel=1
pkgdesc='User Mode Register Debugger for AMDGPU Hardware'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/tomstdenis/umr.git'
license=('MIT')
depends=('libpciaccess' 'ncurses' 'llvm-libs')
makedepends=('git' 'cmake' 'llvm' 'libdrm')
provides=('umr')
conflicts=('umr')
source=('git+https://gitlab.freedesktop.org/tomstdenis/umr.git')
sha256sums=('SKIP')
#options=(debug "!strip")

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_args=(
    -B build -S umr
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DCMAKE_BUILD_TYPE=Release
    -DUMR_NO_GUI=ON
  )

  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Since there is (currently) no stable API/ABI, remove any headers and
  # (static) libraries. Will be happy to drop this, once things stabilise.

  # These were hidden behind a switch, although somewhat recent development
  # broke that. As of a few weeks ago upstream has removed their CI, so one
  # cannot even wire a simple check to catch such issues.
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/lib"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 umr/LICENSE
}
