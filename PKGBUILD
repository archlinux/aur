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
sha256sums=('8dc377255452a68e82c4837ba22c3ee4ae3658971bf0f2ef67ed0b77fc497f91')

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
