# Maintainer: Jonas Serych <jonas@sery.ch>
pkgname='powertabeditor-git'
pkgver=2.0.0.alpha19.r61.g96550b3
pkgrel=1
pkgdesc="Guitar tablature viewer and editor"
arch=('x86_64')
url="https://powertab.github.io/"
license=('GPL-3.0-only')
depends=('boost-libs' 'boost' 'doctest' 'minizip' 'pugixml' 'rtmidi' 'alsa-lib' 'nlohmann-json' 'qt5-base' 'qt5-tools')
optdepends=('timidity++: MIDI playback support'
            'fluidsynth: MIDI playback support')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/powertab/powertabeditor.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
