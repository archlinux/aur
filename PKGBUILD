# Maintainer: Boris Brock <gabrielborisbrock@gmail.com>
pkgname=replayer-git
pkgver=1.0.0.r0.g85fb96d
pkgrel=1
pkgdesc='Video player for action cam footage with frame-by-frame and slow-motion playback (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/BorisBrock/Replayer'
license=('GPL-3.0-only')
depends=('ffmpeg' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'qt6-base')
makedepends=('cmake' 'git' 'qt6-svg')
provides=('replayer')
conflicts=('replayer')
source=('git+https://github.com/BorisBrock/Replayer.git')
sha256sums=('SKIP')

pkgver() {
  cd Replayer
  git describe --long --tags --match 'v[0-9]*' --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # CMakeLists.txt derives the app version from git describe
  cmake -B build -S Replayer \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_DOCDIR="share/doc/replayer" \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 Replayer/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
