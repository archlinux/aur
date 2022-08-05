# Maintainer: Bryan Jacobs <>

pkgname=libfido2-full
pkgver=1.11.0
pkgrel=2
pkgdesc='Library functionality for FIDO 2.0, with support for USB, NFC, and PCSC devices'
url='https://developers.yubico.com/libfido2/'
arch=('x86_64')
license=('BSD')
depends=('glibc' 'openssl' 'libcbor' 'libcbor.so' 'hidapi' 'systemd-libs'  'libudev.so' 'zlib' 'pcsclite' 'libnfc')
makedepends=('cmake' 'systemd')
provides=('libfido2.so' 'libfido2')
conflicts=('libfido2')
source=("https://developers.yubico.com/libfido2/Releases/libfido2-${pkgver}.tar.gz"{,.sig})
sha512sums=('d9644453d67b84ec8385dfb63796adb3eae2d7f7cb47fbb1bcf9ca7f5cce400623738cc3317d629c2f0af630424cb2788217f8c7f20d1b52b7369c729052d572'
            'SKIP')
b2sums=('ac123145f22260922e1d83653ba5781c5f41b410760f2c26b7cab7cb0871079aed66a8d9747393843738e4c2ed7ba8ba0292075516ef0354fd4328df967b7a6d'
        'SKIP')
validpgpkeys=(
  'EE90AE0D19774C8386628FAAB428949EF7914718' # pedro martelletto <pedro@yubico.com>
  '1D7308B0055F5AEF36944A8F27A9C24D9588EA0F' # Aveen Ismail <aveen.ismail@yubico.com>
  '7FBB6186957496D58C751AC20E777DD85755AA4A' # Konstantinos Georgantas <kostas@yubico.com>
)

build() {
  cd libfido2-${pkgver}
  # do not use bundled udev rules superseded by systemd
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="${CFLAGS} ${CPPFLAGS}" \
    -Wno-dev \
    -DUSE_PCSC=1 \
    -DNFC_LINUX=1 \
    -S .
  make -C build VERBOSE=1
}

package() {
  cd libfido2-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
  install -Dm 644 NEWS README.adoc -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
