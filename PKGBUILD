# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
pkgname=ncbi-blast
pkgver=2.2.31
pkgrel=1
pkgdesc="finds regions of similarity between biological sequences"
arch=('i686' 'x86_64')
url="http://blast.ncbi.nlm.nih.gov/"
license=('custom')
depends=('lzo2' 'pcre' 'python')
makedepends=('cpio')
conflicts=('blast' 'blast+' 'blast+-bin' 'ncbi-blast+' 'cddlib' 'proj')
provides=('blast' 'blast+' 'blast+-bin' 'ncbi-blast+')
source=("ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$pkgver/$pkgname-$pkgver+-src.tar.gz"
        'typeinfo.patch')
md5sums=('f32bd2d2c66205c53c6981f94e1a0d54'
         '9c257a762ce4e7418e95a48723832a86')

prepare() {
  cd $srcdir/$pkgname-$pkgver+-src/c++

  patch -p1 -i $srcdir/typeinfo.patch

  sed -e '/if test "$with_mt" != "no" ; then/i compiler=GCC' \
      -i src/build-system/configure
}

build() {
  cd $srcdir/$pkgname-$pkgver+-src/c++

  ./configure \
    --prefix=/usr \
    --with-dll \
    --with-mt \
    --without-gnutls

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver+-src/c++

  make prefix=$pkgdir/usr/ install

  chmod +x $pkgdir/usr/lib/*.so

  install -d $pkgdir/usr/share/licenses/$pkgname

  echo 'public domain' > $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
