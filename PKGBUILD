# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=lib32-libfiu
_pkgname=libfiu
pkgver=0.93
pkgrel=1
pkgdesc="userspace fault injection framework"
arch=('x86_64')
url="https://blitiri.com.ar/p/libfiu/"
license=('custom')
depends=('libfiu')
makedepends=('make' 'gcc')
source=("https://blitiri.com.ar/p/$_pkgname/files/$pkgver/$_pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
md5sums=('8d8126a05a0fd7e833544c6a73deb256'
         '91b295e1fbf4bd0a2bf73bb97a6ed91b')
install=$pkgname-$pkgver.install

prepare() {
  cd $srcdir/$_pkgname-$pkgver

  patch -p1 < $startdir/$pkgname-$pkgver.patch
}

build() {
  cd $srcdir/$_pkgname-$pkgver

  CFLAGS=-m32 LDFLAGS=-m32 \
  make PREFIX=$pkgdir/usr
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  CFLAGS=-m32 LDFLAGS=-m32 \
  make PREFIX=$pkgdir/usr libfiu_install

  # Fix paths
  sed -e "s|${pkgdir}||g" -e "s|libdir\(.*\)lib|libdir\1lib32|g" -i $pkgdir/usr/lib/pkgconfig/libfiu.pc
  mv $pkgdir/usr/lib $pkgdir/usr/lib32

  # Cleanup
  rm -r $pkgdir/usr/include
  rm -r $pkgdir/usr/share/man

  # Install LICENSE
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
