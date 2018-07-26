# $Id: PKGBUILD 276264 2017-12-27 19:52:10Z bpiotrowski $
# Maintainer: Mattéo Delabre <bonjour@matteodelabre.me>
# Contriubtor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfig
pkgver=1.2.1
pkgrel=4
pkgdesc="Professional vector animation program (CLI renderer only)"
arch=(x86_64)
url="https://synfig.org"
license=('GPL2')
depends=('libxml++2.6' 'libsigc++2.0' 'etl' 'libmagick6' 'ffmpeg' 'fontconfig'
         'libpng' 'libtiff' 'libdv' 'libmng' 'cairo' 'pango' 'boost-libs' 'mlt'
         'fftw' 'intltool')
makedepends=('boost')
optdepends=('openexr' 'libsigc++')
conflicts=('synfig-core')
replaces=('synfig-core')
source=(https://downloads.sourceforge.net/project/synfig/releases/$pkgver/source/synfig-$pkgver.tar.gz
        ffmpeg-3.0.patch)
sha256sums=('4d8bada4e99f05ee16b4256fc3f5a551d00a745347944837bbd6fa158b57e457'
            '424b3cc38809038c3b015ce2a6d3a006d73aefe0445d0090fae45e8eb69b2b55')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i "$srcdir"/ffmpeg-3.0.patch
}

build() {
  cd $pkgname-$pkgver

#  CXXFLAGS="$CXXFLAGS -std=gnu++11"
  PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" \
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --with-imagemagick \
    --with-magickpp \
    --with-libavcodec \
    --with-libdv

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
