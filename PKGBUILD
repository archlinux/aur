# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-lite
pkgver=1.2.7
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors, fewer fautures, Gstreamer and alsa only"
arch=(x86_64 i686 armv7h aarch64)
url="https://www.strawberrymusicplayer.org/"
license=(GPL-3.0-or-later)
depends=(chromaprint gst-plugins-base gst-plugins-good qt6-base
         sqlite udisks2 dbus alsa-lib libcdio fftw libebur128 kdsingleapplication

         libicuuc.so libicui18n.so

         # namcap implicit depends
         glibc gcc-libs glib2 icu hicolor-icon-theme libx11 gstreamer
         taglib gst-plugins-base-libs)
makedepends=(git cmake boost qt6-tools)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
provides=(strawberry)
conflicts=(strawberry)
source=("git+https://github.com/jonaski/strawberry.git#tag=${pkgver}")
sha256sums=('a8782c616e8abf3e41d23f3c2125b21584ea6a250f8041872ca2c5be221924f2')

build() {
  local _flags=(
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DQT_NO_DEBUG_OUTPUT"
    -DENABLE_TIDAL=OFF
    -DENABLE_QOBUZ=OFF
    -DENABLE_SPOTIFY=OFF
    -DENABLE_SUBSONIC=OFF
    -DENABLE_GPOD=OFF
    -DENABLE_MTP=OFF
    -DENABLE_PULSE=OFF
    #-DENABLE_STREAMTAGREADER=OFF
  )

  cmake -B build -S "strawberry" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
