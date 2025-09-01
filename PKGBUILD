# Maintainer: Beacrox beacrox@atl.tools

pkgname=pulse-visualizer-git
pkgver=1.3.0.r0.291d107
pkgrel=1
pkgdesc="A GPU-accelerated audio visualizer for PulseAudio/PipeWire (latest git)"
arch=('any')
url="https://github.com/Audio-Solutions/pulse-visualizer"
license=('GPL3')
depends=('sdl3' 'fftw' 'freetype2' 'glew' 'yaml-cpp' 'libebur128')
makedepends=('cmake' 'ninja' 'clang' 'git')
optdepends=('libpulse: PulseAudio support' 'libpipewire: PipeWire support')
source=("git+https://github.com/Audio-Solutions/pulse-visualizer.git")
sha256sums=('SKIP')
conflicts=("pulse-visualizer-bin")
install=pulse-visualizer-git.install

pkgver() {
  cd "$srcdir/pulse-visualizer"
  git describe --tags --long --match "v[0-9]*" 2>/dev/null | \
    sed -E 's/^v//; s/-([0-9]+)-g([0-9a-f]+)$/\.r\1.\2/'
}

build() {
  cd "$srcdir/pulse-visualizer"
  mkdir -p build
  cd build
  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  ninja
}

package() {
  cd "$srcdir/pulse-visualizer/build"
  DESTDIR="$pkgdir" ninja install
  install -Dm644 "$srcdir/pulse-visualizer/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
