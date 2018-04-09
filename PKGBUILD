# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=cath-tools-git
pkgver=v0.16.2.r20.g82fb9ac7
pkgrel=2
pkgdesc="Protein structure comparison tools such as SSAP and SNAP."
arch=('i686' 'x86_64')
license=('GPL3')
url="http://orengogroup.info/software/"
depends=('gsl')
makedepends=('gsl' 'cmake' 'ninja' 'make' 'git')
provides=('cath-tools')
conflicts=('cath-tools')
source=("cath-tools-git::git+https://github.com/anadon/cath-tools")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cmake -G Ninja  -DCMAKE_BUILD_TYPE=RELEASE -D USE_STATIC_GSL:BOOL=FALSE .
  ninja 
}

check() {
  cd "$pkgname"
  CATH_TOOLS_BIN_DIR=. prove -l -v perl/t
}

package() {
  cd "$pkgname"
  #make install
  #Install the executables
  mkdir -p "$pkgdir/usr/bin"
  cp -t "$pkgdir/usr/bin" cath-resolve-hits cath-score-align cath-assign-domains cath-ssap cath-cluster cath-superpose cath-map-clusters cath-refine-align
  
  #Install the libraries
  cd source
  mkdir "$pkgdir/usr/lib"
  cp -t "$pkgdir/usr/lib" libct_options.a libct_resolve_hits.a libct_seq.a libct_biocore.a libct_test.a libct_cath_assign_domains.a libct_uni.a libct_cath_cluster.a libct_cath_refine_align.a libct_cath_score_align.a libct_cath_superpose.a libct_chopping.a libct_clustagglom.a libct_cluster.a libct_common.a libct_display_colour.a
}
