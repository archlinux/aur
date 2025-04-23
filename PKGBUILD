# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=telepathy-logger
pkgver=0.8.2
pkgrel=8
pkgdesc='Telepathy framework logging daemon'
arch=(x86_64)
url='https://telepathy.freedesktop.org/'
license=(LGPL-2.1-or-later)
depends=(
  dbus-glib
  dconf
  glib2
  glibc
  libxml2
  sqlite
  telepathy-glib
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  intltool
  libxslt
  python
)
source=(
  "git+https://gitlab.freedesktop.org/telepathy/$pkgname.git?signed#tag=$pkgname-$pkgver"
  telepathy-logger-fix-doc.patch
  telepathy-logger-incompatible-pointer.patch
)
b2sums=(
  b0091a7bf1c209dee206226e4954edff62fce33e69fae4077f1ea582a27d067c0bf3c0c20b33165e0327a89c101371b7649761417e09694c35129d5c095abda3
  dc53714d93c492643d31e0cd22c37936ad0af7fdcafc47bcd24e22d7ec9fdbe9e89207fdb8c4d548d802456a710e9385c4bb41e8da4482dd9cff26bc07959cfb
  642c974dd27bcde7c3b47378db70d17ea041cc3e863bdc7656875b02878368d2689a5255e22f637df4ef8bdefa5593b1ceb6de690d6daf3025d51a863199b6df
)
validpgpkeys=(5113B855236702158C41C366432705FACDD40325) # Debarshi Ray

prepare() {
  cd $pkgname

  # https://gitlab.freedesktop.org/telepathy/telepathy-logger/-/merge_requests/1
  git cherry-pick -n ffc23c3b3d49d265997b6bb5d55d9463080c1cc8

  # https://gitlab.freedesktop.org/telepathy/telepathy-logger/-/issues/46
  git apply -3 ../telepathy-logger-fix-doc.patch

  # https://gitlab.freedesktop.org/telepathy/telepathy-logger/-/merge_requests/2
  git apply -3 ../telepathy-logger-incompatible-pointer.patch

  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/telepathy \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make -j1 check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
