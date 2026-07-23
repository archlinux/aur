#Maintainer: Connor Behan <connor.behan@gmail.com>
#Contributor: Jan de Groot <jgc@archlinux.org>
#Contributor: Andrew Krawchyk <krawch_a@denison.edu>
#Contributor: Frederic Bezies <fredbezies@gmail.com>

pkgname=swfdec-devel
_pkgname=swfdec
pkgver=0.9.2
pkgrel=6
pkgdesc="Free Flash player ported to modern systems with assistance from Codex"
arch=('i686' 'x86_64')
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=('gstreamer' 'alsa-lib>=1.0.16' 'libmad>=0.15.1b-2' 'gtk3' 'libsoup3' 'ming')
makedepends=('pkgconfig' 'glib2-devel')
source=(https://web.archive.org/web/20160409151255/http://swfdec.freedesktop.org/download/swfdec/0.9/${_pkgname}-${pkgver}.tar.gz modern_deps.patch)
provides=('swfdec=0.9.2')
conflicts=('swfdec')
options=('!libtool' '!emptydirs' '!makeflags')

prepare() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  patch -Np1 -i ../modern_deps.patch
}

build() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  ./autogen.sh
  FFMPEG_CFLAGS="-I/usr/include/libavcodec -I/usr/include/libswscale" ./configure --prefix=/usr --disable-static --enable-gtk \
	--enable-mad --enable-ffmpeg --disable-gnome-vfs \
	--enable-gstreamer --enable-soup --with-audio=alsa
  make
}

package() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm755 player/.libs/swfplay "$pkgdir"/usr/bin/swfplay
}

sha256sums=('7d56a3044c19e7ca4b492f3739d9aa6f6bdb6e51ecf4daa5d29c035ae430f1ef'
            'a70a5eeff8f2c10706a7b110fe13375ad88b9c592bf311ea24fbb1e59e57787f')
