# Maintainer: blubbblubb <lampadada[removeme][at]googlemail[dot]com>

pkgname=loudgain
pkgver=v0.3.2
_pkgver=0.3.2
pkgrel=1
pkgdesc="A loudness normalizer that scans music files and calculates loudness-normalized gain and loudness peak values according to the EBU R128 standard, and can optionally write ReplayGain-compatible metadata."
url="https://github.com/Moonbase59/loudgain"
arch=('i686' 'x86_64')
license=('BSD 2-Clause "Simplified" License')
depends=("taglib" "libebur128" "libavresample")
provides=('loudgain' 'rgbpm.sh')
source=("https://github.com/Moonbase59/loudgain/archive/$pkgver.tar.gz"
        "ffmpegInputBuffer.patch")
sha256sums=('0c2197f53686b6e336d766f38c120817f73626e1dc33a682ed3e6ce037f26099'
            '34e637879b89437bf1098966e48174ec805ef6e5aa13d36cbd769a4077bfdde6')

prepare() {
  patch "${srcdir}/${pkgname}-${_pkgver}/src/scan.c" "${srcdir}/ffmpegInputBuffer.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  make DESTDIR="${pkgdir}/" install
  install -D -m755 ../bin/rgbpm.sh ${pkgdir}/usr/bin/
  install -D -m644 "${srcdir}/${pkgname}-${_pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
