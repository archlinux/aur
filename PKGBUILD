# Maintainer: Yardena Cohen <yardenack@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

libname=libpng
pkgname=$libname-apng
pkgver=1.6.50
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
sha256sums=('4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307'
            '687ddc0c7cb128a3ea58e159b5129252537c27ede0c32a93f11f03127f0c0165')

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
