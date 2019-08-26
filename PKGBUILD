# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ossia-score
pkgver=2.5.2
release_tag=v2.5.2
pkgrel=1
pkgdesc="ossia score, an interactive sequencer for the intermedia arts"
arch=('x86_64')
url="https://ossia.io"
license=('GPLv3')
depends=('boost' 'qt5-base' 'qt5-imageformats' 'qt5-svg' 'qt5-websockets' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-declarative' 'ffmpeg' 'portaudio' 'jack')
makedepends=('git' 'cmake' 'qt5-tools' 'clang' 'lld')
optdepends=('faust' 'lilv' 'suil' 'sdl2')
provides=("$pkgname=$pkgver")
conflicts=('ossia-score-git')
replaces=('i-score')
source=("https://github.com/OSSIA/score/releases/download/v${pkgver}/Score-v${pkgver}-src.tar.xz")
sha512sums=("b75d5b5852b43c8b6664db1a8928c659affedac0a7620d13a67f0a4b4e460e54ace8cd0feffbe119ba34e8a34a8f93777b2e02eb0f1fe5bb073b845bb0902325")

build() {
  cd "$srcdir"

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  # Note : there is currently a GCC bug when linking - works fine with clang & lld
  cmake -Wno-dev \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DSCORE_CONFIGURATION=static-release \
	-DDEPLOYMENT_BUILD=1 \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
	-DOSSIA_USE_FAST_LINKER=1 \
	"$srcdir"

  cmake --build . --target all_unity
}

package() {
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_DO_STRIP=1 -DCOMPONENT=OssiaScore -P cmake_install.cmake
  install -D -m644 "$srcdir/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
