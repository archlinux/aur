# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_name=libpcap
pkgname=lib32-libpcap
pkgver=1.10.1
pkgrel=1
pkgdesc="A system-independent interface for user-level packet capture (32-bit)"
arch=('x86_64')
url="http://www.tcpdump.org/"
license=('BSD')
depends=('lib32-glibc' 'lib32-libnl' "${_name}=${pkgver}")
makedepends=('bluez-libs' 'lib32-dbus')
provides=('libpcap.so')
source=("https://www.tcpdump.org/release/libpcap-${pkgver}.tar.gz"{,.sig})
sha512sums=('56c314f19c2b857742bf8abcb1e78066986aaa95cec339b75a3c8b70a9fa2b5167da98708352f9ec97a1cea2700cfb4e040bda108d58ac46cec9b7deab88d171'
            'SKIP')
b2sums=('0ec028e5d026a97b92ba6f23f88daf36b827eee08a752a0162fbabd1b5a2a70141ec403b6ff26dc3eb25ca5c6630c9c2f60f05b33161770da3d5e829c4eecdc6'
        'SKIP')
validpgpkeys=('1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D') # The Tcpdump Group (Package signing key) <release@tcpdump.org>

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  autoreconf -fiv
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
