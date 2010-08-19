#$Id$
#Maintainer: Jan De Groot <jgc@archlinux.org>

pkgname=libgnome-keyring
pkgver=2.30.1
pkgrel=2
pkgdesc="GNOME keyring client library"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('dbus-core>=1.2.24' 'libgcrypt>=1.4.6' 'glib2>=2.24.1')
makedepends=('intltool' 'pkgconfig' 'python' 'gtk-doc')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.30/${pkgname}-${pkgver}.tar.bz2
        eggdbus-remove.patch
        keyring-fix-threading.patch)
sha256sums=('a9227da7d3eee930b75ad7858875344b713d1bf73e6af54870a2691643d5dae4'
            'f962bc3b2407f63a0c5c8234f8a70e9885535c857a87414540860b830e908024'
            '9a8b20b87fe595e26cb04ede3a26ef1a1ae8f0c7dcc2efc7a52961f70e453bd7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/eggdbus-remove.patch"
  patch -Np1 -i "${srcdir}/keyring-fix-threading.patch"
  libtoolize --force
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-keyring
  make
  make -j1 DESTDIR="${pkgdir}" install
}
