# Maintainer: Luke Taylor <luket1@proton.me>

pkgname=fooyin-git
pkgver=0.3.10
pkgrel=1
pkgdesc="A customisable music player"
url="https://github.com/ludouzi/fooyin"
arch=('any')
license=('GPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-svg'
    'alsa-lib'
    'taglib'
    'ffmpeg'
    'qcoro-qt6'
    'kdsingleapplication'
    'hicolor-icon-theme'
    'glibc'
    'gcc-libs'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
    'pkgconf'
    'qt6-tools'
)
optdepends=(
    'sdl2:     For the SDL2 audio output plugin'
    'libpipewire: For the PipeWire audio output plugin'
)
provides=('fooyin')
conflicts=('fooyin')
source=("$pkgname"::"git+https://github.com/ludouzi/fooyin.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/$pkgname"
  cmake -S . -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_PCH=ON
  cmake --build build
}

package() {
  cd "${srcdir}/$pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${srcdir}/$pkgname/COPYING" "${pkgdir}/usr/share/licenses/fooyin/LICENSE"
}
