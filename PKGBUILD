# Maintainer: piernov <piernov@piernov.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Franco Iacomella <yaco@gnu.org>

pkgname=synfig-git
pkgver=r8212.cdd534e1c
pkgrel=2
pkgdesc="Professional vector animation program (CLI renderer only)"
arch=(x86_64)
url="http://synfig.org"
license=('GPL2')
depends=('libxml++2.6' 'libsigc++2.0' 'etl-git' 'imagemagick' 'ffmpeg' 'fontconfig'
         'libpng' 'libtiff' 'libdv' 'libmng' 'cairo' 'pango' 'boost-libs' 'mlt'
         'fftw')
makedepends=('boost')
optdepends=('openexr' 'libsigc++')
conflicts=('synfig-core' 'synfig')
replaces=('synfig-core')
provides=('synfig')
source=(git+https://github.com/synfig/synfig
	ffmpeg-3.0.patch)
md5sums=('SKIP'
         '62fb382cbf418f5e2f536ed73656cf89')

pkgver() {
  cd "$srcdir"/synfig/synfig-core
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd synfig/synfig-core
  patch -p1 -i "$srcdir"/ffmpeg-3.0.patch
}

build() {
  cd synfig/synfig-core

export  PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig" 

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
  cd synfig/synfig-core
  make DESTDIR="$pkgdir" install
}
