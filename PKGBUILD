# Maintainer: gilcu3
# Contributor: gilcu3

_pkgname=flatter
pkgname=${_pkgname}-git
pkgver=r19.13c4ef0
pkgrel=1
epoch=2
pkgdesc="flatter is a library for performing (f)ast (lat)tice (r)eduction of integer lattice bases"
arch=('x86_64')
url='https://github.com/keeganryan/flatter'
license=('GPL3')
depends=('eigen' 'gmp' 'fplll' 'gcc-libs' 'mpfr' 'glibc' 'lapack' 'openmp')
optdepends=('intel-oneapi-mkl')
makedepends=('git' 'cmake')
provides=('flatter')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cmake -B build -S "$_pkgname" -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX='/usr'  -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake  --install build
}
