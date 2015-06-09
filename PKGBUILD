# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=evolution-data-server
pkgname=$_pkgname-git
pkgver=3.17.2.r17.g3a99564
pkgrel=1
_realver=3.17.3
pkgdesc="Centralized access to appointments and contacts"
arch=(i686 x86_64)
depends=(gnome-online-accounts nss krb5 libgweather libical db libgdata)
makedepends=(intltool gperf gobject-introspection vala gtk-doc gnome-common)
install=$_pkgname.install
url="https://wiki.gnome.org/Apps/Evolution"
license=(GPL)
provides=("${_pkgname}=${_realver}")
conflicts=("${_pkgname}")
replace=("${_pkgname}")
source=('git://git.gnome.org/evolution-data-server')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | sed -E 's/^EVOLUTION_DATA_SERVER_//;s/_/./g;s/([^-]*-g)/r\1/;s|-|.|g'
}

build() {
    cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --with-openldap=yes \
      --libexecdir=/usr/lib/evolution-data-server \
      --with-krb5=/usr --with-libdb=/usr \
      --enable-vala-bindings --disable-uoa \
      --enable-gtk-doc

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
}

package() {
    cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}