# $Id: PKGBUILD 68598 2012-03-29 08:03:13Z arodseth $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=twinkle
pkgver=1.4.2
pkgrel=19
pkgdesc="Softphone for voice over IP and IM communication using SIP"
arch=('x86_64' 'i686')
url="http://www.twinklephone.com/"
license=('GPL')
depends=('file' 'speex' 'boost-libs' 'libsndfile' 'qt3' 'libzrtpcpp' 'commoncpp2')
makedepends=('pkg-config' 'boost' 'gendesk')
source=("http://www.xs4all.nl/~mfnboer/$pkgname/download/$pkgname-$pkgver.tar.gz"
	twinkle-1.4.2-ccrtp.patch)
md5sums=('d70c8972f296ffd998c7fb698774705b'
         '934f59ff60a8ae29a152feb8bf131ae2')

prepare() {
#  gendesk
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir"/twinkle-1.4.2-ccrtp.patch 
}

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fi
  export QTDIR=/usr/lib/qt3
  export PATH=$QTDIR/bin:$PATH
  CPPFLAGS="$CPPFLAGS -I/usr/include/qt3 -I/usr/include/libzrtpcpp" \
  ./configure --prefix=/usr \
	--without-kde \
	--with-speex \
	--without-ilbc \
	--mandir=/usr/share/man
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/share/twinkle/twinkle48.png" \
    "$pkgdir/usr/share/pixmaps/twinkle.png"
  install -Dm644 twinkle.desktop \
    "$pkgdir/usr/share/applications/twinkle.desktop"
}
