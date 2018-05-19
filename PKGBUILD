# $Id$
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Maintainer: Antoni Boucher <bouanto at zoho dot com>

pkgbase=termite
pkgname=('termite-bepo')
pkgver=13
pkgrel=3
pkgdesc="A simple VTE-based terminal (bépo version)"
url="https://github.com/thestinger/termite/"
license=('LGPL')
arch=('x86_64')
depends=('gtk3' 'pcre2' 'gnutls' 'vte-common' 'termite-terminfo')
makedepends=('git' 'ncurses' 'intltool' 'gperf' 'gtk-doc')
conflicts=('termite')
_vtever=0.50.2.a
source=("git+https://github.com/antoyo/termite"
        "git+https://github.com/thestinger/vte-ng#tag=$_vtever"
        "termite-util::git+https://github.com/thestinger/util")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd vte-ng
  echo 'sources: $(BUILT_SOURCES)' >> src/Makefile.am
  NOCONFIGURE=1 ./autogen.sh

  cd ../$pkgbase
  git submodule init
  git config --local submodule.util.url "$srcdir/termite-util"
  git submodule update
}

build() {
  cd vte-ng
  ./configure \
    --prefix="$srcdir/vte-static" \
    --localedir="/usr/share/$pkgbase/locale" \
    --enable-static \
    --disable-shared \
    enable_introspection=no \
    enable_vala=no \
    --disable-gtk-doc \
    --disable-glade-catalogue
  make -C src sources install-exec install-data
  make install-pkgconfigDATA

  cd ../$pkgbase
  export PKG_CONFIG_PATH="$srcdir/vte-static/lib/pkgconfig"
  make
}

package() {
  backup=(etc/xdg/termite/config)

  make -C vte-ng/po DESTDIR="$pkgdir" install-data
  make -C $pkgbase DESTDIR="$pkgdir" PREFIX=/usr install
  rm -r "$pkgdir/usr/share/terminfo"
}
