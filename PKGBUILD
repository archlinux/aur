# Maintainer: orumin <dev@orum.in>

_basename=gst-plugins-ugly
pkgname="lib32-$_basename"
pkgver=1.8.1
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Ugly Plugins (32-bit)"
arch=('x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('lib32-gst-plugins-base-libs' 'lib32-libdvdread' 'lib32-lame' 'lib32-libmpeg2' 'lib32-a52dec' 'lib32-libmad' 'lib32-libsidplay'
         'lib32-libcdio' 'lib32-libx264' 'lib32-opencore-amr' 'lib32-mpg123' 'gst-plugins-ugly')
makedepends=('python' 'x264')
options=(!emptydirs)
source=(${url}/src/$_basename/$_basename-$pkgver.tar.xz)
sha256sums=('8e656a9a3be60d7e7ed3fb8e2a22d070b1f54f95d0b22accd876360e659446ce')

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 \
    --disable-static --enable-experimental --disable-gtk-doc \
    --with-package-name="GStreamer Ugly Plugins (Arch Linux)" \
    --with-package-origin="http://www.archlinux.org/"

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $_basename-$pkgver
  make check
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir"/usr/share
}
