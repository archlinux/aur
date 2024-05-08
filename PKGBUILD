# Maintainer: Bryan Jacobs <>

pkgname=libfido2-full
pkgver=1.14.0
pkgrel=1
pkgdesc='Library functionality for FIDO 2.0, with support for USB, NFC, and PCSC devices'
url='https://developers.yubico.com/libfido2/'
arch=('x86_64')
license=('BSD-2-Clause')
depends=('glibc' 'openssl' 'libcbor' 'libcbor.so' 'hidapi' 'systemd-libs'  'libudev.so' 'zlib' 'pcsclite')
makedepends=('cmake' 'systemd')
provides=('libfido2.so' 'libfido2')
conflicts=('libfido2')
source=("https://developers.yubico.com/libfido2/Releases/libfido2-${pkgver}.tar.gz"{,.sig})
sha512sums=('83454b0db0cc8546f377d0dd59f95785fe6b73cf28e499a6182a6ece4b7bce17c3e750155262adf71f339ec0b3b6c3d3d64a07b01c8428b4b91de97ae768f0e6'
            'SKIP')
b2sums=('244ad33f73e7aeb3e4523eeda8402c0fcb9de08d28d15d5881651ca5e05b78b4bec10fe58c33dda08e8b5f7be231bf36a85463ded2733d762e929414e4749765'
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
    -DCMAKE_BUILD_TYPE=None \
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
