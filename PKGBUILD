# Maintainer: orumin <dev at orum.in>

pkgname=lib32-libgphoto2
_basename=libgphoto2
pkgver=2.5.14+6+g695b55887
pkgrel=1
pkgdesc="The core library of gphoto2, designed to allow access to digital camera by external programs. (32-bit)"
arch=(x86_64)
url="http://www.gphoto.org/"
license=(LGPL)
depends=(lib32-libexif lib32-libjpeg lib32-gd lib32-libltdl lib32-libusb lib32-libxml2 libgphoto2)
makedepends=(autoconf-archive git)
_commit=695b558871fb5274d840647f71d42a77cfa7447f  # master
source=("git+https://github.com/gphoto/libgphoto2#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('7C4AFD61D8AAE7570796A5172209D6902F969C95') # Marcus Meissner

pkgver() {
  cd $_basename
  git describe --tags | sed 's/^libgphoto2-//;s/-release//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_basename
  autoreconf -fvi
}

build() {
  cd $_basename

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --disable-rpath --build=i686-pc-linux-gnu --libdir=/usr/lib32

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package() {
  cd $_basename
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/bin
  rm -r "$pkgdir"/usr/include
  rm -r "$pkgdir"/usr/share

  # Remove unused udev helper
  rm -r "$pkgdir/usr/lib32/udev"
}

