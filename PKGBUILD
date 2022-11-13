# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot de>
# Contributor: Sam Mulvey <archlinux at sammulvey.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ganjolinux aka Basalari David <ganjolinux@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: B3l3tte <ouack23 at yahoo.fr>

pkgname=darkice
pkgver=1.4
pkgrel=3
pkgdesc='Reads live audio from backends, encodes it and streams it to a server'
arch=(aarch64 armv6h armv7h x86_64)
url='http://www.darkice.org/'
license=(GPL3)
depends=(gcc-libs)
makedepends=(alsa-lib faac flac jack lame libpulse libsamplerate libvorbis twolame opus)
source=("https://github.com/rafael2k/darkice/releases/download/v${pkgver}/$pkgname-$pkgver.tar.gz"
        'darkice@.service')
sha256sums=('e6a8ec2b447cf5b4ffaf9b62700502b6bdacebf00b476f4e9bf9f9fe1e3dd817'
            '7c65f92c885ed7e141d3289fd8e108dc3d7c19d5c4b3f948e7ce3ad6c653cd12')


build() {
  cd $pkgname-$pkgver

  export CXXFLAGS="$CXXFLAGS -std=c++11"
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
  depends+=(libmp3lame.so libogg.so libvorbis.so libvorbisenc.so libopus.so
            libfaac.so libtwolame.so libasound.so libpulse-simple.so
            libpulse.so libjack.so libsamplerate.so)
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  # systemd service
  install -Dm644 "$srcdir"/darkice@.service -t "$pkgdir"/usr/lib/systemd/user
}
