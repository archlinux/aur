# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=freebayes
pkgver=1.3.10
pkgrel=1
pkgdesc="About Bayesian haplotype-based genetic polymorphism discovery and genotyping"
arch=('x86_64')
url="https://github.com/freebayes/freebayes"
license=('MIT')
depends=('tabixpp' 'seqlib' 'vcflib')
makedepends=('ninja' 'meson' 'git' 'cmake' 'make'
  'vcftools' 'samtools' 'parallel' 'bc' 'perl' 'patch' 'simde'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "fastahack.zip::https://github.com/ekg/fastahack/archive/refs/tags/v1.0.0.tar.gz"
  "smithwaterman.zip::https://github.com/ekg/smithwaterman/archive/2610e259611ae4cde8f03c72499d28f03f6d38a7.zip"
)
sha256sums=('31900e4ad23f471310838f0ae6f6020b159bf5fa3d9826de285c4c91bfe0eeb2'
            'cc1c04729b0c8ba3647cbb7e15e2b490ce701d73773f30f5892d68c36a1dceae'
            '0806976c46a5117c7b7a6d4e174e267f05bc652885ca72a82b91e5a87600d4f9')
prepare() {
  mv fastahack-*/* "${pkgname}-${pkgver}"/contrib/fastahack
  mv smithwaterman-*/* "${pkgname}-${pkgver}"/contrib/smithwaterman

  cd "${pkgname}-${pkgver}"

  sed -i meson.build -e "s|dependency('libvcflib'|cc.find_library('libvcflib'|g" \
    -e "s|dependency('libseqlib'|cc.find_library('libseqlib'|g" \
    -e "s|'src',|'src', '/usr/include', 'contrib',|g"
  sed -i src/{*.cpp,*.h} \
    -e 's|#include "../intervaltree/IntervalTree.h"|#include <vcflib/IntervalTree.h>|g' \
    -e 's|<IntervalTree.h>|<vcflib/IntervalTree.h>|g' \
    -e 's|<intervaltree/IntervalTree.h>|<vcflib/IntervalTree.h>|g' \
    -e 's|"join.h"|<vcflib/join.h>|g' \
    -e 's|"Variant.h"|<vcflib/Variant.h>|g'

  sed -i contrib/vcflib-min/include/vcflib/Variant.h \
    -e 's|<tabix.hpp>|<tabix/tabix.hpp>|g'
}
build() {
  cd "${pkgname}-${pkgver}"
  test -d build || mkdir build
  meson setup --prefix=/usr --buildtype=release \
    -Dprefer_system_deps=false -Dstatic=false \
    --default-library=shared \
    build
  cd build
  ninja -v
  cd libfreebayes_common.a.p
  gcc -shared *.o -o libfreebayes_common.so -fPIC
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 build/freebayes -t $pkgdir/usr/bin/
  install -Dm 755 build/bamleftalign -t $pkgdir/usr/bin/
  install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/${pkgname}/

  install -Dm755 build/libfreebayes_common.a.p/libfreebayes_common.so -t $pkgdir/usr/lib/
}
