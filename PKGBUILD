# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-lite
pkgver=1.2.23
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors, fewer features, Gstreamer and alsa only"
arch=(x86_64 i686 armv7h aarch64)
url="https://www.strawberrymusicplayer.org/"
license=(GPL-3.0-or-later)
depends=(
    alsa-lib
    chromaprint
    dbus
    fftw
    glib2
    glibc
    gst-plugins-base
    gst-plugins-base-libs
    gst-plugins-good
    gstreamer
    hicolor-icon-theme
    icu libicuuc.so
    kdsingleapplication
    libcdio
    libebur128
    libgcc
    libstdc++
    libx11
    qt6-base
    sqlite
    taglib
    udisks2
    )
makedepends=(
    boost
    cmake
    git
    qt6-tools
    #rapidjson
    #sparsehash
    vulkan-headers
    )
optdepends=(
    'gst-libav: additional codecs'
    'gst-plugins-bad: additional codecs'
    'gst-plugins-ugly: additional codecs'
    )
provides=(strawberry)
conflicts=(strawberry)
source=("git+https://github.com/jonaski/strawberry.git#tag=${pkgver}")
sha256sums=('fd4eb07a45d27bc98c2090c50c213addb7d6dc747c0ac16dc9dbd51c73bd1e8c')

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  local _flags=(
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DQT_NO_DEBUG_OUTPUT"
    -DENABLE_DEBUG_OUTPUT=OFF
    -DENABLE_DISCORD_RPC=OFF
    -DENABLE_GPOD=OFF
    -DENABLE_MTP=OFF
    -DENABLE_PULSE=OFF
    -DENABLE_QOBUZ=OFF
    -DENABLE_SPOTIFY=OFF
    -DENABLE_STREAMTAGREADER=OFF
    -DENABLE_SUBSONIC=OFF
    -DENABLE_TIDAL=OFF
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
