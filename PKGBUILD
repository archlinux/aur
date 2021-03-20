# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=zbar-git
pkgver=0.23.92.r22.g4e0f618
pkgrel=1
pkgdesc="Application and library for reading bar codes from various sources"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mchehab/zbar"
license=('LGPL')
depends=('dbus' 'imagemagick' 'libsm' 'libxv' 'v4l-utils')
makedepends=('gtk3' 'qt5-x11extras' 'python' 'xmlto' 'docbook-xsl' 'gobject-introspection')
optdepends=('gtk3: for zbar-gtk'
            'qt5-x11extras: for zbar-qt'
            'python: for zbar python bindings')
provides=('zbar' 'zbar-gtk' 'zbar-qt' 'python-zbar')
source=("$pkgname"::'git+https://github.com/mchehab/zbar.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  autoreconf -vfi

  # Removed in Python 3.9. Ignored in Python 3.0+ anyway.
  sed -i '/tp_print/d' python/enum.c
}

build() {
  cd "$pkgname"

  ./configure --prefix=/usr --with-qt --with-gtk=gtk3 --with-dbusconfdir=/usr/share CFLAGS="$CFLAGS -DNDEBUG"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
