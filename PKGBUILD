# Maintainer: stickynotememo <samk26633@gmail.com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Yardena Cohen <yardenack@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

libname=libpng
pkgname=$libname-apng
pkgver=1.6.58
_apngver=$pkgver
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files"
arch=('x86_64')
url="https://sourceforge.net/projects/libpng-apng/"
license=('custom')
depends=('zlib' 'sh')
provides=(libpng=$pkgver libpng16.so)
conflicts=(libpng)
validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F') # Glenn Randers-Pehrson (mozilla) <glennrp@gmail.com>
source=("https://downloads.sourceforge.net/sourceforge/$libname/$libname-$pkgver.tar.xz"
        "https://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-$_apngver-apng.patch.gz")
sha256sums=('f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18'
            '9ce32d4a2763a2ac5f258726ba2f49e9011327c1ee8c30862a32d0f30889fbe8')

prepare() {
  cd $libname-$pkgver

  # Add animated PNG (apng) support. Required by Firefox
  # see http://sourceforge.net/projects/libpng-apng/
  gzip -cd ../libpng-$_apngver-apng.patch.gz | patch -Np1
}

build() {
  cd $libname-$pkgver

  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

check() {
  cd $libname-$pkgver

  make check
}

package() {
  cd $libname-$pkgver

  make DESTDIR="$pkgdir" install

  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$libname/LICENSE"

  cd contrib/pngminus
  make PNGLIB_SHARED="-L$pkgdir/usr/lib -lpng" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" png2pnm pnm2png
  install -m0755 png2pnm pnm2png "$pkgdir/usr/bin/"
}
sha256sums=('28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775'
            'eee7dea22ed502868017971c86c63c4ed1e6085de0baebfdcc3d3322f00f3eb0')
