# Maintainer: Endlesseden <eden @ rose.place>
# Archlinux Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Archlinux Contributor: Jan de Groot <jgc@archlinux.org>
# Archlinux Contributor: Tom Gundersen <teg@jklm.no>
# Archlinux Contributor: Eduardo Romero <eduardo@archlinux.org>
# Archlinux Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=libgphoto2-git
_pkgname=libgphoto2
pkgver=2.5.27+125+g590698165
pkgrel=1
pkgdesc="Digital camera access library"
url="http://www.gphoto.org/"
arch=("x86_64")
license=(LGPL)
conflicts=("$_pkgname")
depends=('libexif' 'libjpeg' 'gd' 'libltdl' 'libusb' 'libxml2' 'curl')
makedepends=('autoconf-archive' 'git')
provides=('libgphoto2.so' "$pkgname" "$_pkgname")
replaces=("$_pkgname")
source=("$pkgname"::"git+https://github.com/gphoto/libgphoto2")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^libgphoto2-//;s/-release//;s/^v//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  autoreconf -fvi
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --disable-rpath
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  # Remove unused udev helper
  rm -r "$pkgdir/usr/lib/udev"

  _genudev
}

_genudev() (
  cd "$pkgdir/usr/lib/libgphoto2"

  export LD_LIBRARY_PATH="$pkgdir/usr/lib${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH"
  export CAMLIBS="$PWD/$pkgver"

  ./print-camera-list hwdb \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/udev/hwdb.d/20-gphoto.hwdb"
  ./print-camera-list udev-rules version 201 \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/udev/rules.d/40-gphoto.rules"
)

# vim:set sw=2 et:
