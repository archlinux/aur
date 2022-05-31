# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=libuser
pkgver=0.63
pkgrel=5
pkgdesc='A standardized interface for manipulating and administering user and group accounts.'
arch=('x86_64')
license=('LGPL')
url='https://pagure.io/libuser/'
depends=('glib2' 'pam' 'popt' 'python')
makedepends=('autoconf' 'automake' 'gettext' 'libtool')
backup=('etc/libuser.conf')
source=("https://releases.pagure.org/libuser/libuser-${pkgver}.tar.xz")
sha512sums=('5a8d261cea62d7d67da84acd263955eca10b876d3bb0cbbf8f15c2a4ad813f3d16361f90060a8ca77f7d97da4aaceaa0549985c06e9cabefeb10451bbb93a9d2')

prepare() {
  cd ${pkgname}-${pkgver}

  sed -i '/^gtkdocize/ s/^/#/' autogen.sh # comment out `gtkdocize` call
  sed -i '/^SUBDIRS/d' docs/Makefile.am # remove `SUBDIRS` line
  sed -i '/^AC_CONFIG_FILES/ s_docs/reference/Makefile__' configure.ac # remove `docs/reference/Makefile` from `AC_CONFIG_FILES`
}

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-gtk-doc \
    --disable-gtk-doc-html \
    --disable-rpath
  sed -i 's/SUBDIRS = po docs/SUBDIRS = po/' Makefile
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
