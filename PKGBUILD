# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.17.7
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
url="https://wiki.gnome.org/Projects/libgdata"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsoup' 'liboauth' 'gcr' 'gnome-online-accounts')
makedepends=('intltool' 'gobject-introspection' 'vala' 'uhttpmock' 'git' 'gtk-doc' 'autoconf-archive')
_commit=209aa98488bbc08e54b41faad8b65426ac62ae32  # tags/0.17.7^0
source=("git+https://git.gnome.org/browse/libgdata#commit=$_commit"
        0001-tests-Fix-setting-properties-on-i686.patch)
sha256sums=('SKIP'
            '7618eb05c30130132a66b719d6d0427a37a9cb266dcde4e03237b591008880bf')

pkgver() {
  cd $pkgname
  git describe --tags | sed -e 's/-/+/g'
}

prepare() {
  cd $pkgname
  patch -Np1 -i ../0001-tests-Fix-setting-properties-on-i686.patch
  NOCONFIGURE=1 ./autogen.sh
}
  

build() {
  cd $pkgname
  ./configure --prefix=/usr --disable-static --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
