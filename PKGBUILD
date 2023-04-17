# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_name=libpcap
pkgname=lib32-libpcap
pkgver=1.10.4
pkgrel=1
pkgdesc="A system-independent interface for user-level packet capture (32-bit)"
arch=(x86_64)
url="http://www.tcpdump.org/"
license=(BSD)
depends=(
  lib32-glibc
  lib32-libnl
  $_name=$pkgver
)
makedepends=(
  bluez-libs
  lib32-dbus
)
provides=(libpcap.so)
options=(!staticlibs)
source=(https://www.tcpdump.org/release/$_name-$pkgver.tar.gz{,.sig})
sha512sums=('1f6d6ddd07dae7c557054cb246437ecdaf39d579592a5a6bdf1144eea6cb5a779ac4ca647cfed11ec1b0bb18efc63b845444e497070bacefaaed19a5787ae5e1'
            'SKIP')
b2sums=('05a7eafc1e1817f7844008db89d8fb10cd2525c22f7ee6c9e3d582b14229412f38ccced5e9d80a96dd459ef9eab12eccb5c1dd4978ddc9f66267469212005e4c'
        'SKIP')
validpgpkeys=('1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D') # The Tcpdump Group (Package signing key) <release@tcpdump.org>

prepare() {
  cd $_name-$pkgver
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --libdir=/usr/lib32
    --enable-ipv6
    --enable-bluetooth
    --enable-usb
    --with-libnl
  )
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"
  make
}

package() {
  depends+=(
    lib32-dbus libdbus-1.so
  )

  cd $_name-$pkgver

  make DESTDIR="$pkgdir" install

  # remove files provided by libpcap
  rm -rf "$pkgdir/usr/"{include,share,bin}

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGES,{CONTRIBUTING,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
