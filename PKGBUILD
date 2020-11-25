# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfig-dev
pkgver=1.4.0
pkgrel=1
pkgdesc="Professional vector animation program (CLI renderer only)"
arch=(x86_64)
url="https://synfig.org"
license=('GPL3')
depends=('libxml++2.6' 'libsigc++2.0' 'etl-dev>=1.4.0' 'imagemagick' 'ffmpeg' 'fontconfig'
         'libpng' 'libtiff' 'libdv' 'libmng' 'cairo' 'pango' 'boost-libs' 'mlt'
         'fftw')
makedepends=('boost')
optdepends=('openexr' 'libsigc++')
conflicts=('synfig')
replaces=('synfig')
provides=('synfig-dev')
source=("https://github.com/synfig/synfig/archive/v$pkgver.tar.gz")
sha512sums=('12688059d8b09739d092b7785f5f10e70e0def21ae00d056229034db1320d94c96d00a7afb8eeab5e968ea067df74f95cc285919b0a0a5ce7a4d4a78256cd3e1')

prepare() {
  cd synfig-$pkgver/synfig-core
}

build() {
  cd synfig-$pkgver/synfig-core

  export PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" 

  ./bootstrap.sh
  intltoolize --force --copy

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
