# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ossia-score
pkgver=3.1.8
_pkgver=3.1.8
release_tag=v3.1.8
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
sha512sums=('49cbca9eeacd83bc64886a626813e1341628ea0b5bcf4a8761dbef53c0840a4a3625689471f356ce2c763f2795ed4583db5a919379ea80e7491cb52397581bef')
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
  -DQT_VERSION="Qt6;6.2" \
  "$srcdir"

  cmake --build .
}

package() {
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_DO_STRIP=1 -DCOMPONENT=OssiaScore -P cmake_install.cmake
  rm -rf "$pkgdir/usr/share/faust"

  install -D -m644 "$srcdir/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
