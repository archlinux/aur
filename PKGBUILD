# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

_pkgbase=libindicator
pkgbase=lib32-${_pkgbase}
pkgname=("${pkgbase}-gtk"{2,3})
pkgver=12.10.1
pkgrel=9
pkgdesc='Set of symbols and convenience functions for Ayatana indicators (32-bit)'
url='https://launchpad.net/libindicator'
arch=('x86_64')
license=('GPL3')
makedepends=("lib32-gtk"{2,3} 'python')
source=(https://launchpad.net/${_pkgbase}/${pkgver%.*}/${pkgver}/+download/${_pkgbase}-${pkgver}.tar.gz{,.asc})
sha512sums=('d6d77d0309b15cf6b52539323920ab0c1594cb1c1cef8a8d67cd0f76f8ceeeac28eb6db6227563df1932e6f1fadcffac68d82982182b745257dfaf91f1c945af'
            'SKIP')
validpgpkeys=('6FC05581A37D71FCECE165DB5BE41E162CD6358E')  # Charles Kerr <charles.kerr@canonical.com>

prepare() {
  (cd ${_pkgbase}-${pkgver}
    sed -i 's/-Werror//' {libindicator,tools}/Makefile.am
    autoreconf -fi
  )
  cp -ra ${_pkgbase}-${pkgver}{,-gtk2}
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  msg2 "Building gtk3..."
  (cd ${_pkgbase}-${pkgver}
    ./configure \
      --prefix=/usr \
      --localstatedir=/var \
      --libexecdir=/usr/lib32/libindicator \
      --libdir=/usr/lib32 \
      --sysconfdir=/etc \
      --with-gtk=3 \
      --disable-static \
      --disable-tests
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
  )

  msg2 "Building gtk2..."
  (cd ${_pkgbase}-${pkgver}-gtk2
    ./configure \
      --prefix=/usr \
      --localstatedir=/var \
      --libexecdir=/usr/lib32/libindicator \
      --libdir=/usr/lib32 \
      --sysconfdir=/etc \
      --with-gtk=2 \
      --disable-static \
      --disable-tests
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
  )
}

package_lib32-libindicator-gtk2() {
  pkgdesc+=" (GTK+ 2 library)"
  depends=("${_pkgbase}-gtk2" 'lib32-gtk2')

  cd ${_pkgbase}-${pkgver}-gtk2
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

package_lib32-libindicator-gtk3() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=("${_pkgbase}-gtk3" 'lib32-gtk3')

  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

# vim: ts=2 sw=2 et:
