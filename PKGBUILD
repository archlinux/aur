# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=cogl
pkgver=1.22.8
pkgrel=2
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
  cd cogl
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd cogl
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd cogl
  ./configure --prefix=/usr \
    --enable-gles2 \
    --enable-{kms,wayland}-egl-platform \
    --enable-wayland-egl-server

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd cogl
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 et:
