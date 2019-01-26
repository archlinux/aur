# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ossia-score-git
pkgver=r7198.7ccd363a6
pkgrel=1
pkgdesc="ossia score, an interactive sequencer for the intermedia arts (git master)"
arch=('x86_64')
url="https://ossia.io"
license=('GPLv3')
groups=()
depends=('boost' 'qt5-base' 'qt5-imageformats' 'qt5-svg' 'qt5-websockets' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-multimedia' 'qt5-declarative' 'ffmpeg' 'portaudio' 'jack2')
makedepends=('git' 'cmake' 'qt5-tools')
optdepends=('faust' 'lilv' 'suil' 'sdl2')
provides=('ossia-score-git')
conflicts=('ossia-score')
replaces=('i-score')
backup=()
options=()
install=
source=('git+https://github.com/OSSIA/score.git')
sha256sums=('SKIP')
noextract=()

_gitname=score

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  git submodule update --init --recursive

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake -Wno-dev -DSCORE_CONFIGURATION=static-release -DDEPLOYMENT_BUILD=1 -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" "$srcdir/$_gitname"
  cmake --build . --target all_unity
}

package() {
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_DO_STRIP=1 -DCOMPONENT=OssiaScore -P cmake_install.cmake
  install -D -m644 "$srcdir/$_gitname/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
