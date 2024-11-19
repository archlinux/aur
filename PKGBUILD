# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ossia-score
pkgver=3.3.2
pkgrel=1
pkgdesc="ossia score, an interactive sequencer for the intermedia arts"
arch=('x86_64')
url="https://ossia.io"
license=('GPLv3')
depends=('clang' 'qt6-base' 'qt6-imageformats' 'qt6-svg' 'qt6-websockets' 'qt6-serialport' 'qt6-declarative' 'qt6-scxml' 'qt6-shadertools' 'ffmpeg' 'portaudio' 'jack')
makedepends=('git' 'cmake' 'lld' 'boost')
optdepends=('pipewire' 'faust' 'lilv' 'suil' 'lv2' 'sdl2' 'libfreenect2' 'ysfx' 'ultraleap-hand-tracking-service' 'gpsd' 'bluez' 'ndi-sdk' 'libcoap' 'avahi')
provides=("$pkgname=$pkgver")
conflicts=('ossia-score-git')
replaces=('i-score')
source=("https://github.com/ossia/score/releases/download/v${pkgver}/ossia.score-${pkgver}-src.tar.xz")
sha512sums=('a2123644d1f249415acc244b1de7478491c6e3191170c023959791115e1114d8acadc648bc7245cbdcffb98b6fa6aa9e2a94234faff57323a2d8146f243dcec2')
build() {
  cmake \
  -S "$srcdir/ossia-score-$pkgver" \
  -B "$srcdir/build" \
  -Wno-dev \
  -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld" \
  -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_UNITY_BUILD=1 \
  -DSCORE_PCH=0 \
  -DSCORE_STATIC_PLUGINS=1 \
  -DSCORE_FHS_BUILD=1 \
  -DSCORE_DEPLOYMENT_BUILD=1 \
  -DCMAKE_SKIP_RPATH=ON \
  -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"

  cmake --build "$srcdir/build"
}

package() {
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_DO_STRIP=1 -DCOMPONENT=OssiaScore -P cmake_install.cmake
  rm -rf "$pkgdir/usr/share/faust"

  install -D -m644 "$srcdir/ossia-score-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
