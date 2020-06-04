# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=cogl
pkgver=1.22.8
pkgrel=1
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer"
url="https://blogs.gnome.org/clutter/"
arch=(x86_64)
license=(GPL2)
depends=(mesa libdrm libxext libxdamage libxcomposite gdk-pixbuf2 pango
         libxrandr)
makedepends=(gobject-introspection git gtk-doc)
provides=(libcogl.so libcogl-{gles2,pango,path}.so)
_commit=c2e25cef6bd7b3f12c8625f82956388e419cd046  # tags/1.22.8^0
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
    --enable-gles2 \
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
