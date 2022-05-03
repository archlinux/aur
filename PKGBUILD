# Author: Jean Pierre Cimalando (jpcima)
# PKGBUILD Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=ysfx-git
pkgver=1.0
pkgrel=1
pkgdesc="Hosting library for JSFX"
arch=('x86_64')
url="https://github.com/jpcima/ysfx"
license=('Apache License 2.0')
groups=()
depends=('libfontconfig.so' 'libfreetype.so')
makedepends=('git' 'cmake')
provides=('ysfx')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()


_gitroot=https://github.com/jpcima/ysfx
_gitname=ysfx

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

  cmake -S "$srcdir/$_gitname" \
        -B "$srcdir/$_gitname-build" \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DCMAKE_BUILD_TYPE=Release

  cmake --build "$srcdir/$_gitname-build" 
}

package() {
  cd "$srcdir/$_gitname-build"
  cmake --install "$srcdir/$_gitname-build" 
  install -D -m644 "$srcdir/$_gitname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
