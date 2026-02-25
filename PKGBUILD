# Maintainer:

_pkgname="evdi"
pkgname="$_pkgname-dkms-git"
pkgver=1.14.15.r0.g3dafd62
pkgrel=2
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
  'git'
  'libdrm'
  'pybind11'
  'python-setuptools'
)
optdepends=(
  'python: for pyevdi'
)

provides=(
  "$_pkgname=${pkgver%%.g*}"
  "$_pkgname-dkms=${pkgver%%.g*}"
)
conflicts=(
  "$_pkgname"
  "$_pkgname-dkms"
  'python-pyevdi'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  sed -E -e '/^CLEAN=/d' -i "$_pkgsrc/module/dkms.conf"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*-*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
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
