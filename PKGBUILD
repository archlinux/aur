# Maintainer: specter119 <specter119@gmail.com>
pkgname=supercell-git
_provide=${pkgname%-git}
pkgver=r207.10b30cd
pkgrel=1
epoch=
pkgdesc="The program allows you to create regular structure supercell from cif file with partial occupancy and/or substitutions."
arch=('i686' 'x86_64')
url='https://github.com/orex/supercell'
license=('GPL2')
groups=()
depends=('boost' 'openbabel' 'eigen')
makedepends=('cmake')
checkdepends=()
optdepends=('libarchive' 'texlive-bin' 'python-pygments' 'perl')
provides=($_provide)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_submodule=common_utils
source=($_provide::git+$url.git#branch=ob3_support
        $_submodule::git+${url//$_provide/$_submodule}.git)
md5sums=('SKIP'
         'SKIP')
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
  mkdir -p $srcdir/$_provide/build
  cd $srcdir/$_provide/build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr ..
  make
}

package() {
  cd $srcdir/$_provide/build
  make install
  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$_provide/LICENSE
}

# vim:set ts=2 sw=2 et:
