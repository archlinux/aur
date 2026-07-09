# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=strawberry-git
pkgver=1.2.23.r0.g1e88a0451
pkgrel=1
pkgdesc="A music player aimed at audio enthusiasts and music collectors"
arch=(x86_64 i686 armv7h aarch64)
url="https://www.strawberrymusicplayer.org/"
license=(GPL-3.0-or-later)
depends=(
    alsa-lib
    chromaprint
    dbus
    fftw
    gdk-pixbuf2
    glib2
    glibc
    gst-plugins-base
    gst-plugins-base-libs
    gst-plugins-good
    gstreamer
    hicolor-icon-theme
    icu libicuuc.so libicui18n.so
    kdsingleapplication
    libcdio
    libebur128
    libgcc
    libgpod libgpod.so
    libimobiledevice
    libmtp
    libplist
    libpulse
    libstdc++
    libusbmuxd
    libx11
    qt6-base
    #sparsehash
    sqlite
    taglib
    udisks2
    )
makedepends=(
    boost
    cmake
    git
    qt6-tools
    rapidjson
    sparsehash
    vulkan-headers
    )
optdepends=(
    'gst-libav: additional codecs'
    'gst-plugins-bad: additional codecs'
    'gst-plugins-ugly: additional codecs'
    )
provides=(strawberry)
conflicts=(strawberry)
source=("git+https://github.com/jonaski/strawberry.git")
sha256sums=('SKIP')

pkgver() {
  cd strawberry
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  local _flags=(
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DQT_NO_DEBUG_OUTPUT"
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
