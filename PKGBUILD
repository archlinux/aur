# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
pkgname=museeq-git
pkgver=r757.7992c04
pkgrel=1
pkgdesc="A Qt5 interface to the museekd daemon."
arch=('x86_64')
url="http://www.museek-plus.org/"
license=('GPL2')
depends=('qt5-script' 'qt5-tools')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/eLvErDe/museek-plus")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  mkdir -p "$pkgname"/build
  cd "$pkgname"/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DEVERYTHING=0 -DMURMUR=0 -DMUCOUS=0 -DMUSEEKD=0 -DMUSETUP=0 -DMUSCAN=0 -DMUSEEQ=1 -DPYTHON_BINDINGS=0 "$srcdir"/"$pkgname"
  make
}

package() {
  cd "$pkgname"/build
  make DESTDIR="$pkgdir" install
}
