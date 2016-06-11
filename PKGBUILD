# Maintainer: orumin <dev@orum.in>

_basename=libinput
pkgname="lib32-$_basename"
pkgver=1.3.0
pkgrel=2
pkgdesc="library that handles input devices for display servers and other applications that need to directly deal with input devices. (32-bit)"
arch=('x86_64')
url="http://www.freedesktop.org/wiki/Software/libinput/"
license=(custom:X11)
depends=('lib32-mtdev' 'lib32-systemd' 'lib32-libevdev' 'lib32-libwacom' 'lib32-libunwind' "$_basename")
checkdepends=('lib32-check')
install=libinput.install
options=('!libtool')
source=(http://freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz{,.sig}
        touchpad_only_use_negative_pressure_change_check.diff)
sha256sums=('998a75fb261d161efaa7da44411cdc9a32a953280e4ffc6322ca19f057d0c1ea'
            'SKIP'
            'bfc71b3c3c18ab6dc6cb076e7b0410b5f3a51aa7b7db34f7fd35dd79c9615806')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd $_basename-$pkgver
  # fix slow touchpad input, FS#49397
  patch -Np1 -i ${srcdir}/touchpad_only_use_negative_pressure_change_check.diff
}

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --disable-static \
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
