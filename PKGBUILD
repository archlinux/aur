# Maintainer: Yardena Cohen <yardenack@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

libname=libpng
pkgname=$libname-apng
pkgver=1.6.37
_apngver=1.6.37
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files"
arch=('x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('zlib' 'sh')
provides=(libpng=$pkgver)
conflicts=(libpng)
validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F') # Glenn Randers-Pehrson (mozilla) <glennrp@gmail.com>
source=("https://downloads.sourceforge.net/sourceforge/$libname/$libname-$pkgver.tar.xz"
        "https://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-$_apngver-apng.patch.gz")
sha256sums=('505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca'
            '823bb2d1f09dc7dae4f91ff56d6c22b4b533e912cbd6c64e8762255e411100b6')

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
