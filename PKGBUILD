# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Xavius <xavierelf@gmail.com>

_name=portaudio
pkgname=lib32-portaudio
# versioning is very bizarre:
# https://app.assembla.com/wiki/show/portaudio/ReleaseNotes
_version=190600_20161030
pkgver=19.6.0
pkgrel=4
epoch=1
pkgdesc='A free, cross-platform, open source, audio I/O library. (32 bit)'
arch=('x86_64')
url="http://www.portaudio.com/"
license=('MIT')
depends=('lib32-glibc' 'portaudio')
makedepends=('gcc-multilib' 'lib32-alsa-lib' 'lib32-jack')
provides=('libportaudio.so')
source=("${pkgname}-${pkgver}.tgz::http://www.portaudio.com/archives/pa_stable_v${_version}.tgz")
sha256sums=('f5a21d7dcd6ee84397446fa1fa1a0675bb2e8a4a6dceb4305a8404698d8d1513')

prepare() {
  mv -v "${_name}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  autoreconf -vfi
}

build() {
  cd "${pkgname}-${pkgver}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr \
              --libdir=/usr/lib32
  make
}

package () {
  depends+=('libasound.so' 'libjack.so')
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
