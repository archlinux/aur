# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=libuser-ldap
pkgver=0.63
pkgrel=2
pkgdesc='LDAP module for libuser'
arch=('i686' 'x86_64')
license=('LGPL')
url='https://pagure.io/libuser/'
depends=('libuser' 'libldap')
makedepends=('autoconf' 'automake' 'gettext' 'libtool')
source=("https://releases.pagure.org/libuser/libuser-${pkgver}.tar.xz")
sha512sums=('5a8d261cea62d7d67da84acd263955eca10b876d3bb0cbbf8f15c2a4ad813f3d16361f90060a8ca77f7d97da4aaceaa0549985c06e9cabefeb10451bbb93a9d2')

prepare() {
  cd libuser-${pkgver}

  sed -i '/^gtkdocize/ s/^/#/' autogen.sh # comment out `gtkdocize` call
  sed -i '/^SUBDIRS/d' docs/Makefile.am # remove `SUBDIRS` line
  sed -i '/^AC_CONFIG_FILES/ s_docs/reference/Makefile__' configure.ac # remove `docs/reference/Makefile` from `AC_CONFIG_FILES`
}

build() {
  cd libuser-${pkgver}
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-gtk-doc \
    --disable-gtk-doc-html \
    --disable-rpath \
    --with-ldap
  sed -i 's/SUBDIRS = po docs/SUBDIRS = po/' Makefile
  make
}

package() {
  cd libuser-${pkgver}
  install -m755 -D ./modules/.libs/libuser_ldap.so "${pkgdir}/usr/lib/libuser/libuser_ldap.so"
}
