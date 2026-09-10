# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: zan <zan@420blaze.it>
# Contributor: Jacob Henner <code@ventricle.us>
# Contributor: Eduardo Sánchez Muñoz
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

# Based on community/clementine PKGBUILD

pkgname=clementine-git
pkgver=1.4.1.r131.g69ae62d68.0.g69ae62d68
pkgrel=2
pkgdesc='A modern music player and library organizer'
arch=(x86_64)
url="https://github.com/clementine-player/Clementine"
license=(GPL-3.0-or-later)
depends=(
    abseil-cpp
    alsa-lib
    chromaprint
    fftw
    glib2
    glibc
    gst-plugins-base-libs
    gstreamer
    hicolor-icon-theme
    libcdio
    libgcc
    libglvnd
    #libgpod
    #liblastfm-qt5 # removed from Arch repo
    #libmtp
    libpulse
    libstdc++
    libx11
    #projectm # now use bundled v4.x, Arch is at v3.x
    protobuf libprotobuf.so
    qt6-base
    qt6-5compat
    sqlite
    taglib
    zlib
    )
makedepends=(
    boost
    cmake
    git
    glu
    qt6-tools
    #sparsehash
    vulkan-headers
    )
optdepends=(
    'gst-plugins-base: "Base" plugin libraries'
    'gst-plugins-good: "Good" plugin libraries'
    'gst-plugins-bad: "Bad" plugin libraries'
    'gst-plugins-ugly: "Ugly" plugin libraries'
    'gst-libav: FFmpeg plugin'
    'gvfs: Various devices support'
    )
conflicts=(clementine)
provides=(clementine)
#options=(!lto)
source=("git+https://github.com/clementine-player/Clementine.git")
sha256sums=('SKIP')

pkgver() {
  cd Clementine
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  #sed -i 's/cmake_policy(SET CMP0053 OLD)/cmake_policy(SET CMP0026 NEW)/' Clementine/CMakeLists.txt
  true
}

build() {
  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

  #export CXXFLAGS+=" -Wno-error=cpp"
  export CXXFLAGS+=" -Wno-unused-result"
  export CXXFLAGS+=" -Wno-error=stringop-overflow"

  local _flags=(
    -DENABLE_BOX=OFF
    -DENABLE_DROPBOX=OFF
    -DENABLE_GOOGLE_DRIVE=OFF
    -DENABLE_LIBGPOD=OFF
    -DENABLE_LIBLASTFM=OFF
    -DENABLE_LIBMTP=OFF
    -DENABLE_SEAFILE=OFF
    -DENABLE_SKYDRIVE=OFF
    -DENABLE_SPARKLE=OFF
    -DENABLE_WIIMOTEDEV=OFF
    #-DUSE_SYSTEM_PROJECTM=ON
    -DUSE_SYSTEM_TAGLIB=ON
  )

  cmake -B build -S Clementine -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
