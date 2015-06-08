# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kid3-kf5-git
pkgver=3.2.1.r1551.2f005a5
pkgrel=1
pkgdesc='An MP3, Ogg/Vorbis and FLAC tag editor. Compatible with KF5 frameworks (GIT Version)'
arch=('i686' 'x86_64')
url='http://kid3.sourceforge.net/'
license=('GPL')
depends=('qt5-multimedia' 'kio' 'id3lib' 'taglib' 'chromaprint' 'libmp4v2' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'kdoctools' 'python')
conflicts=('kid3' 'kid3d-qt' 'kid3-kf5')
provides=('kid3' 'kid3-qt' 'kid3-kf5')
source=("kid3::git://git.code.sf.net/p/kid3/code")
sha1sums=('SKIP')
install=kid3-kf5-git.install

pkgver() {
  cd kid3
  _ver="$(cat CMakeLists.txt | grep -e CPACK_PACKAGE_VERSION_MAJOR -e CPACK_PACKAGE_VERSION_MINOR -e CPACK_PACKAGE_VERSION_PATCH | head -n3 | sed 's|  ||g' | tr -d ')' | cut -d ' ' -f2)"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kid3 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_QT5=ON \
    -DWITH_APPS="CLI;KDE" \
    -DWITH_MP4V2=ON \
    -DWITH_FFMPEG=ON \
    -DWITH_GSTREAMER=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
