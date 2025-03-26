# Maintainer:

_pkgname="evdi"
pkgname="$_pkgname-dkms"
pkgver=1.14.9
pkgrel=1
pkgdesc="Kernel module to enable management of multiple screens"
url="https://github.com/DisplayLink/evdi"
license=('GPL-2.0-only')
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
sha256sums=('e314fd36918be4ae1b82ad2a5c6719137643e0a24b9ca40c2df705a26546f8c2')

build() {
  cd "$_pkgsrc/library"
  make
}

package() {
  cd "$_pkgsrc"
  make -C 'library' install DESTDIR="$pkgdir" PREFIX='/usr'

  # module for dkms
  install -dm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp --reflink=auto -a module/* "$pkgdir/usr/src/$_pkgname-$pkgver/"
}
