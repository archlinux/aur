# Maintainer: orumin <dev@orum.in>

_basename=gst-plugins-ugly
pkgname="lib32-$_basename"
pkgver=1.8.3
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Ugly Plugins (32-bit)"
arch=('x86_64')
license=('LGPL')
url="https://gstreamer.freedesktop.org/"
depends=('lib32-gst-plugins-base-libs' 'lib32-libdvdread' 'lib32-lame' 'lib32-libmpeg2' 'lib32-a52dec' 'lib32-libmad' 'lib32-libsidplay'
         'lib32-libcdio' 'lib32-libx264' 'lib32-opencore-amr' 'lib32-mpg123' 'gst-plugins-ugly')
makedepends=('python' 'x264')
options=(!emptydirs)
source=(${url}/src/$_basename/$_basename-$pkgver.tar.xz)
sha256sums=('6fa2599fdd072d31fbaf50c34af406e2be944a010b1f4eab67a5fe32a0310693')

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
