# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfig-dev
pkgver=1.3.16
pkgrel=1
pkgdesc="Professional vector animation program (CLI renderer only)"
arch=(x86_64)
url="https://synfig.org"
license=('GPL3')
depends=('libxml++2.6' 'libsigc++2.0' 'etl-dev' 'imagemagick' 'ffmpeg' 'fontconfig'
         'libpng' 'libtiff' 'libdv' 'libmng' 'cairo' 'pango' 'boost-libs' 'mlt'
         'fftw')
makedepends=('boost')
optdepends=('openexr' 'libsigc++')
conflicts=('synfig')
replaces=('synfig')
provides=('synfig-dev')
source=("https://github.com/synfig/synfig/archive/v$pkgver.tar.gz")
sha512sums=('6cf5be662cc5bc26ad27bdc6ea3baae14ce6a100d214c38e873a88c6ad8acf7f7009ac3b09e2ed13c79650e75af5eb8e5d893ad9fd3f57ef1dce339799871381')

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
