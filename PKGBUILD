# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot de>
# Contributor: Sam Mulvey <archlinux at sammulvey.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ganjolinux aka Basalari David <ganjolinux@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: B3l3tte <ouack23 at yahoo.fr>

pkgname=darkice
pkgver=1.6
pkgrel=1
pkgdesc='Reads live audio from backends, encodes it and streams it to a server'
arch=(aarch64 armv6h armv7h x86_64)
url='http://www.darkice.org/'
license=(GPL-3.0-or-later)
depends=(gcc-libs glibc)
makedepends=(alsa-lib faac flac jack lame libfdk-aac libpulse libsamplerate libvorbis twolame opus)
source=("$pkgname-$pkgver.tar.gz::https://github.com/rafael2k/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        'darkice@.service')
sha256sums=('52807d887d60646776110b63543d3845ebe9ed52d3eea44bed7c4bdd95b6575e'
            '7c65f92c885ed7e141d3289fd8e108dc3d7c19d5c4b3f948e7ce3ad6c653cd12')

build() {
  cd $pkgname-$pkgver/darkice/trunk

  export CXXFLAGS="$CXXFLAGS -std=c++11"
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-alsa \
    --with-faac \
    --with-fdkaac \
    --with-jack \
    --with-lame \
    --with-opus \
    --with-twolame \
    --with-pulseaudio \
    --with-samplerate \
    --with-vorbis
  make
}

package() {
  depends+=(libasound.so libfaac.so libfdk-aac.so libFLAC.so libjack.so
            libmp3lame.so libogg.so libopus.so libpulse-simple.so libpulse.so
            libsamplerate.so libtwolame.so libvorbis.so libvorbisenc.so)
  cd $pkgname-$pkgver/darkice/trunk
  make DESTDIR="$pkgdir" install
  # systemd service
  install -Dm644 "$srcdir"/darkice@.service -t "$pkgdir"/usr/lib/systemd/user
}
