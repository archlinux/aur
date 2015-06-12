pkgname=glib2-static
pkgver=2.44.0
pkgrel=1
pkgdesc="Common C routines used by GTK+ and other libs"
url="http://www.gtk.org/"
arch=(i686 x86_64)
depends=('pcre' 'libffi' "glib2")
makedepends=('pkg-config' 'python2' 'libxslt' 'docbook-xml' 'pcre' 'libffi' 'elfutils')
optdepends=('python2: for gdbus-codegen and gtester-report'
            'elfutils: gresource inspection tool')
options=('!docs' '!libtool' '!emptydirs' 'staticlibs')
license=('LGPL')
source=(http://ftp.gnome.org/pub/GNOME/sources/glib/${pkgver%.*}/glib-$pkgver.tar.xz
	revert-warn-glib-compile-schemas.patch)
sha256sums=('f2d362b106a08fa801770d41829a06fcfe287a00421018869eebf5efc796f5b9'
            '049240975cd2f1c88fbe7deb28af14d4ec7d2640495f7ca8980d873bb710cc97')

prepare() {
  cd glib-$pkgver
  patch -Rp1 -i ../revert-warn-glib-compile-schemas.patch
}

build() {
  cd glib-$pkgver
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --libdir=/usr/lib \
      --sysconfdir=/etc \
      --with-pcre=system \
      --disable-fam --enable-static
  make
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
