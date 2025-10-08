# Maintainer: Roland Suchan <snrd at arcor dot de>

pkgname=qdvdauthor
pkgver=2.4.1
pkgrel=2
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
  "https://sourceforge.net/projects/qdvd/files/qdvd-${pkgver}-qt6/qdvdauthor-${pkgver}-002.tar.gz"
  'https://ffmpeg.org/releases/ffmpeg-0.6.7.tar.bz2'
  'mathops_fix.patch'
  'found_ffmpeg.patch'
  'qxinewidget_stack_smashing_detected_fix.patch'
)
sha256sums=(
  '8bb0c53c5b16266be177042b35ca6148fe9dff22c6023cd103f4472c41d3db55'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
options=('debug' '!lto')

prepare() {
  patch -d ffmpeg-0.6.7 -p1 -i "${srcdir}/mathops_fix.patch"
  patch -d "$pkgname-$pkgver" -p1 -i "${srcdir}/found_ffmpeg.patch"
  patch -d "$pkgname-$pkgver" -p1 -i "${srcdir}/qxinewidget_stack_smashing_detected_fix.patch"
  cp -r ffmpeg-0.6.7 "${srcdir}/$pkgname-$pkgver/qrender"
}

build() {
  cd "${srcdir}/$pkgname-$pkgver/qrender/ffmpeg-0.6.7"
  
  CFLAGS="${CFLAGS} -Wno-incompatible-pointer-types -Wno-implicit-function-declaration" \
  ./configure \
    --prefix="${srcdir}/$pkgname-$pkgver/qrender/ffmpeg-0.6.7" \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --enable-static \
    --enable-shared \
    --libdir=lib \
    --incdir=include \
    --enable-pic \
    --disable-doc
    
  make
  make install

  cd ${srcdir}
  export PKG_CONFIG_LIBDIR="${srcdir}/$pkgname-$pkgver/qrender/ffmpeg-0.6.7/lib/pkgconfig"
  export PKG_CONFIG_PATH="${PKG_CONFIG_LIBDIR}:/usr/lib/pkgconfig:/usr/share/pkgconfig"

  cmake -S "qdvdauthor-${pkgver}" -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFFMPEG_DIRS="${srcdir}/$pkgname-$pkgver/qrender/ffmpeg-0.6.7"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
