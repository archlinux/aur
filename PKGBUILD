# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: orumin <dev@orum.in>

_basename=clutter
pkgname="lib32-$_basename"
pkgver=1.26.2
pkgrel=1
pkgdesc="A toolkit for creating fast, portable, compelling dynamic UIs (32-bit)"
url="https://blogs.gnome.org/clutter/"
arch=(x86_64)
license=(LGPL)
depends=('lib32-gtk3' 'lib32-cogl' 'lib32-libinput' "$_basename")
makedepends=('gobject-introspection' 'gtk-doc' 'git')
_commit=2faa83baf3ce9b9c94635311ad79944ab2a73c84  # tags/1.26.2^0
source=("git+https://git.gnome.org/browse/clutter#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_basename
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_basename
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$_basename"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-introspection \
    --enable-egl-backend \
    --enable-gdk-backend \
    --enable-wayland-backend \
    --enable-x11-backend \
    --enable-evdev-input \
    --enable-wayland-compositor \
    --enable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$_basename"
  make DESTDIR="$pkgdir" install
  rm -rf ${pkgdir}/usr/{share,include}
}
