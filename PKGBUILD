# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: rtfreedman  <rob dot til dot freedman at gmail dot com>
# Contributor: Limao Luo <luolimao+AUR at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=rtaudio
pkgver=5.0.0
pkgrel=1
pkgdesc="A set of C++ classes that provide a common API for realtime audio input/output."
arch=('i686' 'x86_64')
url="http://www.music.mcgill.ca/~gary/rtaudio/"
license=('MIT')
depends=('jack' 'libpulse' 'python2')
source=("${url}release/${pkgname}-${pkgver}.tar.gz")
sha512sums=('390b6c454c42cf066fa94af397b784430dadc1650de320be377b7bbd09eda8705936bff3ee4327358815c3d5247a38fead81c8778cd85db30a12a6ace742c84a')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-alsa --with-jack --with-pulse
  sed -i 's/Requires: /Requires: jack/' rtaudio.pc
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  # Text documentation.
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 readme doc/release.txt "${pkgdir}/usr/share/doc/${pkgname}"

  # HTML documentation.
  install -d "${pkgdir}/usr/share/doc/${pkgname}/"{html,images}
  install -Dm644 doc/html/*  "${pkgdir}/usr/share/doc/${pkgname}/html"
  install -Dm644 doc/images/*  "${pkgdir}/usr/share/doc/${pkgname}/images"

  # License.
  csplit -s readme "%LEGAL AND%"
  install -Dm644 xx00 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install python2 bindings.
  cd contrib/python/pyrtaudio
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
