# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ossia-score
pkgver=3.0.3
_pkgver=3.0.3
release_tag=v3.0.3
pkgrel=1
pkgdesc="ossia score, an interactive sequencer for the intermedia arts"
arch=('x86_64')
url="https://ossia.io"
license=('GPLv3')
depends=('boost' 'qt5-base' 'qt5-imageformats' 'qt5-svg' 'qt5-websockets' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-declarative' 'ffmpeg' 'portaudio' 'jack')
makedepends=('git' 'cmake' 'qt5-tools')
optdepends=('faust' 'lilv' 'suil' 'lv2' 'sdl2' 'libfreenect2' 'qt5-shadertools-git')
provides=("$pkgname=$pkgver")
conflicts=('ossia-score-git')
replaces=('i-score')
source=("https://github.com/ossia/score/releases/download/v${_pkgver}/ossia.score-${_pkgver}-src.tar.xz")
sha512sums=('440c13f690d07005f241ecceaad8454ff6094bebf676df39e9de9fcadef3d2f0d3dfe684ff03d04a47aac9fd506f51d4dad1d8efa7d830dee264125586db0ae8')
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
