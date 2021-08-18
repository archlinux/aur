# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ossia-score
pkgver=3.0.0.b2
_pkgver=3.0.0-b2
release_tag=v3.0.0-b2
pkgrel=1
pkgdesc="ossia score, an interactive sequencer for the intermedia arts"
arch=('x86_64')
url="https://ossia.io"
license=('GPLv3')
depends=('boost' 'qt5-base' 'qt5-imageformats' 'qt5-svg' 'qt5-websockets' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-declarative' 'ffmpeg' 'portaudio' 'jack')
makedepends=('git' 'cmake' 'qt5-tools')
optdepends=('faust' 'lilv' 'suil' 'sdl2' 'libfreenect2' 'qt5-shadertools-git')
provides=("$pkgname=$pkgver")
conflicts=('ossia-score-git')
replaces=('i-score')
source=("https://github.com/ossia/score/releases/download/v${_pkgver}/ossia.score-${_pkgver}-src.tar.xz")
sha512sums=("85d50e98d8b34922f82762c619268ab73480d382d8708e5aeab136c430a306eb547fd9aef37b6952611d469b9bb5ddfcd625812a06a66b132edc1a1ebe3d5cd3")

build() {
  cd "$srcdir"

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -Wno-dev \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_UNITY_BUILD=1 \
        -DDEPLOYMENT_BUILD=1 \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
	"$srcdir"

  cmake --build .
}

package() {
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_DO_STRIP=1 -DCOMPONENT=OssiaScore -P cmake_install.cmake
  rm -rf "$pkgdir/usr/share/faust"

  install -D -m644 "$srcdir/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
