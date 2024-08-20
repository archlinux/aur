# Maintainer: Roland Suchan <snrd at arcor dot de>

pkgname=qdvdauthor
pkgver=2.3.1
pkgrel=15
pkgdesc='A GUI frontend for dvdauthor, video DVD creator'
url='https://sourceforge.net/projects/qdvd'
license=('GPL2')
arch=('x86_64')
depends=(
  'bash'
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libm.so
  'qt5-base' # libQt5Core.so libQt5Gui.so libQt5Network.so libQt5PrintSupport.so libQt5Widgets.so libQt5Xml.so
  'xine-lib' # libxine.so
  'vlc'
  'libx11' # libX11.so
  'libva' 'libva.so'
  'libglvnd' 'libGLX.so' 'libOpenGL.so'
  'bzip2' 'libbz2.so'
  'zlib' 'libz.so'
)
makedepends=(
  'qt5-tools'
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
  "https://sourceforge.net/projects/qdvd/files/qdvd-${pkgver}-qt5/qdvdauthor-${pkgver}-015.tar.gz"
  'https://ffmpeg.org/releases/ffmpeg-0.6.7.tar.bz2'
  'mathops_fix.patch'
  'found_ffmpeg.patch'
  'qxinewidget_stack_smashing_detected_fix.patch'
)
sha256sums=(
  'f539e4f587e8531f30da97d1655033150b643b56e609bf76e25ee8ebf984fd39'
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
    --prefix="${srcdir}/$pkgname-$pkgver/qrender/ffmpeg-0.6.7"  \
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
  #export PKG_CONFIG_LIBDIR="${srcdir}/ffmpeg-0.6.7/lib/pkgconfig"
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

post_install() {
  ldconfig
}

post_upgrade() {
  ldconfig
}
