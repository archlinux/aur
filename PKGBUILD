# Maintainer: Sam Mulvey <archlinux at sammulvey.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ganjolinux aka Basalari David <ganjolinux@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=darkice
pkgver=1.2
pkgrel=1
pkgdesc="Live audio streamer. Reads from audio interface, encodes, sends to streaming server."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://code.google.com/p/darkice/"
license=('GPL')
depends=('lame' 'libpulse' 'faac' 'jack' 'twolame' 'opus' 'libsamplerate')
source=("http://darkice.googlecode.com/files/${pkgname}-${pkgver}.tar.gz"
	'service')
md5sums=('de541ea95a73a50f2f5e700434c22329'
         '1c1cde0a5c03a2190a48275c03016eb8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-aacplus \
			  --with-opus \
			  --with-samplerate
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # daemon
  install -Dm755 "$srcdir/service" "$pkgdir/usr/lib/systemd/system/darkice@.service"

  mkdir -p "$pkgdir/etc/darkice"
  mv "$pkgdir/etc/darkice.cfg" "$pkgdir/etc/darkice/darkice.cfg"
}
