# $Id: PKGBUILD 272552 2016-07-28 08:50:18Z heftig $
# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=gcr-nogtk
pkgver=3.20.0
pkgrel=2
pkgdesc="A library for bits of crypto UI and parsing (without GTK)"
arch=(i686 x86_64)
url="https://git.gnome.org/browse/gcr"
license=('GPL2')
depends=('dconf' 'libgcrypt' 'p11-kit')
makedepends=('intltool' 'gobject-introspection' 'python' 'vala' 'libxslt')
options=('!makeflags')
source=(http://download.gnome.org/sources/gcr/${pkgver:0:4}/gcr-$pkgver.tar.xz
        10-gcr.conf)
sha256sums=('90572c626d8a708225560c42b4421f7941315247fa1679d4ef569bde7f4bb379'
            '5f2eda7175ae9f23ee0e09d2beceb24fd2f6daafd7bddfcc1c1f5a3734eb60fc')
provides=(gcr)
conflicts=(gcr)

prepare() {
  mkdir -p path
  ln -f -s /usr/bin/python2 path/python
}

build() {
  cd "gcr-$pkgver"
  ./configure --prefix=/usr \
    --libexec=/usr/lib/gcr \
    --disable-static \
    --disable-update-mime \
    --disable-schemas-compile \
    --without-gtk
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "gcr-$pkgver"
  PATH="$srcdir/path:$PATH" dbus-run-session make -k check || :
}

package() {
  cd "gcr-$pkgver"
  make DESTDIR="$pkgdir" install

  # gcr wants to lock some memory to prevent swapping out private keys
  # https://bugs.archlinux.org/task/32616
  # https://bugzilla.gnome.org/show_bug.cgi?id=688161
  install -Dm644 ../10-gcr.conf "$pkgdir/etc/security/limits.d/10-gcr.conf"
}

# vim:set ts=2 sw=2 et:
