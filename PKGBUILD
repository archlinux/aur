# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=blis-openmp-git
pkgver=r1719.171f1006
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software Framework (with OpenMP support)"
arch=('i686' 'x86_64')
license=('custom')
url="https://github.com/flame/blis"
makedepends=('git' 'make' 'gcc' 'python')
provides=('blis')
conflicts=('blis' 'blis-git')
source=("$pkgname::git+https://github.com/flame/blis.git")
sha1sums=('SKIP')
options=('staticlibs')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  
  # static build is necessary for some packages and programs (e. g. GAMESS)
  ./configure --prefix=/usr --enable-static --enable-shared --enable-threading=openmp auto
  make
}

check() {
    cd "${pkgname}"

    make check
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
