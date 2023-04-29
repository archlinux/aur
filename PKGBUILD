# Maintainer: Christopheer Arndt <aur -at- chrisarndt -dot de>

_pkgname=libsequoia
pkgname=$_pkgname-git
pkgver=r157.81b0e8f
pkgrel=1
pkgdesc='A library for loop-based MIDI step sequencing for JACK applications'
url='https://github.com/chronopoulos/libsequoia'
arch=(i686 x86_64)
license=(GPL3)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(jack json-c)
makedepends=(git)
source=("$_pkgname::git+https://github.com/chronopoulos/libsequoia.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  sed -i -e 's/-shared/-shared $(LDFLAGS)/' Makefile
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  install -Dm755 lib/$_pkgname.so -t "$pkgdir"/usr/lib
  install -Dm644 include/*.h -t "$pkgdir"/usr/include
  install -Dm644 include/sequoia/*.h -t "$pkgdir"/usr/include/sequoia
}
