# Maintainer:

_pkgname="evdi"
pkgname="$_pkgname-dkms"
pkgver=1.14.14
pkgrel=1
pkgdesc="Kernel module to enable management of multiple screens"
url="https://github.com/DisplayLink/evdi"
license=(
  'GPL-2.0-only'  # module
  'LGPL-2.1-only' # library
)
arch=('i686' 'x86_64' 'aarch64')

depends=(
  'dkms'
)
makedepends=(
  'libdrm'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('3258fafcd491771d0a66d3b35f628637d65767ef2908dbbcef5d506d22df369e')

prepare() {
  sed -E -e '/^CLEAN=/d' -i "$_pkgsrc/module/dkms.conf"
}

build() {
  cd "$_pkgsrc/library"
  make
}

package() {
  cd "$_pkgsrc"

  # library
  make -C 'library' install DESTDIR="$pkgdir" PREFIX='/usr'
  install -Dm644 'library/evdi_lib.h' -t "$pkgdir/usr/include/"

  # dkms module
  mkdir -pm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -a module/* "$pkgdir/usr/src/$_pkgname-$pkgver/"
}
