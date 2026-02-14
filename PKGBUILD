# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=cogl
pkgver=1.22.8
pkgrel=4
pkgdesc='An object oriented GL/GLES Abstraction/Utility Layer'
#url=https://blogs.gnome.org/clutter
url=https://gitlab.gnome.org/Archive/cogl
arch=(x86_64)
license=(SGI-B-1.1)
depends=(gdk-pixbuf2 libdrm libxcomposite libxdamage libxext libxrandr mesa pango)
makedepends=(git glib2-devel gobject-introspection gtk-doc)
provides=(libcogl.so libcogl-{gles2,pango,path}.so)
_commit=c2e25cef6bd7b3f12c8625f82956388e419cd046 # tags/1.22.8^0
source=("$pkgname-$pkgver::git+$url.git#commit=$_commit")
sha256sums=('6cf9974e735a8f7ce9d7af0c2e25e1dcac8b1728dece1e782c7e03bbd8556835')

pkgver() {
  git -C $pkgname-$pkgver describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname-$pkgver
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  export CFLAGS+=' -Wno-error=incompatible-pointer-types'
  ./configure --prefix=/usr \
    --enable-gles2 \
    --enable-{kms,wayland}-egl-platform \
    --enable-wayland-egl-server

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 et:
