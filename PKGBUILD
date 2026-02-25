# Maintainer:

_pkgname="evdi"
pkgname="$_pkgname-dkms"
pkgver=1.14.15
pkgrel=1
pkgdesc="Kernel module to enable management of multiple screens"
url="https://github.com/DisplayLink/evdi"
license=(
  'GPL-2.0-only'  # module
  'LGPL-2.1-only' # library
  'MIT'           # pyevdi
)
arch=('i686' 'x86_64' 'aarch64')

depends=(
  'dkms'
)
makedepends=(
  'libdrm'
  'pybind11'
  'python-setuptools'
)
optdepends=(
  'python: for pyevdi'
)

provides=("$_pkgname=$pkgver")
conflicts=(
  "$_pkgname"
  'python-pyevdi'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('3f2f602cf8c3944e5b5f62e2649601185b3c3abac70f6f8941c2449a642f3bff')

prepare() {
  sed -E -e '/^CLEAN=/d' -i "$_pkgsrc/module/dkms.conf"
}

build() {
  cd "$_pkgsrc"

  echo "Building library..."
  (cd "library" && make)

  echo "Building pyevdi..."
  (cd "pyevdi" && make)
}

package() {
  cd "$_pkgsrc"

  # library
  make -C 'library' install DESTDIR="$pkgdir" PREFIX='/usr'
  install -Dm644 'library/evdi_lib.h' -t "$pkgdir/usr/include/"

  # pyevdi
  make -C 'pyevdi' install DESTDIR="$pkgdir" PREFIX='/usr'

  # dkms module
  mkdir -pm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -a module/* "$pkgdir/usr/src/$_pkgname-$pkgver/"

  # licenses
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 'library/LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LGPL-2.1-only"
  install -Dm644 'module/LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPL-2.0-only"
}
