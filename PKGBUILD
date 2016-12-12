# Maintainer: Sam Mulvey <archlinux at sammulvey.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ganjolinux aka Basalari David <ganjolinux@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: B3l3tte <ouack23 at yahoo.fr>

pkgname=darkice
pkgver=1.3
pkgrel=2
pkgdesc="Live audio streamer. Reads from audio interface, encodes, sends to streaming server."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.darkice.org/"
license=('GPL')
depends=('lame' 'libpulse' 'faac' 'libaacplus' 'jack' 'twolame' 'opus' 'libsamplerate' 'fftw')
source=('darkice::git+https://github.com/Ouack23/darkice.git#branch=master'  'service')
md5sums=('SKIP' '1c1cde0a5c03a2190a48275c03016eb8')

build() {

  cd "$srcdir/$pkgname/$pkgname/trunk"

  ./autogen.sh

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --with-aacplus \
	      --with-opus \
	      --with-samplerate
  make
}

package() {
  cd "$srcdir/$pkgname/$pkgname/trunk"

  make DESTDIR="$pkgdir/" install

  # daemon
  install -Dm755 "$srcdir/service" "$pkgdir/usr/lib/systemd/system/darkice@.service"

  mkdir -p "$pkgdir/etc/darkice"
  mv "$pkgdir/etc/darkice.cfg" "$pkgdir/etc/darkice/darkice.cfg"
}
