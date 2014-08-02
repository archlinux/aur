# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=remmina-gtk2
pkgver=1.0.0
pkgrel=3
pkgdesc="Remmina is a remote desktop client written in GTK+. "
arch=(i686 x86_64)
url="http://remmina.sourceforge.net/"
license=('GPL')
depends=('libssh' 'libgnome-keyring' 'vte' 'telepathy-glib' 'freerdp')
makedepends=('intltool' 'pkgconfig' 'cmake' 'avahi' 'libxkbfile' 'freerdp' 'telepathy-glib')
optdepends=('avahi' 'libxkbfile' 'gnome-keyring')
replaces=('remmina-plugins')
provides=("grdc" "grdc=$pkgver" 'remmina-plugins' 'remmina')
conflicts=("grdc" 'remmina')
install=remmina.install
source=(https://github.com/downloads/FreeRDP/Remmina/Remmina-$pkgver.tar.gz
	'https://github.com/FreeRDP/Remmina/commit/569d9bb702d06c061dfbbf3c590d57ea83a04369.diff'
	'https://github.com/FreeRDP/Remmina/commit/f7d1038ba358a295fb46c681db5c47e4ead97306.diff')
md5sums=('701c540acaab961bc3adf130a2ddb8b1'
         'a979c898d5e53446cec9d01912ad9243'
         'b2a9c0e80ac7b0c8a26935bbe289aa3b')

prepare() {
  cd FreeRDP-Remmina-*/

  patch -p1 -i "${srcdir}/569d9bb702d06c061dfbbf3c590d57ea83a04369.diff"
  patch -p1 -i "${srcdir}/f7d1038ba358a295fb46c681db5c47e4ead97306.diff"
  sed -i '42,1d' cmake/FindGTK.cmake
  sed -i '30,+4d' cmake/FindGTK.cmake

}

build() {
  cd FreeRDP-Remmina-*/

  export LDFLAGS="-lX11 -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lpthread -lgnutls"
  cmake -DWITH_APPINDICATOR=OFF -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd FreeRDP-Remmina-*/

  make DESTDIR=${pkgdir} install
  rmdir ${pkgdir}/usr/include/remmina
  rmdir ${pkgdir}/usr/include
}
