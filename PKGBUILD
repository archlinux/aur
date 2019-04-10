# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ossia-score
pkgver=2.2.1
release_tag=v2.2.1
pkgrel=2
pkgdesc="ossia score, an interactive sequencer for the intermedia arts"
arch=('x86_64')
url="https://ossia.io"
license=('GPLv3')
depends=('boost' 'qt5-base' 'qt5-imageformats' 'qt5-svg' 'qt5-websockets' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-declarative' 'ffmpeg' 'portaudio' 'jack')
makedepends=('git' 'cmake' 'qt5-tools')
optdepends=('faust' 'lilv' 'suil' 'sdl2')
provides=("$pkgname=$pkgver")
conflicts=('ossia-score-git')
replaces=('i-score')
source=("https://github.com/OSSIA/score/releases/download/v${pkgver}/Score-v${pkgver}-src.tar.xz")
sha512sums=("50a48cfd9f762d6439bf579bb2e8ddbd612dd7e79d1850f2ee06e8624ebba0d8092edd2c27bf27636a6b947b20a02437f5a75490debf14e4fbf74ac35c203397")

build() {
  cd "$srcdir"

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake -Wno-dev -DSCORE_CONFIGURATION=static-release -DDEPLOYMENT_BUILD=1 -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" "$srcdir"
  cmake --build . --target all_unity
}

package() {
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_DO_STRIP=1 -DCOMPONENT=OssiaScore -P cmake_install.cmake
  install -D -m644 "$srcdir/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
