# Maintainer: Dominik Schrempf <dominik dot schrempf at gmail dot com>
pkgname=pbmpi2-git
_gitname=pbmpi2
pkgver=1.7.675fab8
pkgrel=2
pkgdesc="Efficient phylogenomic tree reconstruction using Bayesian statistics; multicore version (MPI)"
arch=(x86_64)
url="http://www.atgc-montpellier.fr/phylobayes/"
license=('GPL2')
depends=('glibc' 'openmpi')
makedepends=('git')
# Does not conflict because executable names differ.
# conflicts=('phylobayes' 'phylobayes-mpi')
source=("${pkgname}::git+https://github.com/bayesiancook/${_gitname}.git")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd ${pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  mkdir build
  cd sources
  # XXX: CONSTEXPR required to compile without '-fpermissive'.
  make CPPFLAGS="-w -O3 -c -fpermissive"
}


package() {
  cd "$srcdir/$pkgname"
  # XXX: Not all binaries are installed.
  install -D -m755 "data/pb_mpi" "${pkgdir}/usr/bin/pb_mpi"
  install -D -m755 "data/readpb_mpi" "${pkgdir}/usr/bin/readpb_mpi"
  install -D -m755 "data/tracecomp" "${pkgdir}/usr/bin/tracecomp"
}
