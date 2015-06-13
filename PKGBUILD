# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
pkgname=ncbi-blast
pkgver=2.2.30
pkgrel=2
pkgdesc="finds regions of similarity between biological sequences"
arch=('i686' 'x86_64')
url="http://blast.ncbi.nlm.nih.gov/"
license=('custom')
depends=('lzo2' 'pcre' 'python')
makedepends=('cpio')
conflicts=('blast' 'blast+-bin' 'ncbi-blast+' 'cddlib' 'proj')
provides=('blast' 'blast+-bin' 'ncbi-blast+')
source=("ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$pkgver/$pkgname-$pkgver+-src.tar.gz"
        'typeinfo.patch')
md5sums=('f8e9a5eb368173142fe6867208b73715'
         '9c257a762ce4e7418e95a48723832a86')

prepare() {
  cd $srcdir/$pkgname-$pkgver+-src/c++

  patch -p1 -i $srcdir/typeinfo.patch
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
