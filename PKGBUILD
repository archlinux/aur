# Maintainer: orumin <dev@orum.in>

_basename=gst-libav
pkgname="lib32-$_basename"
pkgver=1.8.1
pkgrel=1
pkgdesc="Gstreamer libav Plugin (32-bit)"
arch=('x86_64')
license=('GPL')
url="http://gstreamer.freedesktop.org/"
depends=('lib32-gst-plugins-base-libs' 'bzip2' 'lib32-ffmpeg' 'gst-libav')
makedepends=('python')
options=(!emptydirs)
provides=("lib32-gst-ffmpeg=$pkgver-$pkgrel")
source=(${url}/src/$_basename/$_basename-$pkgver.tar.xz)
sha256sums=('44a49108c3531b5ac4f346a2247cd7fbafb0e8ab394394cb6d75a70300b38933')

prepare() {
  cd $_basename-$pkgver
}

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 \
    --disable-static --with-libav-extra-configure="--enable-runtime-cpudetect" \
    --with-package-name="GStreamer libav Plugin (Arch Linux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --with-system-libav

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
