# Maintainer: Guoyi
pkgname=vcflib
pkgver=1.0.13
pkgrel=1
pkgdesc="C++ library and cmdline tools for parsing and manipulating VCF files doi: 10.1101/2021.05.21.445151"
arch=('x86_64')
url="https://github.com/vcflib/vcflib"
license=('MIT')
depends=('python' 'htslib' 'wfa2-lib')
makedepends=('git' 'cmake' 'pybind11' 'tabixpp' 'pandoc' 'ninja')
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

md5sums=('b3f0535c1658ef0cf50de026aa6d31ec'
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
    -e '/install(TARGETS ${WFALIB}/d' \
    -e '/tabix.hpp/d'
  sed -i 's|<tabix.hpp>|<tabix/tabix.hpp>|g' src/Variant.h

}
build() {
  local cmake_args
  cmake_args=(
    -G Ninja
    -B build
    -S ${pkgname}-${pkgver}
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DZIG=OFF
    -DWFA_GITMODULE=OFF
    -DCMAKE_SHARED_LINKER_FLAGS="-lwfa2cpp -lwfa2"
  )
  cd $srcdir
  install -d build
  cmake "${cmake_args[@]}"
  ninja -C build

}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
  mv ${pkgdir}/usr/lib/pyvcf* ${pkgdir}/usr/lib/pyvcflib.so
  # sed -i 's|bindings/cpp/WFAligner.hpp|WFA2/bindings/cpp/WFAligner.hpp|g' ${pkgdir}/usr/include/Variant.h
  # install -d ${pkgdir}/usr/include/vcflib
  # mv ${pkgdir}/usr/include/{*.h,*.hpp} ${pkgdir}/usr/include/vcflib

}
