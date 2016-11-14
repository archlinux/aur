# Maintainer: orumin <dev@orum.in>

_basename=cogl
pkgname="lib32-$_basename"
pkgver=1.22.2
pkgrel=2
pkgdesc="An object oriented GL/GLES Abstraction/Utility Layer (32-bit)"
arch=('x86_64')
url="http://www.clutter-project.org/"
license=('GPL2')
depends=('lib32-mesa' 'lib32-libdrm' 'lib32-libxext' 'lib32-libxdamage' 'lib32-libxcomposite' 'lib32-gdk-pixbuf2' 'lib32-pango' 'lib32-libxrandr' "$_basename")
makedepends=('gobject-introspection' 'git' 'gtk-doc')
options=(!emptydirs)
_commit=f38cda9046913c3627c52108467ba90e53d18c33
source=("git://git.gnome.org/cogl#commit=$_commit")
sha256sums=('SKIP')

#pkgver() {
#  cd $_basename
#  git describe --long | sed 's/-/+/g'
#}

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
    --build=i686-pc-linux-gnu \
    --libdir=/usr/lib32 \
    --enable-gles{1,2} \
    --enable-{kms,wayland}-egl-platform \
    --enable-wayland-egl-server 

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make -j1
}

package() {
  cd $_basename
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -r include share
}

# vim:set ts=2 sw=2 et:
