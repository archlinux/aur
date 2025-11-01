# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Swift Geek < swift geek Ã¢t gmail dÃ¸t cÃ¸m>

_pkgname=libappindicator
pkgname=lib32-${_pkgname}
_pkgver=12.10.1+20.10.20200706.1
pkgver=${_pkgver%+*}
pkgrel=1
pkgdesc='Allow applications to extend a menu via Ayatana indicators in Unity, KDE or Systray (32-bit)'
url='https://launchpad.net/libappindicator'
arch=('x86_64')
license=('GPL-3.0-only')
depends=("${_pkgname}-gtk3" 'lib32-glib2' 'lib32-glibc' 'lib32-gtk3' 'lib32-libdbusmenu-glib' 'lib32-libdbusmenu-gtk3')
makedepends=('dbus-glib' 'glib2-devel' 'gnome-common' 'vala')
conflicts=("lib32-${_pkgname}-gtk3")
provides=("lib32-${_pkgname}-gtk3=$pkgver")
replaces=("lib32-${_pkgname}-gtk3")
options=('!emptydirs')
source=(https://old-releases.ubuntu.com/ubuntu/pool/universe/liba/libappindicator/libappindicator_${_pkgver}.orig.tar.gz
        libappindicator-fix-unfallback.patch)
sha512sums=('cc60875b1c4ab06348eece442a59a4057d7e13f25605435902242558e8dd5e66aeeee6725b9bd2662ef89052d3614dc4577ed8c233e9b84236a75e771aa67352'
            'ace190fea1b0e21fb164ff531788ce8c2ad9fc00c23227a75d844b1c89f78e8da705f35dac09677f92f053561f89a9c0a73b23af07cb22f9fdaa28afbd10a516')
validpgpkeys=('6FC05581A37D71FCECE165DB5BE41E162CD6358E')  # Charles Kerr <charles.kerr@canonical.com>

prepare() {
  # Fix unfallback from status icon
  patch -Np0 -i libappindicator-fix-unfallback.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export CFLAGS="${CFLAGS} -Wno-deprecated-declarations"
  export CSC='/usr/bin/mcs'

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib32 \
    --with-gtk=3
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  make -j1 DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et:
