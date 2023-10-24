# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-lite-git
pkgver=1.0.21.r15.g5f02072b
pkgrel=2
pkgdesc="A music player aimed at audio enthusiasts and music collectors, fewer fautures, Gstreamer and alsa only"
arch=(x86_64 i686 armv7h aarch64)
url="https://www.strawberrymusicplayer.org/"
license=(GPL3)
depends=(chromaprint protobuf gst-plugins-base gst-plugins-good qt6-base
         sqlite udisks2 dbus alsa-lib libcdio fftw libebur128 kdsingleapplication

         # namcap implicit depends
         glibc gcc-libs glib2 icu hicolor-icon-theme libx11 gstreamer
         abseil-cpp taglib gst-plugins-base-libs)
makedepends=(git cmake boost qt6-tools gtest)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
provides=(strawberry)
conflicts=(strawberry)
source=("git+https://github.com/jonaski/strawberry.git")
sha256sums=('SKIP')

pkgver() {
  cd strawberry
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd strawberry
  install -d strawberry-build
}

build() {
  cd strawberry/strawberry-build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DQT_NO_DEBUG_OUTPUT" \
    -DBUILD_WITH_QT6=ON \
    -DENABLE_TIDAL=OFF \
    -DENABLE_QOBUZ=OFF \
    -DENABLE_SUBSONIC=OFF \
    -DENABLE_LIBGPOD=OFF \
    -DENABLE_LIBMTP=OFF \
    -DENABLE_LIBPULSE=OFF \
    -DENABLE_VLC=OFF
  make
}

package() {
  cd strawberry/strawberry-build
  make DESTDIR="${pkgdir}" install
}
