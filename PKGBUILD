# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Swift Geek < swift geek Ã¢t gmail dÃ¸t cÃ¸m>

_pkgbase=libappindicator
pkgbase=lib32-${_pkgbase}
pkgname=("${pkgbase}-gtk"{2,3})
pkgver=12.10.0
pkgrel=13
pkgdesc='Allow applications to extend a menu via Ayatana indicators in Unity, KDE or Systray (32-bit)'
url='https://launchpad.net/libappindicator'
arch=('x86_64')
license=('LGPL2.1' 'GPL3')
makedepends=('dbus-glib' 'lib32-libdbusmenu-gtk'{2,3} 'lib32-libindicator-gtk'{2,3} 'vala')
options=('!emptydirs')
source=(http://launchpad.net/${_pkgbase}/${pkgver%.*}/${pkgver}/+download/${_pkgbase}-${pkgver}.tar.gz{,.asc}
        no-python.patch)
sha512sums=('317a22a23c8ed84e74207b64b2e9683992d1fb7208176637a051dfe925974f966d1cfa31e650b45eaf839ab61641dee8fbebc8a07882a09b0dd766d88b8d5b9a'
            'SKIP'
            '0fd8ad2afa6ef25b9d006fb7c7fbbf1acd9b5af282a0373720f4ddc39d28bd5a9ae24b01f02c320593a543b316e5634d3a38dda6801aa9eff76a0b2fbc627fe0')
validpgpkeys=('6FC05581A37D71FCECE165DB5BE41E162CD6358E')  # Charles Kerr <charles.kerr@canonical.com>

prepare() {
  (cd ${_pkgbase}-${pkgver}
    patch -p1 < "${srcdir}/no-python.patch"
    sed -i 's/-Werror//' src/Makefile.am
    autoreconf -fi
  )
  cp -ra ${_pkgbase}-${pkgver}{,-gtk2}
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export CFLAGS="${CFLAGS} -Wno-deprecated-declarations"
  export CSC='/usr/bin/mcs'

  msg2 'Building gtk3...'
  (cd ${_pkgbase}-${pkgver}
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libdir=/usr/lib32 \
      --with-gtk=3
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
  )

  msg2 'Building gtk2...'
  (cd ${_pkgbase}-${pkgver}-gtk2
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
  depends=('lib32-libdbusmenu-gtk2' 'lib32-libindicator-gtk2')

  cd ${_pkgbase}-${pkgver}-gtk2
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}

package_lib32-libappindicator-gtk3() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=('lib32-libdbusmenu-gtk3' 'lib32-libindicator-gtk3')

  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et:
