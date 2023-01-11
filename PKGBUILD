# Maintainer: Bryan Jacobs <>

pkgname=libfido2-full
pkgver=1.12.0
pkgrel=0
pkgdesc='Library functionality for FIDO 2.0, with support for USB, NFC, and PCSC devices'
url='https://developers.yubico.com/libfido2/'
arch=('x86_64')
license=('BSD')
depends=('glibc' 'openssl' 'libcbor' 'libcbor.so' 'hidapi' 'systemd-libs'  'libudev.so' 'zlib' 'pcsclite')
makedepends=('cmake' 'systemd')
provides=('libfido2.so' 'libfido2')
conflicts=('libfido2')
source=("https://developers.yubico.com/libfido2/Releases/libfido2-${pkgver}.tar.gz"{,.sig})
sha512sums=('ae8c716fe9b2fa52f191c4b3fe61442ba0b7a364a23c6c3a29afdba4f47c5eff89cb1d6c9fcacaefd7d4ebce641d35600527ee33934786c2096ac97f78e9418f'
            'SKIP')
b2sums=('e206c9c76e27037c49d3b0e842487b0711559483eb9ae638590bb7175761251c6f60dae6c6dc6cc8b13e49b9f32432ce4368e709b4aacf71f43b760092e3b00d'
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
