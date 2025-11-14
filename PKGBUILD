# Maintainer: Bryan Jacobs <>

pkgname=libfido2-full
pkgver=1.16.0
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
sha512sums=('487424a993ff3c9cb48f96a8e15bdd1b0105b7ad840c6d44cdd683a53bc4fe500a42f51d1d0ab75f8e000c081af57ba95cb4c04c641ea4322c23a407d291f470'
            'SKIP')
b2sums=('857b24c5cf38db9620fc567f42b7af2a7fd4ca24433af1113ca41a040c2f8242abaa99fe2a3826640d42348221895b88064d447a4b064de6e04ae48add42de34'
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
