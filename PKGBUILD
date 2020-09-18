# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=libgudev-nosystemd-git
pkgver=234
pkgrel=1
pkgdesc="GObject bindings for libudev"
url="https://wiki.gnome.org/Projects/libgudev"
arch=(x86_64)
license=(LGPL2.1)
depends=(glib2 libg{lib,object}-2.0.so libudev.so)
makedepends=(gobject-introspection gtk-doc git)
source=("git+https://gitlab.gnome.org/GNOME/libgudev.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

#check() {
#  cd $pkgname
#  make check
#}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --enable-gtk-doc \
    --disable-umockdev
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  provides=(libgudev-1.0.so libgudev)
  conflicts=(libgudev)

  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
