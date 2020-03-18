# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=wayland
pkgname=$_target-$_pkgname
pkgver=1.18.0
pkgrel=1
pkgdesc='A computer display server protocol (ARM64)'
arch=(x86_64)
url='https://wayland.freedesktop.org/'
license=(MIT)
depends=($_target-glibc $_target-libffi $_target-expat $_target-libxml2)
makedepends=($_target-meson $_target-libxslt doxygen xmlto)
options=(!buildflags)
source=(
  https://wayland.freedesktop.org/releases/$_pkgname-$pkgver.tar.xz{,.sig}
)
sha256sums=(
  '4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d'
  'SKIP'
)
validpgpkeys=(
  'C7223EBE4EF66513B892598911A30156E0E67611' # Bryce Harrington
  'C0066D7DB8E9AC6844D728715E54498E697F11D7' # Derek Foreman
  '34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48' # emersion <contact@emersion.fr>
)

_srcdir=$_pkgname-$pkgver

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

build() {
  cd $_srcdir

  mkdir -p build-$_target && pushd build-$_target
  $_target-meson ..
  ninja
  popd
}

package() {
  cd $_srcdir

  pushd build-$_target
  DESTDIR="$pkgdir" ninja install
  popd
}
