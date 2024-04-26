pkgname=revbayes
pkgver=1.2.3
pkgrel=1
pkgdesc="Bayesian Phylogenetic Inference Using Graphical Models and an Interactive Model-Specification Language https://doi.org/10.1093/sysbio/syw021"
arch=(x86_64)
url="https://github.com/revbayes/revbayes"
license=(GPL3)
depends=('gcc-libs' 'boost-libs' 'openlibm')
makedepends=('boost' 'meson' 'ninja' 'cmake' 'git')
source=("git+$url.git#tag=v$pkgver"
	"rb.patch")
conflicts=('lrzsz' 'revbayes-mpi')
md5sums=('77b4de01b42d27b46802706a17508cdb'
         'f5af0159704f049f8269584883bcaa80')

prepare() {
  cd $srcdir/$pkgname
  git submodule update --init --recursive
  ./projects/meson/generate.sh
}

build() {
  cd $srcdir/$pkgname
  arch-meson build \
  --buildtype      release \
  -Dmpi=false
  ninja -C build
}

package() {
  cd $srcdir/$pkgname
  DESTDIR="${pkgdir}" ninja -C build install
}
