# Maintainer: newordLT <aneworld [at] gmail [DoT] com>

pkgname=livecv
pkgver=1.5.0
pkgrel=1
pkgdesc="Computer vision coding environment that displays results in real time"
arch=('x86_64')
url="https://github.com/livecv/${pkgname}"
license=('LGPL3')
depends=("opencv" "qt5-quickcontrols")
makedepends=("qt5-base")
source=("livecv-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "livecv.in.patch")
sha256sums=('c2cdb499c1c65538c049d6e776289b15f82b599f4a551cb4d37013981ffc254b'
            '87993897bb93921053a8fc9e85a11827172f4ca56879c3955b925ef1b59328eb')
provides=('livecv')

prepare () {
  cd "${srcdir}/livecv-${pkgver}"

  patch -p1 -i "${srcdir}/livecv.in.patch"
}

build() {
  cd "$srcdir/livecv-${pkgver}"

  qmake -r
  make
}

package() {
  cd "${srcdir}/livecv-${pkgver}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/lib/livecv"
  mkdir -p "${pkgdir}/usr/lib/livecv/link"

  cp bin/lib*.so "${pkgdir}/usr/lib/"
  cp -r bin/* "${pkgdir}/usr/lib/livecv/"

  ln -r -s "${pkgdir}/usr/lib/livecv/plugins/editor/libeditor.so" "${pkgdir}/usr/lib/livecv/link/libeditor.so"
  ln -r -s "${pkgdir}/usr/lib/livecv/plugins/lcvcore/liblcvcore.so" "${pkgdir}/usr/lib/livecv/link/liblcvcore.so"
  ln -r -s "${pkgdir}/usr/lib/livecv/plugins/lcvfeatures2d/liblcvfeatures2d.so" "${pkgdir}/usr/lib/livecv/link/liblcvfeatures2d.so"
  ln -r -s "${pkgdir}/usr/lib/livecv/plugins/lcvimgproc/liblcvimgproc.so" "${pkgdir}/usr/lib/livecv/link/liblcvimgproc.so"
  ln -r -s "${pkgdir}/usr/lib/livecv/plugins/lcvphoto/liblcvphoto.so" "${pkgdir}/usr/lib/livecv/link/liblcvphoto.so"
  ln -r -s "${pkgdir}/usr/lib/livecv/plugins/lcvvideo/liblcvvideo.so" "${pkgdir}/usr/lib/livecv/link/liblcvvideo.so"
  ln -r -s "${pkgdir}/usr/lib/livecv/plugins/live/liblive.so" "${pkgdir}/usr/lib/livecv/link/liblive.so"

  ln -r -s "${pkgdir}/usr/lib/livecv/livecv" "${pkgdir}/usr/bin/livecv"
}
