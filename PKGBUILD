# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=amide-git
pkgver=1.0.6.r13.g874d6ea
pkgrel=1
pkgdesc='Medical imaging data examiner'
arch=('x86_64')
url='https://github.com/ferdymercury/amide'
license=('GPL')
depends=('dcmtk' 'gsl' 'libgnomecanvas' 'volpack' 'xmedcon-gtk2')
makedepends=('intltool' 'libxml2')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=(git+$url.git)
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | cut -c2- | sed 's+-+.r+'|tr - .
}

build() {
  cd "${pkgname%-git}"/"${pkgname%-git}"-current
  touch gnome-doc-utils.make
  autoreconf -fi
  CFLAGS+=" -fcommon" ./configure \
	 --prefix=/usr \
	 --disable-ffmpeg \
	 --disable-gconf \
	 --disable-gnome-vfs \
	 --disable-gtk-doc \
	 --disable-gnome-doc
  make --jobs=1
}

package() {
  cd "${pkgname%-git}"/"${pkgname%-git}"-current
  make DESTDIR="$pkgdir" install
}
