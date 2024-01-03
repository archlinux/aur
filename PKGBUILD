# Maintainer: Maxwell Pray <synthead@gmail.com>

_pkgname=fzfs
pkgname=$_pkgname-git
pkgver=r20.5d756b5
pkgrel=1
pkgdesc="Flipper Zero filesystem driver"
arch=(any)
url="https://github.com/dakhnod/fzfs"
license=(unknown)
source=(
  "git+https://github.com/dakhnod/fzfs.git"
  make-fzfs.py-executable.patch
)
depends=(python-async-timeout python-bleak python-dbus-fast python-fusepy python-numpy python-protobuf python-pyserial)
makedepends=(git python)
provides=(fzfs)
sha256sums=(
  'SKIP'
  '3149c87a528a5caac36e90e953c4c7aba5d69019128cf9b00f350d5a9e4cf16f'
)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git submodule update
}

package() {
  mkdir -p "$pkgdir/usr/share/$_pkgname/flipperzero_protobuf_py"

  cd "$srcdir/$_pkgname"
  cp flipper_api.py flipper_fs.py flipper_serial.py fzfs.py serial_ble.py "$pkgdir/usr/share/$_pkgname"

  patch -d "$pkgdir/usr/share/$_pkgname" -p1 < "$srcdir/make-fzfs.py-executable.patch"

  cd "$srcdir/$_pkgname/flipperzero_protobuf_py"
  cp -r cli_helpers.py flipper_protobuf.py __init__.py flipperzero_protobuf_compiled "$pkgdir/usr/share/$_pkgname/flipperzero_protobuf_py"

  mkdir -p "$pkgdir/usr/bin"
  ln -s /usr/share/fzfs/fzfs.py "$pkgdir/usr/bin/fzfs"
}
