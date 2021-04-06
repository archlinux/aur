# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Xavius <xavierelf@gmail.com>

_name=portaudio
pkgname=lib32-portaudio
pkgver=19.7.0
pkgrel=1
epoch=1
pkgdesc='A free, cross-platform, open source, audio I/O library (32 bit)'
arch=('x86_64')
url="https://github.com/portaudio/portaudio/"
license=('MIT')
depends=('lib32-glibc' "portaudio=${epoch}:${pkgver}")
makedepends=('lib32-alsa-lib' 'lib32-jack')
provides=('libportaudio.so' 'libportaudiocpp.so')
source=("${_name}-${pkgver}.tar.gz::https://github.com/${_name}/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('7e347a174109b661a685bcd617cc8fe00929c6fbf28f142fd7709a8ddbb9b5ed6e805be6647a44b4b9441b79e3474561de6f8e351b4ffc024952ed3e0e27ac1c')
b2sums=('db16882e97e60ab47b37c6d8851aa29e16e321531f3890f70390d89364aee2c1a9b42be09e7534f38d1c9ca48dd466b512874731049e42759a674571d6054220')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  (
    cd bindings/cpp
    autoreconf -fiv
  )
  autoreconf -fiv
}

build() {
  cd "${pkgname}-${pkgver}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr \
              --enable-cxx \
              --libdir=/usr/lib32
  # build breaks with multiple jobs when building C++ bindings:
  # https://github.com/PortAudio/portaudio/issues/540
  make -j1
}

package () {
  depends+=('libasound.so' 'libjack.so')
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.* -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
