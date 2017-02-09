pkgname=glib2-static
pkgver=2.50.2
pkgrel=1
pkgdesc="Low level core library. Static library."
url="http://www.gtk.org/"
arch=(i686 x86_64)
makedepends=(libffi pcre zlib shared-mime-info python libelf)
checkdepends=(desktop-file-utils dbus)
optdepends=('python2: for gdbus-codegen and gtester-report'
            'elfutils: gresource inspection tool')
options=('!docs' '!libtool' '!emptydirs' 'staticlibs')
depends=(pcre libffi)
license=(LGPL)
source=(http://ftp.gnome.org/pub/GNOME/sources/glib/${pkgver%.*}/glib-$pkgver.tar.xz
	revert-warn-glib-compile-schemas.patch)
sha256sums=('be68737c1f268c05493e503b3b654d2b7f43d7d0b8c5556f7e4651b870acfbf5'
            '049240975cd2f1c88fbe7deb28af14d4ec7d2640495f7ca8980d873bb710cc97')

prepare() {
  cd glib-$pkgver
  patch -Rp1 -i ../revert-warn-glib-compile-schemas.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd glib-$pkgver
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --libdir=/usr/lib \
      --sysconfdir=/etc \
      --with-pcre=system \
      --disable-fam --enable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd glib-$pkgver
  if ! make check; then
    # Rounding error in timer tests?
    # GLib:ERROR:timer.c:38:test_timer_basic: assertion failed (micros == ((guint64)(elapsed * 1e6)) % 1000000): (1 == 0)
    make check
  fi
}


package() {
  cd glib-$pkgver
  make completiondir=/usr/share/bash-completion/completions DESTDIR="$pkgdir" install
  for _i in "$pkgdir/usr/share/bash-completion/completions/"*; do
      chmod -x "$_i"
  done
  # Our gdb does not ship the required python modules, so remove it
  rm -rf "$pkgdir/usr/"{bin,include,share,lib/glib-2.0,lib/pkgconfig} $pkgdir/usr/lib/*.so*
}
