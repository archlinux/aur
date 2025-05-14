# Maintainer:

_pkgname="evdi"
pkgname="$_pkgname-dkms"
pkgver=1.14.10
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
sha256sums=('9fc0165d02e88507135d6a67ccaa06f7b5cd651e375394a1674d5ea4ec7a00aa')

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
