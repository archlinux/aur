# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ossia-score
pkgver=2.0.0a22
release_tag=v2.0.0-a22
pkgrel=1
pkgdesc="ossia score, an interactive sequencer for the intermedia arts"
arch=('x86_64')
url="http://ossia.io"
license=('GPLv3')
groups=()
depends=('boost' 'qt5-base' 'qt5-imageformats' 'qt5-svg' 'qt5-websockets' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-multimedia' 'qt5-declarative' 'ffmpeg' 'portaudio' 'jack2')
makedepends=('git' 'cmake' 'qt5-tools')
optdepends=('faust' 'lilv' 'suil' 'sdl2' 'intel-tbb')
provides=('ossia-score')
conflicts=()
replaces=('i-score')
backup=()
options=()
install=
source=()
noextract=()

_gitroot=https://github.com/OSSIA/score
_gitname=score

build() {
  cd "$srcdir"

  if [[ -d "score" ]]; then
    rm -rf "score"
  fi

  git clone --recursive -j8 "$_gitroot" "score"
  (
    cd "score"
    git checkout "$release_tag"
    git submodule update --init --recursive
  )

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake -Wno-dev -DSCORE_CONFIGURATION=static-release -DDEPLOYMENT_BUILD=1 -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" "$srcdir/$_gitname"
  cmake --build . --target all_unity
}

package() {
  cd "$srcdir/build"
  cmake --build . --target install
  install -D -m644 "$srcdir/$_gitname/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
