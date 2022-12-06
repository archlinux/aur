# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
pkgname=amide  
pkgver=1.0.6
pkgrel=9
pkgdesc='Medical imaging data examiner'
arch=('x86_64')
url='https://amide.sourceforge.net/'
license=('GPL')
depends=('dcmtk' 'gsl' 'libgnomecanvas' 'volpack' 'xmedcon-gtk2')
makedepends=('intltool' 'libxml2')
source=('https://web.stanford.edu/~loening/files/amide-1.0.6-2.fc25.src.rpm' amide_nognome.patch)
sha512sums=('2d6f9d7cfa7921ba95fd0a887504d4ec135d0e93d94ffdf256b5fc94f3df1766006e0f13ca24c1cc7904c636182db96b7e7c29ac2529554c351458217406053d'
            '34af3c04ff094fe942f02ff8603617f969415e1c4ebc1ef16fba0bcb6d4070285c5027a4212ec49d07e343ca141010507c284dd30b4884545e324411b116d37c')

prepare() {
  bsdtar --extract --file "$pkgname-$pkgver.tgz"
  cd "$pkgname-$pkgver"
  patch -Np2 < "$srcdir"/amide_nognome.patch
}

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fi
  CFLAGS+=" -fcommon" ./configure \
	 --prefix=/usr \
	 --disable-ffmpeg \
	 --disable-gconf \
	 --disable-gnome-vfs \
	 --disable-gtk-doc \
	 --disable-doc
  make --jobs=1
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
