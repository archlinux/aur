# Maintainer: Clint Valentine <valentine.clint@gmail.com>
pkgname=vcflib-git
_pkgname=vcflib
pkgver=1.0.3.r330.ga36dbe9
pkgrel=1
pkgdesc="C++ library and cmdline tools for parsing and manipulating VCF files doi: 10.1101/2021.05.21.445151"
arch=('x86_64')
url="https://github.com/vcflib/vcflib"
license=('MIT')
provides=(${_pkgname})
depends=('python' 'htslib')
makedepends=('git' 'cmake' 'make' 'pybind11' 'tabixpp'
'pandoc'
)
optdepends=('r: running R scripts'
'perl: running Perl scripts'
)
source=("git+https://github.com/vcflib/vcflib.git"
"git+https://github.com/smarco/WFA2-lib.git"
"git+https://github.com/ekg/fastahack.git"
"git+https://github.com/ekg/filevercmp.git"
"git+https://github.com/ekg/fsom.git"
"git+https://github.com/ekg/intervaltree.git"
"git+https://github.com/edawson/libVCFH.git"
"git+https://github.com/ekg/multichoose.git"
"git+https://github.com/ekg/smithwaterman.git"
"simde::git+https://github.com/simd-everywhere/simde-no-tests.git"
)

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
pkgver() {
  cd "${_pkgname//-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'v' -f2
}

prepare(){
  cd ${srcdir}
  cp -rf WFA2-lib/*  ${_pkgname}/contrib/WFA2-lib
  for module in {fastahack,filevercmp,fsom,intervaltree,libVCFH,multichoose,smithwaterman}; do
    cp -rf ${module}/* ${_pkgname}/${module}
  done
  cd ${_pkgname}
  sed -i 's| contrib/tabixpp/tabix.cpp|/usr/include/tabix/tabix.cpp|g' CMakeLists.txt
  sed -i 's|vcflib STATIC|vcflib SHARED|g' CMakeLists.txt
  sed -i 's|<tabix.hpp>|<tabix/tabix.hpp>|g' src/Variant.h
}
build() {
  cd $srcdir/${_pkgname}
  install -d build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build . -- PREFIX=/usr HTS_HEADERS=/usr/include/htslib  HTS_LIB=/usr/lib/libhts.so

}

package() {
  cd "$_pkgname"/build
  make install DESTDIR="$pkgdir"
  mv ${pkgdir}/usr/lib/pyvcf*  ${pkgdir}/usr/lib/pyvcflib.so
  mkdir ${pkgdir}/usr/share
  mv ${pkgdir}/usr/man ${pkgdir}/usr/share
  # sed -i 's|bindings/cpp/WFAligner.hpp|WFA2/bindings/cpp/WFAligner.hpp|g' ${pkgdir}/usr/include/Variant.h
  # install -d ${pkgdir}/usr/include/vcflib
  # mv ${pkgdir}/usr/include/{*.h,*.hpp} ${pkgdir}/usr/include/vcflib

  # another packages called wfa2lib
  install -Dm644 $srcdir/${_pkgname}/contrib/WFA2-lib/bindings/cpp/*.hpp -t ${pkgdir}/usr/include/bindings/cpp
  install -Dm644 $srcdir/${_pkgname}/contrib/WFA2-lib/wavefront/*.h  -t ${pkgdir}/usr/include/wavefront
  install -Dm644 $srcdir/${_pkgname}/contrib/WFA2-lib/utils/*.h  -t ${pkgdir}/usr/include/utils
  install -Dm644 $srcdir/${_pkgname}/contrib/WFA2-lib/system/*.h  -t ${pkgdir}/usr/include/system
  install -Dm644 $srcdir/${_pkgname}/contrib/WFA2-lib/alignment/*.h  -t ${pkgdir}/usr/include/alignment
}
