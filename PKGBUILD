# $Id: PKGBUILD 187460 2016-08-24 16:03:31Z jlichtblau $
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alois Nespor <alois.nespor@gmail.com>

pkgname=kid3-cli
pkgver=3.4.3
pkgrel=1
pkgdesc="An MP3, Ogg/Vorbis and FLAC tag editor, CLI version"
arch=('i686' 'x86_64')
url="http://kid3.sourceforge.net/"
license=('GPL')
depends=('chromaprint' 'id3lib' 'taglib' 'libmp4v2' 'qt5-multimedia')
makedepends=('chromaprint' 'id3lib' 'taglib' 'libmp4v2' 'qt5-tools'
             'hicolor-icon-theme' 'docbook-xsl' 'extra-cmake-modules' 'python')
conflicts=('kid3-kde'' kid3-qt')
provides=('kid3')
changelog=${pkgname/-cli/}.changelog
source=(http://downloads.sourceforge.net/${pkgname/-cli/}/${pkgname/-cli/}-$pkgver.tar.gz
       fix-build-with-chromaprint-1.4.patch
)
sha256sums=('e8b03bb784fd4ef944ac4f31c770434719747c7750dee62f51efdfd61f4e3b2a'
            'b5f23564234c57576bfd20d229f8c988f9050cc77a0c76735135a73b8e96ebc2')

prepare() {
	cd ${srcdir}/kid3-${pkgver}
	patch -Np1 -i ../fix-build-with-chromaprint-1.4.patch
}

build() {
  mkdir -p ${srcdir}/build
  cd "${srcdir}"/build
  cmake \
    ../${pkgname/-cli/}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_APPS="CLI" \
    -DWITH_QML=OFF \
    -DWITH_MP4V2=ON \
    -DWITH_FFMPEG=ON \
    -DWITH_GSTREAMER=OFF \
    -DWITH_QT4=OFF \
    -DWITH_PHONON=OFF \

}

package() {
  cd "$srcdir"/build
  make DESTDIR="${pkgdir}" install
}
