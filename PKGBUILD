# Maintainer: Sam Mulvey <archlinux at sammulvey.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ganjolinux aka Basalari David <ganjolinux@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: B3l3tte <ouack23 at yahoo.fr>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot de>

pkgname=darkice
pkgver=1.4
pkgrel=1
pkgdesc="Live audio streamer. Reads from audio interface, encodes, sends to streaming server."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.darkice.org/"
license=('GPL')
depends=('lame' 'libpulse' 'faac' 'jack' 'twolame' 'opus' 'libsamplerate' 'fftw')
source=("https://github.com/rafael2k/darkice/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'service')
sha256sums=('e6a8ec2b447cf5b4ffaf9b62700502b6bdacebf00b476f4e9bf9f9fe1e3dd817'
            'c5d05b1c3c352eda9591064f041fcd502d3b0a4cfcc6319dc4ae9b6d71136e4b')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-alsa \
    --with-faac \
    --with-jack \
    --with-lame \
    --with-opus \
    --with-twolame \
    --without-aacplus \
    --with-pulseaudio \
    --with-samplerate
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  # systemd service
  install -Dm644 "$srcdir/service" "$pkgdir/usr/lib/systemd/system/darkice@.service"
  # configuration
  install -dm755 "$pkgdir/etc/darkice"
  mv "$pkgdir/etc/darkice.cfg" "$pkgdir/etc/darkice"
}
