# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Storyteller <spiralsorrow@hotmail.com>

pkgname=lmms-sdl2
pkgver=1.2.2
pkgrel=1 # based on Arch's 27
pkgdesc='The Linux MultiMedia Studio (with SDL2 patches backported)'
arch=(x86_64)
url="https://lmms.io"
license=(GPL-2.0-or-later)
groups=(pro-audio)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  libx11
  libxcb
  qt5-base
  qt5-x11extras
  sdl2
)
makedepends=(
  alsa-lib
  bash-completion
  carla
  cmake
  doxygen
  extra-cmake-modules
  fftw
  fluidsynth
  freetype2
  jack
  ladspa
  lame
  libgig
  libogg
  libpulse
  libsamplerate
  libsndfile
  libvorbis
  portaudio
  qt5-tools
  sndio
  stk
)
optdepends=(
  'lib32-gcc-libs: VST plugin support'
  'lib32-glibc: VST plugin support'
  'pulseaudio: pulseaudio support'
)
provides=("lmms=$pkgver")
conflicts=("lmms")
options=(!lto)

_pkgname="${pkgname%-sdl2}"
source=(
  https://github.com/${_pkgname}/${_pkgname}/releases/download/v$pkgver/${_pkgname}_$pkgver.tar.xz
  lmms-carla-export.patch
  $_pkgname-1.2.2-kf5widgetsaddon.patch
  cmake-4.patch
  # Yes, cherry-picking the patch from commit works.
  $_pkgname-1.2.2-sdl2.patch::https://github.com/LMMS/$_pkgname/commit/0e88a27389b23a2ed2d9e235f588e20b38ecc4b8.patch
)
sha512sums=('df74d9e938f1c3807e9941b11db4ccfe9450e23b723c82774de15b7666ac39f1bfdd8519231e28849f994628190ecc92fa05d55bbc0b50a4421f2d183e729028'
            'be334dd7756086eca09d4e4c649fc6e5e49dd81982f28b51b085eda29e8f31e7bf8c98d417fca871f993d2956daa327107ab9eaac1a75195d0a54693d7f1069e'
            'b44aabc76a0858fb22f009cdba48662c399ef0b1dce689c9ae26b8fbff77b5548a4f79487c362b6909a823afc129cf6c8ed2d7ff85807008ff863d5b68406192'
            '82bb5acc093ac9ae49d3b193ca28d5242b569c024161238ca42d198c6ee66e98184e7609d51e3d9a60f03ef711a80bf7955f9d758221aad004fe7fd254904c30'
            'cb88eba6bc4c4f19e1380ef051b008ff9174b30c9f346059ea965dd4aece69678873d74bb6e27b7cd1edd0140fc7479e8637618f59c3c1b7a7afdc436c5583bc')
b2sums=('8b561068194e9a4af8260675e784c25a92b6b2f731c29b677cbc16581306bbadcf27ea529adbcd735ff4adffedf3dd98ec7b2d89428a63ea600d022ecdae58e4'
        '5a15297342b1a988d447231e1b6a75ad746c0f8d423be1499bc648aae9c73303d6cb00789ea0040b287952498a97605545145f30972a50a2c1ec8c3e5b445043'
        'a5b49aed16a4620c43adccd1c3c8e6ef7e91a5acef547068d7039d34be74266839732336d503a6781ec003b71d5d2a2240806491db12e83b202fb4ca0740480b'
        'b330656d96a1b6393645fc5021ab4f75b17add1f41b4a84db6768f99b840eae798cd62f6a0b68d2d64230ec10d390ebc57cb5535c2f2a00541bac9f7fde3b542'
        'ac9c7aa13cacce193e6a260d0e91015a35705b3c7c462bbb5c8f461abc519bd3c1244b9c0a0d14a5d68f736f6cf60b4e45affc3c67aa77926acf8f8c666035c7')

prepare() {
  echo "--- fix build with carla 2.4.3"
  patch -Np1 -d $_pkgname -i ../$_pkgname-carla-export.patch
  echo "--- fix issues with kf5widgetsaddon: https://bugs.archlinux.org/task/76894"
  patch -Np1 -d $_pkgname -i ../$_pkgname-1.2.2-kf5widgetsaddon.patch
  echo "--- fix build with cmake 4"
  patch -p1 -d $_pkgname < cmake-4.patch
  echo "--- add patches for SDL2"
  patch -Np1 -d $_pkgname -i ../$_pkgname-1.2.2-sdl2.patch
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_LIBDIR=lib
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_MODULE_PATH=/usr/share/ECM/find-modules
    -D OpenGL_GL_PREFERENCE=GLVND
    -D WANT_QT5=ON
    -D WANT_SOUNDIO=OFF
    -D WANT_VST_NOWINE=ON
    -S $_pkgname
    -W no-dev
  )

  # prevent mangling of static libs with LTO
  CXXFLAGS+=' -ffat-lto-objects'
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  depends+=(
    alsa-lib libasound.so
    fftw libfftw3f.so
    fluidsynth libfluidsynth.so
    lame libmp3lame.so
    libgig libgig.so
    libogg libogg.so
    libpulse libpulse.so
    libsamplerate libsamplerate.so
    libsndfile libsndfile.so
    libvorbis libvorbis.so libvorbisenc.so libvorbisfile.so
    portaudio libportaudio.so
    sndio libsndio.so
    stk libstk-5.0.0.so
  )

  DESTDIR="$pkgdir" cmake --install build
}
