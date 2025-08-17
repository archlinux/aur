# Maintainer:

_pkgname="evdi"
pkgname="$_pkgname-dkms-git"
pkgver=1.14.10.r2.g3673a4b
pkgrel=2
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

prepare() {
  sed -E -e '/^CLEAN=/d' -i "$_pkgsrc/module/dkms.conf"
}

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
  mkdir -pm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -a module/* "$pkgdir/usr/src/$_pkgname-$pkgver/"
}
