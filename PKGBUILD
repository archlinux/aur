# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=skalibs-static
pkgver=2.14.5.1
pkgrel=1
pkgdesc="A set of general-purpose C programming libraries"
arch=('aarch64' 'i686' 'x86_64')
url="http://www.skarnet.org/software/skalibs"
license=('custom:ISC')
makedepends=(musl gcc make gzip)
provides=(skalibs=${pkgver})
replaces=(skalibs-musl)
options=('staticlibs' '!lto')
source=(${url}/skalibs-$pkgver.tar.gz)
sha256sums=('fa359c70439b480400a0a2ef68026a2736b315025a9d95df69d34601fb938f0f')
build() {
  cd skalibs-$pkgver
  export CC="musl-gcc"
  ./configure \
    --prefix=/usr \
    --disable-shared \
    --includedir=/usr/include/${pkgname} \
    --libdir=/usr/lib/${pkgname} \
    --pkgconfdir=/usr/lib/${pkgname}/pkgconfig \
    --sysdepdir=/usr/lib/${pkgname}/sysdeps
  make -j $(nproc)
}
package() {
  cd skalibs-$pkgver
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
