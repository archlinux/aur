# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ossia-score
pkgver=2.2.0
release_tag=v2.2.0
pkgrel=1
pkgdesc="ossia score, an interactive sequencer for the intermedia arts"
arch=('x86_64')
url="https://ossia.io"
license=('GPLv3')
depends=('boost' 'qt5-base' 'qt5-imageformats' 'qt5-svg' 'qt5-websockets' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-multimedia' 'qt5-declarative' 'ffmpeg' 'portaudio' 'jack')
makedepends=('git' 'cmake' 'qt5-tools')
optdepends=('faust' 'lilv' 'suil' 'sdl2')
provides=("$pkgname=$pkgver")
conflicts=('ossia-score-git')
replaces=('i-score')
source=("https://github.com/OSSIA/score/releases/download/v${pkgver}/Score-v${pkgver}-src.tar.xz")
sha512sums=("0ba4fea5269d6032823b77550d1ae9fc04e82c5b89ace059dba8cbc0b926ee4e4d493d41cde3ebb15ffd67499059898d338f7ac297cb5d04535acacdbd39321c")

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
