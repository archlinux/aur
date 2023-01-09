# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ossia-score
pkgver=3.1.6
_pkgver=3.1.6
release_tag=v3.1.6
pkgrel=1
pkgdesc="ossia score, an interactive sequencer for the intermedia arts"
arch=('x86_64')
url="https://ossia.io"
license=('GPLv3')
depends=('clang' 'lld' 'boost' 'qt6-base' 'qt6-imageformats' 'qt6-svg' 'qt6-websockets' 'qt6-quickcontrols2' 'qt6-serialport' 'qt6-declarative' 'qt6-scxml' 'qt6-shadertools' 'ffmpeg' 'portaudio' 'jack')
makedepends=('git' 'cmake')
optdepends=('faust' 'lilv' 'suil' 'lv2' 'sdl2' 'libfreenect2' 'ysfx-git' 'leap-motion-sdk' 'leap-motion-driver')
provides=("$pkgname=$pkgver")
conflicts=('ossia-score-git')
replaces=('i-score')
source=("https://github.com/ossia/score/releases/download/v${_pkgver}/ossia.score-${_pkgver}-src.tar.xz")
sha512sums=('2b66b405caf0d22b7361361a1b0d261c0a7da8d1c35d0fcd1d21b6d7ac9d3a050d1fbaa9fa3cf4c14ce412c575e069d84cfc55ffa6a7025a99fbac7bf15c0561')
build() {
  cd "$srcdir"

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -Wno-dev \
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
  -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
  -DQT_VERSION="Qt6;6.4" \
  "$srcdir"

  cmake --build .
}

package() {
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_DO_STRIP=1 -DCOMPONENT=OssiaScore -P cmake_install.cmake
  rm -rf "$pkgdir/usr/share/faust"

  install -D -m644 "$srcdir/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
