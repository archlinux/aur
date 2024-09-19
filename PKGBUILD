# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfig-dev
pkgver=1.5.3
pkgrel=1
pkgdesc="Professional vector animation program (CLI renderer only)"
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
url="https://synfig.org"
license=('GPL3')
depends=('libxml++2.6' 'libsigc++2.0' 'etl-dev>=1.5.0' 'imagemagick' 'ffmpeg' 'fontconfig'
         'libpng' 'libtiff' 'libdv' 'libmng' 'cairo' 'pango' 'boost-libs' 'mlt'
         'fftw')
makedepends=('boost' 'intltool')
optdepends=('openexr' 'libsigc++')
conflicts=('synfig')
provides=('synfig-dev')
source=("https://github.com/synfig/synfig/archive/v$pkgver.tar.gz")
sha512sums=('799d5c6de004acc553c0242598b23dcafc31f1c176e7b45d1f38cf79aa4d57de474e993805b240440b707ebf9aed53634e74798d35f962f7e13d5a7c5a41b86f')

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
