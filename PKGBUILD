# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: orumin <dev@orum.in>

_basename=cogl
pkgname="lib32-$_basename"
pkgver=1.22.4
pkgrel=1
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer (32-bit)"
url="https://blogs.gnome.org/clutter/"
arch=(x86_64)
license=(GPL2)
depends=('lib32-mesa' 'lib32-libdrm' 'lib32-libxext' 'lib32-libxdamage' 'lib32-libxcomposite' 'lib32-gdk-pixbuf2' 'lib32-pango' 'lib32-libxrandr' "$_basename")
makedepends=('gobject-introspection' 'git' 'gtk-doc')
options=(!emptydirs)
_commit=60015d7d9756a89fb608887b52fa6b6a5a7db18d # tags/1.22.4^0
source=("git+https://gitlab.gnome.org/GNOME/cogl.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_basename
  git describe | sed 's/-/+/g'
}

prepare() {
  cd $_basename
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_basename

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-gles{1,2} \
    --enable-{kms,wayland}-egl-platform \
    --enable-wayland-egl-server 

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_basename
  make DESTDIR="$pkgdir" install

  rm -rf ${pkgdir}/usr/{share,include}
}

# vim:set ts=2 sw=2 et:
