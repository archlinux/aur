# Maintainer: Luke Taylor <luket1@proton.me>

pkgname=fooyin-git
pkgver=r2991.da67b3bb
pkgrel=1
pkgdesc="A customisable music player"
url="https://github.com/fooyin/fooyin"
arch=('x86_64')
license=('GPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-svg'
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
)
optdepends=(
    'sdl2: For the SDL2 audio output plugin'
    'libpipewire: For the PipeWire audio output plugin'
    'libopenmpt: For the OpenMPT audio input plugin'
    'libgme: For the GME audio input plugin'
    'libsndfile: For the GME audio input plugin'
    'libarchive: For the libarchive archive plugin'
)
provides=('fooyin')
source=("$pkgname"::"git+https://github.com/fooyin/fooyin.git"
        "libvgm"::"git+https://github.com/ValleyBell/libvgm.git"
)
sha256sums=(
            'SKIP'
            'SKIP'
)

pkgver() {
  cd "${srcdir}/$pkgname"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "${srcdir}/$pkgname"
  git submodule init
  git config submodule.3rdparty/libvgm.url "${srcdir}/libvgm"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/$pkgname"
  cmake -S . -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_PCH=ON \
    -DINSTALL_HEADERS=ON
  cmake --build build
}

package() {
  cd "${srcdir}/$pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${srcdir}/$pkgname/COPYING" "${pkgdir}/usr/share/licenses/fooyin/LICENSE"
}
