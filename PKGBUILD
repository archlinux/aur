pkgname=revbayes-mpi
_pkgname=revbayes
pkgver=1.3.1
pkgrel=1
pkgdesc="Bayesian Phylogenetic Inference Using Graphical Models and an Interactive Model-Specification Language https://doi.org/10.1093/sysbio/syw021"
arch=(x86_64)
url="https://github.com/revbayes/revbayes"
license=(GPL3)
depends=('gcc-libs' 'boost-libs' 'openlibm' 'openmpi')
makedepends=('boost' 'meson' 'ninja' 'cmake' 'git')
conflicts=('lrzsz' 'revbayes-mpi')
provides=('revbayes')
source=("git+$url.git#tag=v$pkgver"
	"rb.patch")
md5sums=('f310ba0bf10bb46ea3949ae6077ceef3'
         'f5af0159704f049f8269584883bcaa80')

prepare() {
  cd $srcdir/$_pkgname
  git submodule update --init --recursive
  ./projects/meson/generate.sh
}

build() {
  cd $srcdir/$_pkgname
  arch-meson build \
  --buildtype      release \
  -Dmpi=true
  ninja -C build
}

package() {
  cd $srcdir/$_pkgname
  DESTDIR="${pkgdir}" ninja -C build install
}
