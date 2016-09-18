# Maintainer:  Raansu <Gero3977@gmail.com>
# Contributor: David Strobach <lalochcz@gmail.com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=db5.1
pkgver=5.1.29
pkgrel=1
pkgdesc="The Berkeley DB embedded database system 5.1"
arch=('any')
license=('custom')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
depends=('gcc-libs')
options=('!libtool')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz)
md5sums=('a94ea755ab695bc04f82b94d2e24a1ef')
sha256sums=('a943cb4920e62df71de1069ddca486d408f6d7a09ddbbb5637afe7a229389182')

build() {
  cd "$srcdir/db-$pkgver/build_unix"
  ../dist/configure --prefix=/usr --enable-compat185 --enable-shared --enable-static --enable-cxx
  make LIBSO_LIBS=-lpthread || return 1
}

package() {  
  cd "$srcdir/db-$pkgver/build_unix"
  make prefix="$pkgdir/usr" includedir="$pkgdir/usr/include/db5.1" install

# Remove documents to save space, these can be found online if needed.
  rm -rf "$pkgdir/usr/docs"

# Remove conflicting symlinks created by make, should never overwrite 
# main libdb symlinks to current version. Programs that need or use 
# db5.1 should be able to find it.
  rm -f ${pkgdir}/usr/lib/libdb{,_cxx}.{a,so}
  rm -f ${pkgdir}/usr/lib/libdb{,_cxx}-5.{a,so}

# Rename db5.1 bin files to not conflict with current db version 
# installed. Programs that need or use db5.1 should be aware of this 
# name change. 
  cd "${pkgdir}/usr/bin"
  for i in *; do
    mv $i db5.1_${i/db_/}
  done

# Install license.
  install -Dm644 "$srcdir/db-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}