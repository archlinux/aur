# Maintainer: James An <james@jamesan.ca>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=db6.2
_pkgname=${pkgname%[0-9]*\.[0-9]*}
pkgver=6.2.32
_pkgver=${pkgver%\.[0-9]*}
pkgrel=1
pkgdesc="The Berkeley DB embedded database system $_pkgver"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/database/database-technologies/berkeleydb"
license=('custom')
depends=('gcc-libs' 'sh')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname"{,4.{5,6,8},5.2})
source=("http://download.oracle.com/berkeley-$_pkgname/$_pkgname-${pkgver}.tar.gz")
md5sums=('33491b4756cb44b91c3318b727e71023')

build() {
  cd "$_pkgname-$pkgver/build_unix"
  ../dist/configure --prefix=/usr --enable-compat185 \
    --enable-shared --enable-cxx --enable-dbm \
    --enable-stl
  make LIBSO_LIBS=-lpthread
}

package() {
  cd "$_pkgname-$pkgver/build_unix"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/docs"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
