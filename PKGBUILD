# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Travis Hegner <travis.hegner@gmail.com>

pkgname=pjproject
pkgver=2.8
pkgrel=3
pkgdesc='Open source SIP stack and media stack'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.pjsip.org/'
license=('GPL')
depends=('openssl' 'portaudio' 'speex' 'alsa-lib' 'libsamplerate' 'util-linux' 'ffmpeg' 'libsrtp' 'opus')
makedepends=('e2fsprogs' 'python')
optdepends=('alsa-lib' 'e2fsprogs' 'python')
source=("http://www.pjsip.org/release/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('503d0bd7f9f13dc1492ac9b71b761b1089851fbb608b9a13996edc3c42006f79')

build() {
  cd "$pkgname-$pkgver"
  export CXXFLAGS="$CXXFLAGS -fPIC"
  if [ "$CARCH" = "i686" ]; then
    export CXXFLAGS="$CXXFLAGS -march=i686"
    arch_opts="--disable-libwebrtc"
  fi
  export CFLAGS="$CXXFLAGS -DNDEBUG"
  ./configure --prefix=/usr --with-external-speex --with-external-srtp --with-external-pa --with-external-gsm --disable-oss --enable-shared --disable-opencore-amr --disable-v4l2 --disable-video --disable-sound ${arch_opts}
  echo "#define PJ_HAS_IPV6 1" >> "$srcdir/$pkgname-$pkgver/pjlib/include/pj/config_site.h"
  make -j1 dep
  make -j1
}

package() {
  cd "$pkgname-$pkgver"
  make -j1 DESTDIR="$pkgdir" install
  install -D -m755 pjsip-apps/bin/pjsua-*gnu "$pkgdir"/usr/bin/pjsua
}
