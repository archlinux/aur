# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=esound
pkgver=0.2.41
pkgrel=4
pkgdesc="Enlightened Sound Daemon"
arch=('i686' 'x86_64')
url="http://www.tux.org/~ricdude/EsounD.html"
license=('LGPL')
depends=('audiofile')
provides=("esd=$pkgver")
conflicts=('esd')
backup=('etc/esd.conf')
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2"
        esound.service)
md5sums=('8d9aad3d94d15e0d59ba9dc0ea990c6c'
         'c3f08e2930bcc9dd0fa4142b98413832')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # alsa drain fix
  sed -i 's/drain/drop/' audio_alsa09.c

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-static \
              --with-audiofile \
              --without-libwrap \
              --enable-alsa \
              --disable-artstest
  make CFLAGS="$CFLAGS -lm"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # daemon
  install -Dm644 ../esound.service "$pkgdir/usr/lib/systemd/system/esound.service"
}
