# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=allpathslg
pkgver=51875
pkgrel=1
pkgdesc='short read genome assembler'
arch=('i686' 'x86_64')
url='http://www.broadinstitute.org/software/allpaths-lg/blog/'
license=('custom')
depends=('perl')
source=("ftp://ftp.broadinstitute.org/pub/crd/ALLPATHS/Release-LG/latest_source_code/$pkgname-$pkgver.tar.gz")
md5sums=('79c6b6e634db0ae2d01fa475d55eef58')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr

  #FIXME the huge ball of 1.1G libAllPathsLG.a is just too big so strip it right away
  # the --strip-debug will reduce it to 71M
  # I couldn't compile even with 8G tmpfs at /tmp
  pushd src
  make libAllPathsLG.a
  strip --strip-debug libAllPathsLG.a
  popd

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
