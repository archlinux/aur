# Maintainer: Yardena Cohen <yardenack@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

libname=libpng
pkgname=$libname-apng
pkgver=1.6.44
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
sha256sums=('60c4da1d5b7f0aa8d158da48e8f8afa9773c1c8baa5d21974df61f1886b8ce8e'
            '17d2e51f2bc93f4a22070b35fddd3655a4ec1a90ba8b7db2bffde7afc8d76dd3')

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
