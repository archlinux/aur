# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_name=libpcap
pkgname=lib32-libpcap
pkgver=1.10.3
pkgrel=1
pkgdesc="A system-independent interface for user-level packet capture (32-bit)"
arch=(x86_64)
url="http://www.tcpdump.org/"
license=(BSD)
depends=(lib32-glibc lib32-libnl $_name=$pkgver)
makedepends=(bluez-libs lib32-dbus)
provides=(libpcap.so)
options=(!staticlibs)
source=(https://www.tcpdump.org/release/$_name-$pkgver.tar.gz{,.sig})
sha512sums=('57bc07cbc8c326e203ce10ce1eb9f55760fc33320718d8643c65a68949334291877dffcf19af5f61eb9b4eda2d8ffe7bacee38363d2d6536cc85ae81c851684d'
            'SKIP')
b2sums=('3614042f7d8cd5a25221f52d2ed09f9f44643cdc0901ff21041ddb7ba85193c667036f7d989c8b59e6e205d630e062da46533110914dd287013a9ff80b31e97f'
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
