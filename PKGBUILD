# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfig-dev
pkgver=1.5.1
pkgrel=5
pkgdesc="Professional vector animation program (CLI renderer only)"
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
url="https://synfig.org"
license=('GPL3')
depends=('libxml++2.6' 'libsigc++2.0' 'etl-dev>=1.5.0' 'imagemagick' 'ffmpeg4.4' 'fontconfig'
         'libpng' 'libtiff' 'libdv' 'libmng' 'cairo' 'pango' 'boost-libs' 'mlt'
         'fftw')
makedepends=('boost' 'intltool')
optdepends=('openexr' 'libsigc++')
conflicts=('synfig')
provides=('synfig-dev')
source=("https://github.com/synfig/synfig/archive/v$pkgver.tar.gz")
sha512sums=('0c1dd53a445f037bcdb742d7c17d1d3a2039e80d3e49f5cd67119fb9792d96b47154874d5be42d36443b0d09c61b7864dfe33ebd5f3998783c54eb3cc936d11b')

prepare() {
  cd synfig-$pkgver/synfig-core
}

build() {
  cd synfig-$pkgver/synfig-core

  export PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" 

  ./bootstrap.sh
  intltoolize --force --copy
  export LDFLAGS=-L/usr/lib/ffmpeg4.4/
  export CFLAGS=-I/usr/include/ffmpeg4.4/
  export CPPFLAGS=-I/usr/include/ffmpeg4.4/
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
  cd synfig-$pkgver/synfig-core
  make DESTDIR="$pkgdir" install
}
