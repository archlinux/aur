# Maintainer: orumin <dev@orum.in>

_basename=clutter
pkgname="lib32-$_basename"
pkgver=1.26.0
pkgrel=1
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces (32-bit)"
arch=('x86_64')
url="http://clutter-project.org/"
license=('LGPL')
depends=('lib32-gtk3' 'lib32-cogl' 'lib32-libinput' "$_basename")
makedepends=('gobject-introspection')
source=(https://download.gnome.org/sources/$_basename/${pkgver:0:4}/$_basename-$pkgver.tar.xz)
sha256sums=('67514e7824b3feb4723164084b36d6ce1ae41cb3a9897e9f1a56c8334993ce06')

build() {
  cd "$_basename-$pkgver"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr \
    --build=i686-pc-linux-gnu \
    --libdir=/usr/lib32 \
    --enable-introspection \
    --enable-egl-backend \
    --enable-gdk-backend \
    --enable-wayland-backend \
    --enable-x11-backend \
    --enable-evdev-input \
    --enable-wayland-compositor \
    --disable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "$_basename-$pkgver"
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -r include share
}
