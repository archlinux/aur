# $Id$
# Maintainer: unit73e <unit73e at gmail dot com>
# Contributor: blimpy <0087yugbocaj@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgbase=termite
pkgname=('termite-nocsd')
pkgver=13
pkgrel=2
pkgdesc="A simple VTE-based terminal without GTK client side decorations. Perfect for wayland+sway users."
url="https://github.com/thestinger/termite/"
license=('LGPL')
conflicts=('termite')
provides=('termite')
arch=('x86_64')
depends=('gtk3' 'pcre2' 'gnutls' 'vte-common')
makedepends=('git' 'ncurses' 'intltool' 'gperf' 'gtk-doc')
_vtever=0.50.2.a
source=("git+https://github.com/thestinger/termite#tag=v$pkgver"
        "git+https://github.com/thestinger/vte-ng#tag=$_vtever"
        "termite-util::git+https://github.com/thestinger/util"
        "termite.patch")
sha256sums=('SKIP'
            'SKIP'
	    'SKIP'
            '4319296a88502b0a0397704177047cf7b0d39816b87d0f477a92ced4d1f16715')

prepare() {
  cd $pkgbase
  patch -Np1 -i "${srcdir}/termite.patch" "${srcdir}/termite/termite.cc" 

  cd ../vte-ng
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

package_termite-nocsd() {
  depends+=('termite-terminfo')
  backup=(etc/xdg/termite/config)

  make -C vte-ng/po DESTDIR="$pkgdir" install-data
  make -C $pkgbase DESTDIR="$pkgdir" PREFIX=/usr install
  rm -r "$pkgdir/usr/share/terminfo"
}

