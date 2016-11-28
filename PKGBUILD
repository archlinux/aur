# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Swift Geek < swift geek Ã¢t gmail dÃ¸t cÃ¸m>

_pkgbase=libappindicator
pkgbase=lib32-${_pkgbase}
pkgname=("${pkgbase}-gtk"{2,3} "${pkgbase}-sharp")
pkgver=12.10.0
pkgrel=9
pkgdesc='Allow applications to extend a menu via Ayatana indicators in Unity, KDE or Systray (32-bit)'
url='https://launchpad.net/libappindicator'
arch=('x86_64')
license=('LGPL2.1' 'GPL3')
makedepends=('dbus-glib' 'gobject-introspection' 'gtk-doc' 'gtk-sharp-2'
             'lib32-libdbusmenu-gtk'{2,3} 'lib32-libindicator-gtk'{2,3}
             'mono' 'perl-xml-libxml' 'pygtk' 'vala' 'pkg-config')
options=('!emptydirs')
source=(http://launchpad.net/${_pkgbase}/${pkgver%.*}/${pkgver}/+download/${_pkgbase}-${pkgver}.tar.gz{,.asc}
        improved-plasma.patch
        no-python.patch)
sha512sums=('317a22a23c8ed84e74207b64b2e9683992d1fb7208176637a051dfe925974f966d1cfa31e650b45eaf839ab61641dee8fbebc8a07882a09b0dd766d88b8d5b9a'
            'SKIP'
            'e2930b9942b800a7a14faf4c27d59073c166e24bb1675f8604a0b5ac3fbd101f3642f7221bc8f5219231c8f021a2a8c4aa203f971ea5f2f9225be83d807cb80e'
            '891f5097c607770428460fe902214c70fb2a11de9fe1e6d6109ea859b22eda3d7057cab4c5b5444de5f6f3149348c186034dcde8f95c77800bcbd8abcdf7277b')
validpgpkeys=('6FC05581A37D71FCECE165DB5BE41E162CD6358E')  # Charles Kerr <charles.kerr@canonical.com>

prepare() {
  (cd ${_pkgbase}-${pkgver}
    sed 's|/cli/|/mono/|' -i bindings/mono/{appindicator-sharp-0.1.pc.in,Makefile.in}
    sed 's/example //g' -i Makefile.in
    patch -p1 < "${srcdir}/no-python.patch"
    patch -p1 < "${srcdir}/improved-plasma.patch"
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
      --disable-{gtk-doc-html,mono-test,static,tests} \
      --libdir=/usr/lib32 \
      --with-gtk=3
    make
  )

  msg2 'Building gtk2...'
  (cd ${_pkgbase}-${pkgver}-gtk2
    ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --disable-{gtk-doc-html,mono-test,static,tests} \
      --libdir=/usr/lib32 \
      --with-gtk=2
    make
  )
}

package_lib32-libappindicator-gtk2() {
  pkgdesc+=" (GTK+ 2 library)"
  depends=('lib32-libdbusmenu-gtk2' 'lib32-libindicator-gtk2')
  provides=("${pkgbase}")
  conflicts=("${pkgbase}")

  cd ${_pkgbase}-${pkgver}-gtk2
  make -j1 DESTDIR="${pkgdir}" install
  make -j1 -C 'bindings/mono' DESTDIR="${pkgdir}" uninstall
  rm -rf "${pkgdir}"/usr/{include,share}
}

package_lib32-libappindicator-gtk3() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=('lib32-libdbusmenu-gtk3' 'lib32-libindicator-gtk3')
  provides=("${pkgbase}3")
  conflicts=("${pkgbase}3")

  cd ${_pkgbase}-${pkgver}
  make -j1 DESTDIR="${pkgdir}" install
  make -j1 -C 'bindings/mono' DESTDIR="${pkgdir}" uninstall
  rm -rf "${pkgdir}"/usr/{include,share}
}

package_lib32-libappindicator-sharp() {
  depends=("${pkgbase}-gtk2" 'gtk-sharp-2')

  cd ${_pkgbase}-${pkgver}-gtk2
  make -j1 -C 'bindings/mono' DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/lib/mono/appindicator-sharp" "${pkgdir}/usr/lib32/mono/"
  mv "${pkgdir}/usr/lib/mono/gac" "${pkgdir}/usr/lib32/mono/"
  rm -rf "${pkgdir}"/usr/{include,share,lib}
}

# vim: ts=2 sw=2 et:
