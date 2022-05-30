# Maintainer: Adria Arrufat <adria.arrufat+AUR AT protonmail DOT ch>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alois Nespor <alois.nespor@gmail.com>

pkgname=kid3-cli
pkgver=3.9.1
pkgrel=1
pkgdesc="An MP3, Ogg/Vorbis and FLAC tag editor, CLI version"
arch=(i686 x86_64)
url="https://kid3.kde.org/"
license=(GPL)
depends=(chromaprint id3lib taglib libmp4v2 qt6-multimedia)
makedepends=(ninja chromaprint id3lib taglib libmp4v2 qt6-tools
             hicolor-icon-theme docbook-xsl extra-cmake-modules python)
conflicts=(kid3-kde kid3-qt)
provides=(kid3)
source=(http://downloads.sourceforge.net/${pkgname/-cli/}/${pkgname/-cli/}-$pkgver.tar.gz ffmpeg5.patch)
sha256sums=('e5f126697f773dbaa10476a76810ce91c2f3f60025d38688098e075bdb561dca'
            'e5e485e541411dec96864e25883e831b9e542944d017cb9a4838f22d6e4585ed')

prepare() {
  [ -d ${srcdir}/build ] && rm -rf build
  mkdir -p ${srcdir}/build
  patch -d kid3-$pkgver -p1 < ffmpeg5.patch # Fix build with FFmpeg 5
  cd "${srcdir}"/build
  cmake -GNinja \
    ../${pkgname/-cli/}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_APPS="CLI" \
    -DWITH_QML=OFF \
    -DWITH_MP4V2=ON \
    -DWITH_FFMPEG=ON \
    -DWITH_GSTREAMER=OFF
}

build() {
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
