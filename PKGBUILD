# Maintainer: Luke Taylor <luket@pm.me>

pkgname=fooyin-git
pkgver=0.9.2.r6.g460c4c3
pkgrel=1
pkgdesc="A customisable music player"
url="https://github.com/fooyin/fooyin"
arch=('x86_64')
license=('GPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-svg'
    'qcoro'
    'alsa-lib'
    'taglib'
    'ffmpeg'
    'icu'
    'kdsingleapplication'
    'hicolor-icon-theme'
    'glibc'
    'gcc-libs'
)
makedepends=(
    'cmake'
    'git'
    'libpipewire'
    'ninja'
    'pkgconf'
    'qt6-tools'
    'libopenmpt'
    'libgme'
    'libsndfile'
    'libarchive'
    'libebur128'
)
optdepends=(
    'sdl2: For the SDL2 audio output plugin'
    'libpipewire: For the PipeWire audio output plugin'
    'libopenmpt: For the OpenMPT audio input plugin'
    'libgme: For the GME audio input plugin'
    'libsndfile: For the GME audio input plugin'
    'libarchive: For the libarchive archive plugin'
    'libebur128: For the ReplayGain scanner plugin'
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
  cmake -B build -S "$pkgname" -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_PCH=ON \
    -DINSTALL_HEADERS=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
