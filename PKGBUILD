# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=clementine
pkgver=1.4.1+106+ga4b3599ec
pkgrel=1
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
    qt5-base
    qt5-x11extras
    sqlite
    taglib
    zlib
    )
makedepends=(
    boost
    cmake
    git
    glu
    qt5-tools
    #sparsehash
    )
optdepends=(
    'gst-plugins-base: "Base" plugin libraries'
    'gst-plugins-good: "Good" plugin libraries'
    'gst-plugins-bad: "Bad" plugin libraries'
    'gst-plugins-ugly: "Ugly" plugin libraries'
    'gst-libav: FFmpeg plugin'
    'gvfs: Various devices support'
    )
#options=(!lto)
# NB commits are chosen corresponding a git tag https://github.com/clementine-player/Clementine/tags
source=("git+https://github.com/clementine-player/Clementine.git#commit=a4b3599ecd10662487bf22a1a14c4293467e2485")
sha256sums=('5e449957e251f67eab6fd1764cbc78277f0c60db604cf65c0f8d0f21257739cc')

pkgver() {
  cd Clementine
  git describe --tags | sed 's/^v//;s/-/+/g'
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
