# Maintainer: endorfina <emilia@carcosa.space>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: mwawrzyniak <arch at cmstactical dot net>
# Contributor: PlusMinus

pkgname=evdi
pkgver=1.14.5
pkgrel=0
pkgdesc="A Linux® kernel module that enables management of multiple screens."
arch=('i686' 'x86_64')
url="https://github.com/DisplayLink/evdi"
license=('GPL')
depends=(glibc dkms libdrm base-devel)
changelog=$pkgname.Changelog
source=(https://github.com/DisplayLink/evdi/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('ad7d8e3c75f3c978b4f48cef3263a1d0c051317cc2875c1ff71250d03e159c54')

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
}
