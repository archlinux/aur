# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=cogl
pkgver=1.22.2+22+ge023a361
pkgrel=1
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer"
url="https://blogs.gnome.org/clutter/"
arch=(x86_64)
license=(GPL2)
depends=(mesa libdrm libxext libxdamage libxcomposite gdk-pixbuf2 pango libxrandr)
makedepends=(gobject-introspection git gtk-doc)
_commit=e023a361e213d5d34f3cb49577788db05f645361  # cogl-1.22
source=("git+https://gitlab.gnome.org/GNOME/cogl.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr \
    --enable-gles{1,2} \
    --enable-{kms,wayland}-egl-platform \
    --enable-wayland-egl-server

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
