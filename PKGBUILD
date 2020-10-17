# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_name=libpcap
pkgname=lib32-libpcap
pkgver=1.9.1
pkgrel=2
pkgdesc="A system-independent interface for user-level packet capture (32-bit)"
arch=('x86_64')
url="http://www.tcpdump.org/"
license=('BSD')
depends=('lib32-glibc' 'lib32-libnl' "${_name}=${pkgver}")
makedepends=('bluez-libs' 'lib32-dbus')
provides=('libpcap.so')
source=("https://www.tcpdump.org/release/libpcap-${pkgver}.tar.gz"{,.sig})
sha512sums=('ae0d6b0ad8253e7e059336c0f4ed3850d20d7d2f4dc1d942c2951f99a5443a690f0cc42c6f8fdc4a0ccb19e9e985192ba6f399c4bde2c7076e420f547fddfb08'
            'SKIP')
b2sums=('c217f7080c9f570e1ce7c54359cbf50b6be54658187a78789a8235a61091de6b488c6ef3eb65eae6f3196ce9f5b059e30bb69cbb6ee87abe1c46906e35ff8ca4'
        'SKIP')
validpgpkeys=('1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D') # The Tcpdump Group (Package signing key) <release@tcpdump.org>

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  autoreconf -vfi
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-ipv6 \
    --enable-bluetooth \
    --enable-usb \
    --with-libnl
  make
}

package() {
  depends+=('libdbus-1.so')
  cd "${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install

  # remove files provided by libpcap
  rm -rf "${pkgdir}"/usr/lib32/libpcap.a
  rm -rf "${pkgdir}"/usr/{include,share,bin}

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGES,{CONTRIBUTING,README}.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
