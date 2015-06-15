# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=libfiu
pkgver=0.93
pkgrel=1
pkgdesc="userspace fault injection framework"
arch=('i686' 'x86_64')
url="https://blitiri.com.ar/p/libfiu/"
license=('custom')
depends=()
makedepends=('make' 'gcc' 'python2')
source=("https://blitiri.com.ar/p/$pkgname/files/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
md5sums=('8d8126a05a0fd7e833544c6a73deb256'
         '91b295e1fbf4bd0a2bf73bb97a6ed91b')
install=$pkgname-$pkgver.install

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -p1 < $startdir/$pkgname-$pkgver.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver

  make PREFIX=$pkgdir/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make PREFIX=$pkgdir/usr install

  # Fix paths
  sed -e "s|${pkgdir}||g" \
    -i $pkgdir/usr/lib/pkgconfig/libfiu.pc \
    -i $pkgdir/usr/bin/fiu-run

  # Install LICENSE
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
