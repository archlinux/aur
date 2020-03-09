# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=cogl
pkgver=1.22.6
pkgrel=1
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer"
url="https://blogs.gnome.org/clutter/"
arch=(x86_64)
license=(GPL2)
depends=(mesa libdrm libxext libxdamage libxcomposite gdk-pixbuf2 pango
         libxrandr)
makedepends=(gobject-introspection git gtk-doc)
provides=(libcogl.so libcogl-{gles2,pango,path}.so)
_commit=dd104794b0d5e477e4ac2dbf3382f873fb40e5e1  # tags/1.22.6^0
source=("git+https://gitlab.gnome.org/GNOME/cogl.git#commit=$_commit"
        eglmesaext.diff)
sha256sums=('SKIP'
            '1d8909cbeea87964f1218bc545b17fa6d4369aadb63e9c2926ce7b17f76e6883')

pkgver() {
  cd $pkgname
  git describe | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # Fix building with libglvnd headers
  patch -Np1 -i ../eglmesaext.diff

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
