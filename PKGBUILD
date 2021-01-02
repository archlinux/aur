# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_name=libpcap
pkgname=lib32-libpcap
pkgver=1.10.0
pkgrel=1
pkgdesc="A system-independent interface for user-level packet capture (32-bit)"
arch=('x86_64')
url="http://www.tcpdump.org/"
license=('BSD')
depends=('lib32-glibc' 'lib32-libnl' "${_name}=${pkgver}")
makedepends=('bluez-libs' 'lib32-dbus')
provides=('libpcap.so')
source=("https://www.tcpdump.org/release/libpcap-${pkgver}.tar.gz"{,.sig})
sha512sums=('007710386ff3435ef97fc99293076eae3c39b424e986141184c712b0285f8589357a1b25085f7eba28730de04312042c724d193934a399797e95a56f5301da7f'
            'SKIP')
b2sums=('54e809af242b18d600b88f29bbe31b01784b5160366242f313908b58dfb1e6ee2ceae8d359f730881e15c1b26ed90c553869dffb25a74eb3cea9f597dd490b1d'
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
