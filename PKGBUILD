# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Swift Geek < swift geek Ã¢t gmail dÃ¸t cÃ¸m>

_pkgbase=libappindicator
pkgbase=lib32-${_pkgbase}
pkgname=("${pkgbase}-gtk"{2,3})
_bzrtag=12.10.0
_bzrrev=298
pkgver=${_bzrtag}.r${_bzrrev}
pkgrel=2
pkgdesc='Allow applications to extend a menu via Ayatana indicators in Unity, KDE or Systray (32-bit)'
url='https://launchpad.net/libappindicator'
arch=('x86_64')
license=('LGPL2.1' 'GPL3')
makedepends=('breezy' 'dbus-glib' 'gnome-common' 'lib32-libdbusmenu-gtk'{2,3} 'vala')
options=('!emptydirs')
source=($_pkgbase::bzr+https://code.launchpad.net/~indicator-applet-developers/libappindicator/trunk#revision=$_bzrrev)
sha512sums=('SKIP')
validpgpkeys=('6FC05581A37D71FCECE165DB5BE41E162CD6358E')  # Charles Kerr <charles.kerr@canonical.com>

prepare() {
  (cd ${_pkgbase}
    NOCONFIGURE=1 ./autogen.sh
  )
  cp -ra ${_pkgbase}{,-gtk2}
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export CFLAGS="${CFLAGS} -Wno-deprecated-declarations"
  export CSC='/usr/bin/mcs'

  msg2 'Building gtk3...'
  (cd ${_pkgbase}
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libdir=/usr/lib32 \
      --with-gtk=3
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
  )

  msg2 'Building gtk2...'
  (cd ${_pkgbase}-gtk2
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libdir=/usr/lib32 \
      --with-gtk=2
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
  )
}

package_lib32-libappindicator-gtk2() {
  pkgdesc+=" (GTK+ 2 library)"
  depends=('lib32-libdbusmenu-gtk2')

  cd ${_pkgbase}-gtk2
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}

package_lib32-libappindicator-gtk3() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=('lib32-libdbusmenu-gtk3')

  cd ${_pkgbase}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et:
