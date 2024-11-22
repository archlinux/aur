# Maintainer: Guoyi
pkgname=vcflib
pkgver=1.0.12
pkgrel=2
pkgdesc="C++ library and cmdline tools for parsing and manipulating VCF files doi: 10.1101/2021.05.21.445151"
arch=('x86_64')
url="https://github.com/vcflib/vcflib"
license=('MIT')
depends=('python' 'htslib' 'wfa2-lib')
makedepends=('git' 'cmake' 'pybind11' 'tabixpp' 'pandoc')
optdepends=('r: running R scripts'
  'perl: running Perl scripts'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vcflib/vcflib/archive/refs/tags/v${pkgver}.tar.gz"
  "fastahack.tar.gz::https://github.com/ekg/fastahack/archive/refs/tags/v1.0.0.tar.gz"
  "git+https://github.com/ekg/filevercmp.git"
  "git+https://github.com/ekg/fsom.git"
  # "intervaltree.tar.gz::https://github.com/ekg/intervaltree/archive/refs/tags/v0.1.tar.gz"
  "git+https://github.com/ekg/intervaltree.git"
  "git+https://github.com/edawson/libVCFH.git"
  "git+https://github.com/ekg/multichoose.git"
  "git+https://github.com/ekg/smithwaterman.git"
  "simde::git+https://github.com/simd-everywhere/simde-no-tests.git"
)

md5sums=('5eef989c4d172d74a6f6b280ec598808'
         'eeb7d046978d7633fe4d07def29f48c3'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd ${srcdir}
  cp -rf fastahack-1.0.0 fastahack
  for module in {fastahack,filevercmp,fsom,intervaltree,libVCFH,multichoose,smithwaterman}; do
    cp -rf ${module}/* ${pkgname}-${pkgver}/contrib/${module}
  done
  cd ${pkgname}-${pkgver}
  sed -i CMakeLists.txt \
    -e 's| contrib/tabixpp/tabix.cpp|/usr/include/tabix/tabix.cpp|g' \
    -e 's|vcflib STATIC|vcflib SHARED|g' \
    -e '/install(TARGETS ${WFALIB}/d'
  sed -i 's|<tabix.hpp>|<tabix/tabix.hpp>|g' src/Variant.h

}
build() {
  cd $srcdir
  install -d build
  cmake -B build -S ${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr -DZIG=OFF -DCMAKE_BUILD_TYPE=None -DWFA_GITMODULE=OFF \
    -DCMAKE_SHARED_LINKER_FLAGS="-lwfa2cpp -lwfa2"
  cmake --build build -- PREFIX=/usr HTS_HEADERS=/usr/include/htslib HTS_LIB=/usr/lib/libhts.so

}

package() {
  cd build
  make install DESTDIR="$pkgdir"
  mv ${pkgdir}/usr/lib/pyvcf* ${pkgdir}/usr/lib/pyvcflib.so
  mkdir ${pkgdir}/usr/share
  mv ${pkgdir}/usr/man ${pkgdir}/usr/share
  # sed -i 's|bindings/cpp/WFAligner.hpp|WFA2/bindings/cpp/WFAligner.hpp|g' ${pkgdir}/usr/include/Variant.h
  # install -d ${pkgdir}/usr/include/vcflib
  # mv ${pkgdir}/usr/include/{*.h,*.hpp} ${pkgdir}/usr/include/vcflib

}
