# Maintainer:

_pkgname="evdi"
pkgname="$_pkgname-dkms-git"
pkgver=1.14.8.r1.g2da2704
pkgrel=1
pkgdesc="Kernel module to enable management of multiple screens"
url="https://github.com/DisplayLink/evdi"
license=('GPL-2.0-only')
arch=('i686' 'x86_64' 'aarch64')

depends=(
  'dkms'
)
makedepends=(
  'git'
  'libdrm'
)

provides=(
  "$_pkgname=${pkgver%%.r*}"
  "$_pkgname-dkms=${pkgver%%.r*}"
)
conflicts=(
  "$_pkgname"
  "$_pkgname-dkms"
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*-*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

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
