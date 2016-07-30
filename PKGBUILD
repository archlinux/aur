# Maintainer: orumin <dev@orum.in>

_basename=libevdev
pkgname="lib32-$_basename"
pkgver=1.5.2
pkgrel=2
pkgdesc="Wrapper library for evdev devices (32-bit)"
arch=('x86_64')
url="http://www.freedesktop.org/wiki/Software/libevdev/"
license=(custom:X11)
depends=('glibc' "$_basename")
makedepends=('python2' 'lib32-check' 'valgrind' 'doxygen')
#checkdepends=('kmod')
source=(http://freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz{,.sig})
sha256sums=('5ee2163656a61f5703cb5c08a05c9471ffb7b640bfbe2c55194ea50d908f629b'
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
