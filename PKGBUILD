# Maintainer: endorfina <emilia@carcosa.space>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: mwawrzyniak <arch at cmstactical dot net>
# Contributor: PlusMinus

pkgname=evdi
pkgver=1.14.7
pkgrel=1
pkgdesc="A Linux® kernel module that enables management of multiple screens."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/DisplayLink/evdi"
license=('GPL')
depends=(glibc dkms libdrm base-devel)
changelog=$pkgname.Changelog
source=(https://github.com/DisplayLink/evdi/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('98bf2d54dc6e8e5712195b5dffddd1674d7cf15b149e06cc0840b74c44f1aabc')

build() {
  # We only need to build the library in this step, dkms will build the module
  cd "$pkgname-$pkgver/library"
  make
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 library/lib$pkgname.so "$pkgdir/usr/lib/lib$pkgname.so"

  SRCDIR="$pkgdir/usr/src/$pkgname-$pkgver"	# This one is needed for dkms
  install -d "$SRCDIR"
  find module -maxdepth 1 -type f -exec install -m0644 '{}' "$SRCDIR" \;

  install -d "$SRCDIR/tests"
  find module/tests -maxdepth 1 -type f -exec install -m0644 '{}' "$SRCDIR/tests" \;
}
