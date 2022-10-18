# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=freebayes
pkgver=1.3.6
pkgrel=4
pkgdesc="About Bayesian haplotype-based genetic polymorphism discovery and genotyping"
arch=('x86_64')
url="https://github.com/freebayes/freebayes"
license=('MIT')

depends=('tabixpp' 'htslib')
makedepends=('ninja' 'meson' 'git' 'cmake' 'make'
'vcflib' 'vcftools' 'samtools' 'parallel' 'bc')
optdepends=()

source=("git+https://github.com/freebayes/freebayes.git#tag=v${pkgver}")
noextract=()
sha256sums=('SKIP')
prepare() {
  cd "$pkgname"
  git submodule update --init --recursive

  # fix limits
  sed -i "/#include <limits>/d" intervaltree/IntervalTree.h
  sed -i "8i #include <limits>" intervaltree/IntervalTree.h
  cp vcflib/tabixpp/tabix.*   vcflib/src
}
build() {
  cd "$pkgname"
  test -d build || mkdir build
  meson --prefix=/usr --buildtype=release --includedir=/usr/include/vcflib build
  #marked it because meson.build:9:0: ERROR: Unknown options: "prefer_system_deps"
  #-Dprefer_system_deps=true
  cd build
  ninja -v
}

package() {
  cd "$pkgname"
  install -Dm 755 build/freebayes  -t $pkgdir/usr/bin/
  install -Dm 755 build/bamleftalign -t  $pkgdir/usr/bin/
  cd build/libfreebayes_common.a.p
  gcc -shared *.o -o libfreebayes_common.so
  install -Dm755 libfreebayes_common.so -t $pkgdir/usr/lib/
}
