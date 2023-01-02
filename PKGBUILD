# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_name=libpcap
pkgname=lib32-libpcap
pkgver=1.10.2
pkgrel=1
pkgdesc="A system-independent interface for user-level packet capture (32-bit)"
arch=(x86_64)
url="http://www.tcpdump.org/"
license=(BSD)
depends=(lib32-glibc lib32-libnl $_name=$pkgver)
makedepends=(bluez-libs lib32-dbus)
provides=(libpcap.so)
options=(debug !staticlibs)
source=(https://www.tcpdump.org/release/$_name-$pkgver.tar.gz{,.sig})
sha512sums=('ccacebf367db44ab74e588f88a4fd7cd82c58e478e6c35414ae36df58fb06d85d542597485b1d1393edfaacc2bc5d35578b7b87fee4965f6dfde10a03d2ddd32'
            'SKIP')
b2sums=('f8280c8e12065b4d86e451df8504c834da9c94b25029f0e5c22359d0ce35cf4e3490fa3343d0112209600ea01ffa54249c82c20e2859515884daee759e4a5e9b'
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
