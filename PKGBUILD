# Maintainer: Luke Taylor <luket@pm.me>

pkgname=fooyin-git
pkgver=0.12.4.r2.ga1e7128
pkgrel=1
pkgdesc="A customisable music player"
url="https://github.com/fooyin/fooyin"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
    glibc
    icu
    libstdc++
    libgcc
    qt6-base
    alsa-lib
    taglib
    ffmpeg
    kdsingleapplication
    qcoro
    hicolor-icon-theme
    zlib
)
makedepends=(
    git
    qt6-svg
    qt6-tools
    ninja
    cmake
    sdl2-compat
    libpipewire
    libopenmpt
    libgme
    libsndfile
    libarchive
    libebur128
    libprojectm
    libsoxr
    soundtouch
)
optdepends=(
    'sdl2: For the SDL2 audio output plugin'
    'libpipewire: For the PipeWire audio output plugin'
    'libopenmpt: For the OpenMPT audio input plugin'
    'libgme: For the GME audio input plugin'
    'libsndfile: For the GME audio input plugin'
    'libarchive: For the libarchive archive plugin'
    'libebur128: For the ReplayGain scanner plugin'
    'libsoxr: For the SoX-based DSP plugin'
    'libprojectm: For the ProjectM visualisation plugin'
    'soundtouch: For the SoundTouch-based DSP plugin'
)
provides=('fooyin')
conflicts=('fooyin')
source=(
  "$pkgname"::"git+https://github.com/fooyin/fooyin.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    local cmake_options=(
        -B build
        -S "$pkgname"
        -W no-author
        -G Ninja
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BUILD_PCH=ON
        -D INSTALL_HEADERS=ON
    )

    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
