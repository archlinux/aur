# Maintainer: Roland Suchan <snrd at arcor dot de>

pkgname=qdvdauthor
pkgver=2.4.1
pkgrel=1
pkgdesc='A GUI frontend for dvdauthor, video DVD creator'
url='https://sourceforge.net/projects/qdvd'
license=('GPL2')
arch=('x86_64')
depends=(
  'bash'
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libm.so
  'qt6-base' # libQt6Core.so libQt6Gui.so libQt6Network.so libQt6PrintSupport.so libQt6Widgets.so libQt6Xml.so
  'xine-lib' # libxine.so
  'vlc'
  'libx11' # libX11.so
  'libva' 'libva.so'
  'libglvnd' 'libGLX.so' 'libOpenGL.so'
  'bzip2' 'libbz2.so'
  'zlib' 'libz.so'
)
makedepends=(
  'qt6-tools'
  'cmake'
  'extra-cmake-modules'
)
provides=(
  'dvd-slideshow'
  'qdvdauthor'
  'qplayer'
  'qslideshow'
  'qrender'
)
source=(
  "https://sourceforge.net/projects/qdvd/files/qdvd-${pkgver}-qt6/qdvdauthor-${pkgver}-014.tar.gz"
  'https://ffmpeg.org/releases/ffmpeg-0.6.7.tar.bz2'
  'mathops_fix.patch'
  'found_ffmpeg.patch'
)
sha256sums=(
  'b0b7a56881a3e74fb93a598c4e7e8cc34d91bc14c634a3aaef60c4fbcb1594fb'
  'SKIP'
  'SKIP'
  'SKIP'
)
options=('debug' '!lto')

prepare() {
  patch -d ffmpeg-0.6.7 -p1 -i "${srcdir}/mathops_fix.patch"
  patch -d "$pkgname-$pkgver" -p1 -i "${srcdir}/found_ffmpeg.patch"
}

build() {
  cd ffmpeg-0.6.7

  CFLAGS="${CFLAGS} -Wno-implicit-function-declaration" \
  ./configure \
    --prefix="${srcdir}/fakeroot" \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --enable-pic \
    --disable-doc

  make
  make install

  cd ..
  export PKG_CONFIG_LIBDIR="${srcdir}/fakeroot/lib/pkgconfig"
  export PKG_CONFIG_PATH="${PKG_CONFIG_LIBDIR}:/usr/lib/pkgconfig:/usr/share/pkgconfig"

  cmake -S "qdvdauthor-${pkgver}" -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFFMPEG_DIRS="${srcdir}/fakeroot"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
