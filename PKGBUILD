# Maintainer: Milk Brewster <milk on freenode>
_pkgname=patroneo
pkgname=${_pkgname}-git
pkgver=r67.d2828ca
pkgrel=1
pkgdesc="Easy Pattern Sequencer - Utilizing Jack Midi and the Non Session Manager"
arch=(x86_64)
url="https://github.com/diovudau/Patroneo"
license=('GPL')
groups=()
depends=('python' 'python-pyqt5')
makedepends=('git' 'nuitka')
optdepends=('non-session-manager: required to run Patroneo'
            'raysession-git: alternative to non-session-manager')
provides=('patroneo' 'patroneo-git')
conflicts=('patroneo' 'patroneo-git')
install=
source=('git+https://laborejo.org/patroneo.git/')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/patroneo"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/patroneo"
  git submodule init
  git pull --recurse 
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/patroneo"
  make
}

package() {
  cd "$srcdir/patroneo"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
