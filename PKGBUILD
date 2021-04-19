# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=lib32-libfiu
_pkgname=libfiu
pkgver=1.00
pkgrel=1
pkgdesc="userspace fault injection framework"
arch=('x86_64')
url="https://blitiri.com.ar/p/libfiu/"
license=('custom')
depends=('libfiu')
makedepends=('make' 'gcc')
source=("https://blitiri.com.ar/p/$_pkgname/files/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('0d9141d793154bb258be5eba0bba2303ee26d5abd92c3ee9baae7a6e03fdf3d3')

build() {
  cd $srcdir/$_pkgname-$pkgver

  CFLAGS=-m32 LDFLAGS=-m32 \
  make PREFIX=$pkgdir/usr
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  CFLAGS=-m32 LDFLAGS=-m32 \
  make PREFIX=${pkgdir}/usr install

  # Fix paths
  sed -e "s|${pkgdir}||g" -e "s|libdir\(.*\)lib|libdir\1lib32|g" \
    -i $pkgdir/usr/lib/pkgconfig/libfiu.pc
  mv $pkgdir/usr/lib $pkgdir/usr/lib32

  # Cleanup (satisfied by libfiu)
  rm -r $pkgdir/usr/bin
  rm -r $pkgdir/usr/include

  # Install LICENSE
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
