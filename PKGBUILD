# Maintainer: kyndair [at] gmail [dot] com
# Contributor: sasha <sashaa[removeme][at]disroot[dot]com>
# Contributor: blubbblubb <lampadada[removeme][at]googlemail[dot]com>

pkgname=loudgain-ffmpeg7
_pkgname=loudgain
pkgver=v0.7.1
_pkgver=0.7.1
pkgrel=1
pkgdesc="A loudness normalizer that scans music files and calculates loudness-normalized gain and loudness peak values according to the EBU R128 standard, and can optionally write ReplayGain-compatible metadata. Includes pull requests to work with ffmpeg 7.0"
url="https://github.com/kyndair/loudgain"
arch=('i686' 'x86_64')
license=('BSD 2-Clause "Simplified" License')
depends=('taglib1' 'libebur128')
conflicts=('taglib<2' 'loudgain')
makedepends=('cmake')
provides=('loudgain' 'rgbpm')
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/kyndair/loudgain/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('03ed070609f963984479f556f93c7497058fbc9e5011676e054a2a5869a6227e')

build() {
  export PKG_CONFIG_PATH=/usr/lib/taglib1/pkgconfig
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}/build"
  make DESTDIR="${pkgdir}/" install
  install -D -m755 ../bin/rgbpm ${pkgdir}/usr/bin/
  install -D -m644 "${srcdir}/${_pkgname}-${_pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
