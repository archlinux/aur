# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=iscore-git
pkgver=1.0b10
pkgrel=1
pkgdesc="i-score, an interactive sequencer for the intermedia arts"
arch=('x86_64')
url="http://www.i-score.org"
license=('CeCILLv2')
groups=()
depends=('boost' 'qt5-base' 'qt5-imageformats' 'qt5-svg' 'qt5-websockets' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-multimedia' 'qt5-declarative')
makedepends=('git' 'cmake' 'qt5-tools')
provides=('i-score')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()


_gitroot=https://github.com/OSSIA/i-score
_gitname=i-score

build() {
  cd "$srcdir"

  if [[ -d "$_gitname" ]]; then
    (
      cd "$_gitname"
      git checkout master
      git pull
      git submodule update --recursive
    )
  else
    git clone --recursive -j8 "$_gitroot" "$_gitname" 
  fi

  mkdir -p "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  cmake -Wno-dev -DISCORE_CONFIGURATION=static-release -DDEPLOYMENT_BUILD=1 -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" "$srcdir/$_gitname"
  make all_unity
}

package() {
  cd "$srcdir/$_gitname-build"
  cmake --build . --target install
  install -D -m644 "$srcdir/$_gitname/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
