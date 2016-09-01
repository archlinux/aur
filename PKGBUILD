# Maintainer: orumin <dev@orum.in>

_basename=libinput
pkgname="lib32-$_basename"
pkgver=1.4.2
pkgrel=1
pkgdesc="library that handles input devices for display servers and other applications that need to directly deal with input devices. (32-bit)"
arch=('x86_64')
url="http://www.freedesktop.org/wiki/Software/libinput/"
license=(custom:X11)
depends=('lib32-mtdev' 'lib32-systemd' 'lib32-libevdev' 'lib32-libwacom' 'lib32-libunwind' "$_basename")
checkdepends=('lib32-check')
install=libinput.install
options=('!libtool')
source=(https://freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz{,.sig})
sha256sums=('8c38826a785594811bef6a9daadbfa2e172e3f070f8863393d6fb7ca4c68e451'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --disable-static --disable-tests \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 
  make
}

check() {
  cd $_basename-$pkgver
# disabled for now:
# https://github.com/libcheck/check/issues/18
#  make check
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -r bin include share
}
