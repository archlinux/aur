# Maintainer: KeLiu <specter119[AT]gmail.com>
pkgname=enumlib-git
_provide=${pkgname%-git}
pkgver=r461.e780a44
pkgrel=1
epoch=
pkgdesc='A code generates the derivative superstructures of a parent lattice'
arch=('i686' 'x86_64')
url='https://github.com/msg-byu/'$_provide
license=('MIT')
groups=()
depends=('gcc-fortran')
makedepends=('git')
checkdepends=()
optdepends=()
provides=($_provide)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_submodule=symlib
source=($_provide::git+$url.git
        $_submodule::git+${url//$_provide/$_submodule}.git)
md5sums=(SKIP SKIP)
noextract=()

pkgver() {
  cd $_provide
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_provide
  git submodule init
  git config submodule.$_submodule.url $srcdir/$_submodule
  git submodule update
}

build() {
  cd $srcdir/$_submodule/src
  make F90=gfortran
  cd $srcdir/$_provide/src
  make F90=gfortran enum.x
  make F90=gfortran makestr.x
}

package() {
  cd $srcdir/$_provide/src
  install -Dm655 enum.x $pkgdir/usr/bin/enum.x
  install -Dm655 makestr.x $pkgdir/usr/bin/makestr.x
  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$_provide/LICENSE
}

# vim:set ts=2 sw=2 et:
