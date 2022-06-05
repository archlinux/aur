# Maintainer: Roland Suchan <snrd at arcor dot de>

pkgname=qdvdauthor
pkgver=2.3.1
pkgrel=13
pkgdesc='QDVDAuthor is a GUI frontend for dvdauthor, video DVD creator'
url='https://sourceforge.net/projects/qdvd'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt5-base' 'ffmpeg063-static' 'vlc' 'xine-lib' 'libx11')
makedepends=('cmake' 'extra-cmake-modules')
conflicts=()
provides=(
  'dvd-slideshow'
  'qdvdauthor'
  'qplayer'
  'qslideshow'
  'qrender'
)
options=()
source=("https://sourceforge.net/projects/qdvd/files/qdvd-2.3.1-qt5/qdvdauthor-${pkgver}-013.tar.gz")
md5sums=('fe87ed22c8093acdf646f79b59db79ae')

build() {
  cd qdvdauthor-${pkgver}/
  
  cat CMakeLists.txt | sed -e 's|/usr/local/lib64/libavcodec.so|#/usr/local/lib64/libavcodec.so|g' > CMakeLists_new.txt
  cat CMakeLists_new.txt | sed -e 's|/usr/local/lib64/libavformat.so|#/usr/local/lib64/libavformat.so|g' > CMakeLists_new2.txt
  cat CMakeLists_new2.txt | sed -e 's|/usr/local/lib64/libavutil.so|#/usr/local/lib64/libavutil.so|g' > CMakeLists_new3.txt
  cat CMakeLists_new3.txt | sed -e 's|/usr/local/lib64/libswscale.so|#/usr/local/lib64/libswscale.so|g' > CMakeLists_new4.txt

  cat CMakeLists_new4.txt | sed -e 's|#/usr/local/lib/libavcodec.so|/usr/local/lib/libavcodec.so|g' > CMakeLists_new5.txt
  cat CMakeLists_new5.txt | sed -e 's|#/usr/local/lib/libavformat.so|/usr/local/lib/libavformat.so|g' > CMakeLists_new6.txt
  cat CMakeLists_new6.txt | sed -e 's|#/usr/local/lib/libavutil.so|/usr/local/lib/libavutil.so|g' > CMakeLists_new7.txt
  cat CMakeLists_new7.txt | sed -e 's|#/usr/local/lib/libswscale.so|/usr/local/lib/libswscale.so|g' > CMakeLists_new8.txt
  rm CMakeLists_new.txt CMakeLists_new2.txt CMakeLists_new3.txt CMakeLists_new4.txt CMakeLists_new5.txt CMakeLists_new6.txt CMakeLists_new7.txt
  mv CMakeLists_new8.txt CMakeLists.txt
  
  cd qdvdauthor-${pkgver}/build
  
  cmake ../. -DCMAKE_INSTALL_PREFIX=/usr 
  make clean 
  make "-j$(nproc)" || return 1
}
 
package() {
  cd qdvdauthor-${pkgver}/build
  
  make DESTDIR="$pkgdir" install
}
