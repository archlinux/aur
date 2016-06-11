# Maintainer: orumin <dev@orum.in>

_basename=libevdev
pkgname="lib32-$_basename"
pkgver=1.5.1
pkgrel=1
pkgdesc="Wrapper library for evdev devices (32-bit)"
arch=('x86_64')
url="http://www.freedesktop.org/wiki/Software/libevdev/"
license=(custom:X11)
depends=('glibc' "$_basename")
makedepends=('python2' 'lib32-check' 'valgrind' 'doxygen')
#checkdepends=('kmod')
source=(http://freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz{,.sig})
sha256sums=('17630821a57e6e3f02e01ade836f24068df9bd530067091152b0d468c3a86f40'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr \
    --disable-static \
    --build=i686-pc-linux-gnu \
    --libdir=/usr/lib32 
  make
}
check() {
  cd $_basename-$pkgver
  # test suite requires root access and needs to load uinput module
  # that's not possible in our chroot
  #modprobe uinput
  make check || /bin/true
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -r bin include share
}
