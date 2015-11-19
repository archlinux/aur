# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=iscore-git
pkgver=1.0a30
pkgrel=1
pkgdesc="i-score, an interactive sequencer for the intermedia arts"
arch=('x86_64')
url="http://www.i-score.org"
license=('CeCILLv2')
groups=()
depends=('jamomacore' 'boost' 'qt5-base' 'qt5-imageformats' 'qt5-svg')
makedepends=('git' 'cmake' 'qt5-tools' 'ninja')
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
    git clone "$_gitroot" "$_gitname" 
    (
      cd "$_gitname"
      git checkout master
      git submodule update --init --recursive
    )
  fi

  mkdir -p "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  cmake -GNinja -DCMAKE_PREFIX_PATH="/usr/jamoma/share/cmake/Jamoma" -DISCORE_STATIC_PLUGINS:Bool=True -DDEPLOYMENT_BUILD:Bool=True -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" "$srcdir/$_gitname"
  ninja
}

package() {
  cd "$srcdir/.."
  install -D -m755 "i-score.sh" "${pkgdir}/usr/bin/i-score.sh"

  cd "$srcdir/$_gitname-build"
  cmake --build . --target install --config DynamicRelease
  install -D -m644 "$srcdir/$_gitname/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
