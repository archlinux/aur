# Maintainer: Bryan Jacobs <>

pkgname=libfido2-full
pkgver=1.13.0
pkgrel=1
pkgdesc='Library functionality for FIDO 2.0, with support for USB, NFC, and PCSC devices'
url='https://developers.yubico.com/libfido2/'
arch=('x86_64')
license=('BSD')
depends=('glibc' 'openssl' 'libcbor' 'libcbor.so' 'hidapi' 'systemd-libs'  'libudev.so' 'zlib' 'pcsclite')
makedepends=('cmake' 'systemd')
provides=('libfido2.so' 'libfido2')
conflicts=('libfido2')
source=("https://developers.yubico.com/libfido2/Releases/libfido2-${pkgver}.tar.gz"{,.sig})
sha512sums=('90f8452cee4c9cc72241478e697c5c692ccff5ab27752f2f296c3623ee297d1f80a85a359b4d0656c67790084c116aac921894e762eb52d3a79056e5014c03e7'
            'SKIP')
b2sums=('506e0ecf89825e313fbcb0de59ef0b1a3aab483013f959b391448da0600979780ae76807639231ab8a60eead039471bba707073ec4e259b611d67031ac7713f1'
        'SKIP')
validpgpkeys=(
  'EE90AE0D19774C8386628FAAB428949EF7914718' # pedro martelletto <pedro@yubico.com>
  '1D7308B0055F5AEF36944A8F27A9C24D9588EA0F' # Aveen Ismail <aveen.ismail@yubico.com>
  '7FBB6186957496D58C751AC20E777DD85755AA4A' # Konstantinos Georgantas <kostas@yubico.com>
  '78D997D53E9C0A2A205392ED14A19784723C9988' # Ludvig Michaelsson <ludvig.michaelsson@gmail.com>
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
