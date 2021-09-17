# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfig-dev
pkgver=1.5.0
pkgrel=1
pkgdesc="Professional vector animation program (CLI renderer only)"
arch=(x86_64 armv7h armv8 riscv32 riscv64)
url="https://synfig.org"
license=('GPL3')
depends=('libxml++2.6' 'libsigc++2.0' 'etl-dev>=1.5.0' 'imagemagick' 'ffmpeg' 'fontconfig'
         'libpng' 'libtiff' 'libdv' 'libmng' 'cairo' 'pango' 'boost-libs' 'mlt'
         'fftw')
makedepends=('boost')
optdepends=('openexr' 'libsigc++')
conflicts=('synfig')
replaces=('synfig')
provides=('synfig-dev')
source=("https://github.com/synfig/synfig/archive/v$pkgver.tar.gz")
sha512sums=('a3beecdfae5508c6ccf0aa9ec44d817264266a5bb4b7dd580ade53c613658d34e5edc860c17ba5a2d7aa5c3c91a30bb8550b87623ccaad53a4b584cc93852c40')

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
