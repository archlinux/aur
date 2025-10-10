# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=gtkam
pkgver=1.1
pkgrel=1
pkgdesc="A GTK2 frontend for libgphoto2"
arch=(x86_64 i686)
url="https://github.com/gphoto/gtkam"
license=(GPL-2.0-or-later)
depends=(glibc glib2 gtk2 libgphoto2 libexif libexif-gtk gdk-pixbuf2)
makedepends=(intltool)
source=("https://github.com/gphoto/gtkam/releases/download/v${pkgver}/gtkam-${pkgver}.tar.gz"
		"gtkam-check-pow.patch::https://github.com/gphoto/gtkam/commit/d5f837e6c46c0ca4e2d4e8bc6c072b619466949d.patch"
		)
		#"https://github.com/gphoto/gtkam/releases/download/v${pkgver}/gtkam-${pkgver}.tar.gz.asc" # not trusted # todo
sha256sums=('66e44e2f2ff98cdf523eef1e2274f757e082b69e5c9ca6f0af629453bb228347'
            '9e45e3a0506036ebdfdef17eac7206fe9e580f34b58a09d46177f7f293875834')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../gtkam-check-pow.patch

  autoreconf -f -i
}

build() {
  export CFLAGS+=" -Wno-incompatible-pointer-types"

  cd "${pkgname}-${pkgver}"
  ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--without-bonobo \
	--without-gnome \
	--without-gimp \
	--disable-scrollkeeper

  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
