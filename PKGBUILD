# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Swift Geek < swift geek Ã¢t gmail dÃ¸t cÃ¸m>

_pkgname=libappindicator
pkgname=lib32-${_pkgname}
_bzrtag=12.10.0
_bzrrev=298
pkgver=${_bzrtag}.r${_bzrrev}
pkgrel=5
pkgdesc='Allow applications to extend a menu via Ayatana indicators in Unity, KDE or Systray (32-bit)'
url='https://launchpad.net/libappindicator'
arch=('x86_64')
license=('GPL-3.0-only')
depends=("${_pkgname}-gtk3" 'lib32-libdbusmenu-gtk3')
makedepends=('breezy' 'dbus-glib' 'glib2-devel' 'gnome-common' 'vala')
conflicts=("lib32-${_pkgname}-gtk3")
provides=("lib32-${_pkgname}-gtk3=$pkgver")
replaces=("lib32-${_pkgname}-gtk3")
options=('!emptydirs')
source=($_pkgname::bzr+https://code.launchpad.net/~indicator-applet-developers/libappindicator/trunk#revision=$_bzrrev
        libappindicator-fix-unfallback.patch)
sha512sums=('023cb633e9750e279b19a6dc2d42d37bfc15d6c992017be3a6b71881579654578e9da3058d44ab400752f86411a362e676abb217ca47f14d24e43e6c26107f4d'
            'ace190fea1b0e21fb164ff531788ce8c2ad9fc00c23227a75d844b1c89f78e8da705f35dac09677f92f053561f89a9c0a73b23af07cb22f9fdaa28afbd10a516')
validpgpkeys=('6FC05581A37D71FCECE165DB5BE41E162CD6358E')  # Charles Kerr <charles.kerr@canonical.com>

prepare() {
  cd ${_pkgname}

  # Fix unfallback from status icon
  patch -Np0 -i ../libappindicator-fix-unfallback.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export CFLAGS="${CFLAGS} -Wno-deprecated-declarations"
  export CSC='/usr/bin/mcs'

  cd ${_pkgname}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib32 \
    --with-gtk=3
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgname}
  make -j1 DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et:
