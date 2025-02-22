# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=freebayes
pkgver=1.3.9
pkgrel=1
pkgdesc="About Bayesian haplotype-based genetic polymorphism discovery and genotyping"
arch=('x86_64')
url="https://github.com/freebayes/freebayes"
license=('MIT')
depends=('tabixpp' 'seqlib' 'vcflib')
makedepends=('ninja' 'meson' 'git' 'cmake' 'make'
  'vcftools' 'samtools' 'parallel' 'bc' 'perl' 'patch'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "fastahack.zip::https://github.com/ekg/fastahack/archive/refs/tags/v1.0.0.tar.gz"
  "multichoose.zip::https://github.com/vcflib/multichoose/archive/255192edd49cfe36557f7f4f0d2d6ee1c702ffbb.zip"
  "smithwaterman.zip::https://github.com/ekg/smithwaterman/archive/2610e259611ae4cde8f03c72499d28f03f6d38a7.zip"
  "meson.patch::https://github.com/freebayes/freebayes/pull/823.patch"
)
sha256sums=('41ed3074c7648375286168a6708e02dac6788eaca4ca6039ff5a7ed91f257b53'
            'cc1c04729b0c8ba3647cbb7e15e2b490ce701d73773f30f5892d68c36a1dceae'
            '799ce24cf3784090df39dd9552d515bda9c9e7d3f24e7712dd08565680b5c8ed'
            '0806976c46a5117c7b7a6d4e174e267f05bc652885ca72a82b91e5a87600d4f9'
            '910d79a9c3c1cb81936db3c34241334d2635abcd4b38f4dd080580c6cb921e9c')
prepare() {
  patch -p1 -i ${srcdir}/meson.patch -d "${pkgname}-${pkgver}"
  mv fastahack-*/* "${pkgname}-${pkgver}"/contrib/fastahack
  mv multichoose-*/* "${pkgname}-${pkgver}"/contrib/multichoose
  mv smithwaterman-*/* "${pkgname}-${pkgver}"/contrib/smithwaterman

  cd "${pkgname}-${pkgver}"

  sed -i meson.build -e "s|dependency('libvcflib'|cc.find_library('libvcflib'|g" \
    -e "s|dependency('libseqlib'|cc.find_library('libseqlib'|g" \
    -e "s|'src',|'src', '/usr/include',|g"
  sed -i src/{*.cpp,*.h} \
    -e 's|#include "../intervaltree/IntervalTree.h"|#include <vcflib/IntervalTree.h>|g' \
    -e 's|<IntervalTree.h>|<vcflib/IntervalTree.h>|g' \
    -e 's|<intervaltree/IntervalTree.h>|<vcflib/IntervalTree.h>|g' \
    -e 's|"join.h"|<vcflib/join.h>|g' \
    -e 's|"Variant.h"|<vcflib/Variant.h>|g'
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
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 build/freebayes -t $pkgdir/usr/bin/
  install -Dm 755 build/bamleftalign -t $pkgdir/usr/bin/
  install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/${pkgname}/
  cd build/libfreebayes_common.a.p
  gcc -shared *.o -o libfreebayes_common.so
  install -Dm755 libfreebayes_common.so -t $pkgdir/usr/lib/
}
