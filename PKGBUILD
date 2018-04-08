# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=vte-legacy
pkgver=0.28.2
pkgrel=10
pkgdesc="Virtual Terminal Emulator widget for use with GTK2"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
depends=('gtk2' 'vte-common')
provides=('vte')
conflicts=('vte')
makedepends=('pygtk' 'intltool' 'gobject-introspection' 'pygobject2-devel')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/GNOME/sources/vte/0.28/vte-$pkgver.tar.xz
        make_alt_work.patch
        scroll_region.patch
        bracketed_paste_mode_fix.patch)
sha256sums=('86cf0b81aa023fa93ed415653d51c96767f20b2d7334c893caba71e42654b0ae'
            '2cd58ffffd42a9d59e05369c2efa1e70b7d32bfb5c8cdbd67b3b95ae3c3e6d61'
            '9a99c486b1c0377a4b8c6fae25067c68913bded2988fafea2c86f5adf6a49c81'
            '634d4526efdff9fac0e75cb056afb0a886354cd52c5dc98f5a70bef282631724')

prepare() {
  cd vte-$pkgver
  patch -Np1 -i ../make_alt_work.patch
  patch -Np1 -i ../scroll_region.patch
  patch -Np1 -i ../bracketed_paste_mode_fix.patch
  rm -r doc/reference/html
}
build() {
  cd vte-$pkgver
  #warning: type-punning to incomplete type might break strict-aliasing rules
  export CFLAGS="$CFLAGS -fno-strict-aliasing"

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vte \
      --localstatedir=/var --disable-static \
      --enable-introspection --with-gtk=2.0 --disable-gnome-pty-helper
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package(){
  cd vte-$pkgver
  make DESTDIR="$pkgdir" install
}
