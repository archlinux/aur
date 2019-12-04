# AUR maintainer: Swyter <swyterzone+aur@gmail.com>
# 64-bit Maintainer: Ivy Foster <code@escondida.tk>
# Reference: PKGBUILD(5)

pkgname=lib32-sndio
pkgver=1.6.0
pkgrel=1
pkgdesc='A small audio and MIDI framework part of the OpenBSD project (32 bit)'
arch=('x86_64')
url='http://www.sndio.org'
license=('ISC')

# sndio can be built without libbsd, but there are a bunch of individual
# ISC-licensed files by different authors to extract the licenses from
# if done that way. Licenses are complicated.
depends=(alsa-lib libbsd)

source=("http://www.sndio.org/sndio-$pkgver.tar.gz")
sha256sums=(99e0064ac11aceab24c73ed4630a31de401ff2f37689565b7b375682476f5bc1)
backup=(etc/default/sndiod)

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
# export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "sndio-${pkgver}"

  ./configure \
    --enable-alsa \
    --with-libbsd \
    --prefix=/usr \
    --libdir=/usr/lib32
  
  make
}

package() {
  cd "sndio-${pkgver}"
  make DESTDIR="$pkgdir/" install
  
  ln -s "libsndio.so.7.0" "$pkgdir"/usr/lib32/libsndio.so.6.1
}

