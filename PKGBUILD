# Maintainer: blubbblubb <lampadada[removeme][at]googlemail[dot]com>

pkgname=loudgain
pkgver=v0.6.8
_pkgver=0.6.8
pkgrel=6
pkgdesc="A loudness normalizer that scans music files and calculates loudness-normalized gain and loudness peak values according to the EBU R128 standard, and can optionally write ReplayGain-compatible metadata."
url="https://github.com/Moonbase59/loudgain"
arch=('i686' 'x86_64')
license=('BSD 2-Clause "Simplified" License')
depends=("taglib1" "libebur128" "ffmpeg")
conflicts=("taglib<2")
makedepends=('cmake')
provides=('loudgain' 'rgbpm')
source=("loudgain-${_pkgver}.tar.gz::https://github.com/Moonbase59/loudgain/archive/${pkgver}.tar.gz"
        "fix_ffmpeg5.patch"
        "fix_mp4-asf.patch"
        "taglib1.patch")
sha256sums=('1137c193ad941b366e87c5d84ccc95a7aa8571affc060db0bd1cf72c489aeaee'
            '73c1cc5d416e2b5b73a4deac1ef2b563d289976c296c24b39c1e8d740333d2ff'
            '5c23a8cbee1e919f7dfe36c16652d8dfdd7e44dae0aa5dfd453fad4ba8c2a0b9'
            'cfd687554d132f2de6be159a91c91fa31e2e1d3cb5c34987416055871f061f79')

prepare() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  patch --forward --strip=1 --input="${srcdir}/fix_ffmpeg5.patch"
  patch --forward --strip=1 --input="${srcdir}/fix_mp4-asf.patch"
  patch --forward --strip=1 --input="${srcdir}/taglib1.patch"
}

build() {
  export PKG_CONFIG_PATH=/usr/lib/taglib1/pkgconfig
  cd "${srcdir}/${pkgname}-${_pkgver}"
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  make DESTDIR="${pkgdir}/" install
  install -D -m755 ../bin/rgbpm ${pkgdir}/usr/bin/
  install -D -m644 "${srcdir}/${pkgname}-${_pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
