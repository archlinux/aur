# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=freebayes
pkgver=1.3.7
pkgrel=1
pkgdesc="About Bayesian haplotype-based genetic polymorphism discovery and genotyping"
arch=('x86_64')
url="https://github.com/freebayes/freebayes"
license=('MIT')
depends=('tabixpp' 'seqlib' 'vcflib')
makedepends=('ninja' 'meson' 'git' 'cmake' 'make'
'vcftools' 'samtools' 'parallel' 'bc' 'perl'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('89c2202aaa82925bc6a49e04df593e5ef3b1547b3b514efcbd490a54d8ad200b')
prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i "s|dependency('libvcflib'|cc.find_library('libvcflib'|g" meson.build
  sed -i "s|dependency('libseqlib'|cc.find_library('libseqlib'|g" meson.build
  sed -i 's|#include "../intervaltree/IntervalTree.h"|#include <IntervalTree.h>|g' src/{*.cpp,*.h}
}
build() {
  cd "${pkgname}-${pkgver}"
  test -d build || mkdir build
  meson setup --prefix=/usr --buildtype=release \
   -Dprefer_system_deps=true  -Dstatic=false \
   --default-library=shared \
   build
  cd build
  ninja -v
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 build/freebayes  -t $pkgdir/usr/bin/
  install -Dm 755 build/bamleftalign -t  $pkgdir/usr/bin/
  install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/${pkgname}/
  cd build/libfreebayes_common.a.p
  gcc -shared *.o -o libfreebayes_common.so
  install -Dm755 libfreebayes_common.so -t $pkgdir/usr/lib/
}
