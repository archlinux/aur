# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=meterbridge
pkgver=0.9.2
pkgrel=1
pkgdesc="Collection of Audio meters for the JACK audio server"
arch=('i686' 'x86_64')
url="http://plugin.org.uk/meterbridge/"
license=('GPL')
depends=('jack' 'sdl_image')
source=("http://plugin.org.uk/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ef5d20761755c88e5b5a0c35f11f670e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # gcc 4.x fix
  sed -i "s/ buf_rect.*,//" src/main.h

  # iec scale fix
  # http://lists.linuxaudio.org/pipermail/linux-audio-dev/2012-June/032475.html
  sed -i 's/ 5.0/ 2.5/' src/dpm_meters.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  aclocal && automake -a && autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
