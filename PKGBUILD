# Maintainer: Ionut Biru <ibiru@archlinux.org>

pkgname=cogl
pkgver=1.22.0+11+g81ab4a3
pkgrel=1
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('GPL2')
depends=('mesa' 'libdrm' 'libxext' 'libxdamage' 'libxcomposite' 'gdk-pixbuf2' 'pango' 'libxrandr')
makedepends=('gobject-introspection' 'git' 'gtk-doc')
options=(!emptydirs)
source=('git://git.gnome.org/cogl#commit=81ab4a3e')
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/-/+/g'
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

  make -j1
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
