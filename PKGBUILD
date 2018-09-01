# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Travis Hegner <travis.hegner@gmail.com>

pkgname=pjproject
pkgver=2.7.2
pkgrel=1
pkgdesc='Open source SIP stack and media stack'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.pjsip.org/'
license=('GPL')
depends=('openssl' 'portaudio' 'speex' 'alsa-lib' 'libsamplerate' 'util-linux' 'ffmpeg' 'libsrtp' 'opus')
makedepends=('e2fsprogs' 'python')
optdepends=('alsa-lib' 'e2fsprogs' 'python')
source=("http://www.pjsip.org/release/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('9c2c828abab7626edf18e04b041ef274bfaa86f99adf2c25ff56f1509e813772')

build() {
  cd "$pkgname-$pkgver"
  export CXXFLAGS="$CXXFLAGS -fPIC -march=native"
  export CFLAGS="$CXXFLAGS -DNDEBUG"
  ./configure --prefix=/usr --with-external-speex --with-external-srtp --with-external-pa --with-external-gsm --disable-oss --enable-shared --disable-opencore-amr --disable-v4l2 --disable-video --disable-sound
  echo "#define PJ_HAS_IPV6 1" >> "$srcdir/$pkgname-$pkgver/pjlib/include/pj/config_site.h"
  make -j1 dep
  make -j1
}

package() {
  cd "$pkgname-$pkgver"
  make -j1 DESTDIR="$pkgdir" install
  install -D -m755 pjsip-apps/bin/pjsua-*gnu "$pkgdir"/usr/bin/pjsua
}
