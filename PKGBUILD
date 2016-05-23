# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=charls
pkgname=$_pkgname-git
pkgver=2.0.0.1.gd93464b
pkgrel=1
pkgdesc='A C++ JPEG-LS library implementation'
arch=('i686' 'x86_64')
url='https://github.com/team-charls/charls'
license=('BSD')
makedepends=('git' 'cmake' 'dos2unix')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/team-charls/charls.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed 's:-:.:g'
}

prepare() {
  # remove CRLF sequence
  for i in $(find $_pkgname -type f -exec file {} \; | grep CRLF | sed 's/:.*$//')
  do
    dos2unix $i
  done
}

build() {
  mkdir -p build
  cd build
  cmake $srcdir/$_pkgname -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname/License.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
