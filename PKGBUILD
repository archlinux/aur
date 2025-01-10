# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ossia-score
pkgver=3.4.0
pkgrel=1
pkgdesc="ossia score, an interactive sequencer for the intermedia arts"
arch=('x86_64')
url="https://ossia.io"
license=('GPLv3')
depends=('clang' 'qt6-base' 'qt6-imageformats' 'qt6-svg' 'qt6-websockets' 'qt6-serialport' 'qt6-declarative' 'qt6-scxml' 'qt6-shadertools' 'ffmpeg' 'portaudio' 'jack')
makedepends=('git' 'cmake' 'lld' 'boost')
optdepends=('pipewire' 'faust' 'lilv' 'suil' 'lv2' 'sdl2' 'libfreenect2' 'ysfx' 'ultraleap-hand-tracking-service' 'gpsd' 'bluez' 'ndi-sdk' 'libcoap' 'avahi' 'onnxruntime' 'hdf5')
provides=("$pkgname=$pkgver")
conflicts=('ossia-score-git')
replaces=('i-score')
source=("https://github.com/ossia/score/releases/download/v${pkgver}/ossia.score-${pkgver}-src.tar.xz")
sha512sums=('06bf6df7666c0341f874a14f9ce7da4756bb44e1343d741a97a2524318e43c7c8c07f785db86ec2e0d5b4ea71a248ec81855cac79a04225549f4c149b0228d7c')
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
