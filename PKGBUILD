# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: herb  <herb@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=planner
pkgver=0.14.6
pkgrel=6
pkgdesc='Project management application for GNOME'
arch=('x86_64')
license=('GPL')
url='https://wiki.gnome.org/Apps/Planner'
depends=('libgnomecanvas' 'libxslt' 'gconf')
makedepends=('intltool' 'gtk-doc' 'pygtk' 'rarian')
options=('!emptydirs')
source=(https://download.gnome.org/sources/planner/${pkgver%.*}/planner-$pkgver.tar.xz
        f9840c342e4b5767ee35f0d326b7f7eaf56850ed.patch
        05ba23be296085313abd8d7d5075d962084f5d38.patch
        0cc65e2f420af45f78d190ac2af64810a148bb31.patch
        cd2b658e83d47e8f49d1bbaf54be6433a21d3758.patch
        fd8da8994f7006b9fcefc90d2fe5c2b484c7871e.patch
        8dd069a1e54c5b47e107f6df0db6ceb03e50c72d.patch
        42e0d6b3f60b06bbe55b3ebad7ffc6edbf16e7e0.patch)
sha256sums=('130d29e6d6b8c1994017deba2acca05a4bf83ba1e169635ec8c5c7878abe0696'
            'bc4455b318bb26f44fe50a8e07292b7654c795ff2a1629a788ea749f6c8bac81'
            '88a34bb93bca4ae5865f6c70d7d73f3a0009e5137ba2346a8446c6e206e51b20'
            '0cde21948f01baaa31a9a5f8af76444c7151ad39a0bc45d8e04de8b07837f0ad'
            '1644550a9be35253fe0a353fc004bd8576de3b85a6b21b92cbb0a87c03f37894'
            '4275689c2d4493ddcda3a40309a6bbdcdf6323bed80ca2e011138cdcd88da852'
            '629df2552826dc93446e3a7048dfd405663229f8882fa36537edeca012ba03ee'
            '441ae8cb636307f76e3907d755b1c41df6f16c84f04d5187f1bb0a9fda24c094')

prepare() {
  cd $pkgname-$pkgver
  # Upstream fixes
  patch -Np1 -i ../f9840c342e4b5767ee35f0d326b7f7eaf56850ed.patch
  patch -Np1 -i ../05ba23be296085313abd8d7d5075d962084f5d38.patch
  patch -Np1 -i ../0cc65e2f420af45f78d190ac2af64810a148bb31.patch

  # Remove deprecated libgnomeui dependency
  patch -Np1 -i ../cd2b658e83d47e8f49d1bbaf54be6433a21d3758.patch
  patch -Np1 -i ../fd8da8994f7006b9fcefc90d2fe5c2b484c7871e.patch

  # Install icons to datadir/icons/hicolor
  patch -Np1 -i ../8dd069a1e54c5b47e107f6df0db6ceb03e50c72d.patch
  patch -Np1 -i ../42e0d6b3f60b06bbe55b3ebad7ffc6edbf16e7e0.patch

  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-update-mimedb --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
              PYTHON=/usr/bin/python2

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
