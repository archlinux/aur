# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=rest
pkgver=0.8.1+r4+ge5ee6ef
pkgrel=1
pkgdesc="Library for accessing RESTful web services (legacy)"
url="https://gitlab.gnome.org/GNOME/librest"
arch=(x86_64)
license=(LGPL2.1)
depends=(glib2 libxml2 libsoup)
makedepends=(gobject-introspection gtk-doc git)
_commit=e5ee6ef751ee5a38d7b9fadcd631cf6ecec7b240  # librest-0-7
source=("git+https://gitlab.gnome.org/GNOME/librest.git#commit=$_commit"
        skip-test.diff)
sha256sums=('SKIP'
            'de88fef81a5bc060eff45003f4fd755802097e70a782111a9fa18310d123e8e2')

pkgver() {
  cd librest
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd librest

  # Skip tests trying to connect to oauthbin.com
  git apply -3 ../skip-test.diff

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd librest
  ./configure --prefix=/usr --sysconfdir=/etc --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd librest
  make check
}

package() {
  depends+=(libg{lib,object,io}-2.0.so libxml2.so libsoup{,-gnome}-2.4.so)
  provides+=(librest{,-extras}-0.7.so)

  cd librest
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 et:
