# Maintainer: Brian Bidulock <bidulock@openss7.com>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=remmina-gtk2
pkgver=1.0.0
pkgrel=4
pkgdesc="Remmina is a remote desktop client written in GTK+. "
arch=(i686 x86_64)
url="http://remmina.sourceforge.net/"
license=('GPL')
depends=('libssh' 'libgnome-keyring' 'vte' 'telepathy-glib' 'freerdp-102')
makedepends=('intltool' 'pkgconfig' 'cmake' 'avahi-gtk2' 'libxkbfile' 'freerdp-102' 'telepathy-glib')
optdepends=('avahi-gtk2' 'libxkbfile' 'gnome-keyring')
replaces=('remmina-plugins')
provides=("grdc" "grdc=$pkgver" 'remmina-plugins' 'remmina')
conflicts=("grdc" 'remmina')
install=remmina.install
source=(https://github.com/downloads/FreeRDP/Remmina/Remmina-$pkgver.tar.gz
	'https://github.com/FreeRDP/Remmina/commit/569d9bb702d06c061dfbbf3c590d57ea83a04369.diff'
	'https://github.com/FreeRDP/Remmina/commit/f7d1038ba358a295fb46c681db5c47e4ead97306.diff')
md5sums=('701c540acaab961bc3adf130a2ddb8b1'
         'a7593a10a6aac5105802d6046c6e0bb2'
         '93ef2e91a259dd7b9c2429d7bf0abe88')

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
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd FreeRDP-Remmina-*/
  make DESTDIR=${pkgdir} install
}
