# Maintainer: bipin kumar <kbipinkumar@pm.me>
# Contributor: Saulius Lukauskas <luksaulius@gmail.com>
# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
pkgname=salmon
pkgver=1.10.3
_SVER=${pkgname}-v${pkgver}
pkgrel=9
pkgdesc="Highly-accurate & wicked fast transcript-level quantification from RNA-seq reads using lightweight alignments"
arch=('x86_64')
url="https://combine-lab.github.io/$pkgname/"
license=('GPL-3.0-only')
depends=('intel-tbb' 'bzip2' 'jemalloc' 'boost-libs' 'gcc-libs' 'xz' 'zlib' 'glibc' 'libgff' 'staden-io_lib')
makedepends=('boost>=1.55' 'cmake' 'eigen' 'unzip' 'cereal' 'curl' 'bzip2' 'python-sphinx' 'libdivide')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/COMBINE-lab/$pkgname/archive/v$pkgver.tar.gz"
    "pufferfish.zip::https://github.com/COMBINE-lab/pufferfish/archive/${_SVER}.zip"
    'patch-external_pufferfish_external_twopaco_graphconstructor_assemblyedgeconstructor.patch'
    'patch-external_pufferfish_external_twopaco_graphconstructor_candidateoccurence.patch'
    'patch-external_pufferfish_src_PuffAligner.patch'
    'use-system-stadeniolib.patch'
    )
sha256sums=('a053fba63598efc4ade3684aa2c8e8e2294186927d4fcdf1041c36edc2aa0871'
            '52b6699de0d33814b73edb3455175568c2330d8014be017dce7b564e54134860'
            '67ab9ba34e8447998f1ff97b2f83ea43f445bc2375962a4ca18ac2901c41d23e'
            '47721fc7e9e90a3573e792b2d58998694e5c8fb841393957287e25bd06a23cd8'
            '5101c84958cc83a152f9fe6bb69f676f2327dd7b89eca5c6027af7e8cfc70c9e'
            '6faffda82b537ce17948cae11f15e5f88e0cf40ababc30b6debf52b32a2dde32')

prepare() {
  cd "$pkgname-$pkgver"
  ## Fetch and set up pufferfish source for patching prior to build.
  mkdir -p ${srcdir}/"$pkgname-$pkgver"/external
  mv ${srcdir}/pufferfish-salmon-v${pkgver} ${srcdir}/"$pkgname-$pkgver"/external/pufferfish
  export EXTERNAL_DIR=${srcdir}/"$pkgname-$pkgver"/external
  export INSTALL_DIR=${srcdir}/"$pkgname-$pkgver"/external/install
  mkdir -p ${INSTALL_DIR}/include/pufferfish
  cp ${EXTERNAL_DIR}/pufferfish/include/*.hpp ${INSTALL_DIR}/include/pufferfish/
  cp -r ${EXTERNAL_DIR}/pufferfish/include/ksw2pp ${INSTALL_DIR}/include/pufferfish
  cp -r ${EXTERNAL_DIR}/pufferfish/include/metro ${INSTALL_DIR}/include/pufferfish
  cp -r ${EXTERNAL_DIR}/pufferfish/include/itlib ${INSTALL_DIR}/include/pufferfish
  cp -r ${EXTERNAL_DIR}/pufferfish/include/sparsepp ${INSTALL_DIR}/include/pufferfish
  cp -r ${EXTERNAL_DIR}/pufferfish/include/simde ${INSTALL_DIR}/include/pufferfish
  cp -r ${EXTERNAL_DIR}/pufferfish/include/tsl ${INSTALL_DIR}/include/pufferfish
  mkdir -p ${INSTALL_DIR}/src/pufferfish
  cp -r ${EXTERNAL_DIR}/pufferfish/src/metro ${INSTALL_DIR}/src/pufferfish
  cp ${EXTERNAL_DIR}/pufferfish/src/rank9b.cpp ${INSTALL_DIR}/src/pufferfish
  # patch pufferfish sources to be built with gcc>= 15. Source: https://github.com/COMBINE-lab/salmon/issues/988
  patch -p0 < ${srcdir}/patch-external_pufferfish_src_PuffAligner.patch
  patch -p0 < ${srcdir}/patch-external_pufferfish_external_twopaco_graphconstructor_candidateoccurence.patch
  patch -p0 < ${srcdir}/patch-external_pufferfish_external_twopaco_graphconstructor_assemblyedgeconstructor.patch
  # properly detect staden-io_lib installed in chroot by pacman
  patch -p1 < ${srcdir}/use-system-stadeniolib.patch
  # Use OS provided eigen3 instead of one bundled with sources.
  sed -i 's|${GAT_SOURCE_DIR}/include/eigen3|/usr/include/eigen3|g' src/CMakeLists.txt
  sed -Ei 's|(find_package\(Boost.*) system([a-z_ ]*)( REQUIRED)?\)|\1\2 OPTIONAL_COMPONENTS system\3)|' CMakeLists.txt
  # Add missing include <string> in 1.3.0 headers
  sed -i 's/#include <unordered_map>/#include <unordered_map>\n#include <string>/g' include/BAMUtils.hpp
}


build() {
  cd "$pkgname-$pkgver"
  export STADEN_INCLUDE_DIR=/usr/include
  cmake -B build \
    -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_SKIP_RPATH=YES \
    -Wno-dev \
    -DBOOST_INCLUDEDIR='/usr/include' \
    -DBOOST_LIBRARYDIR='/usr/lib' \
    -DUSE_SHARED_LIBS=TRUE \
    -DFETCHED_PUFFERFISH=TRUE \
    -DBZIP2_LIBRARIES=-lbz2 \
    -DBZIP2_INCLUDE_DIR=/usr/include \
    -DLIBLZMA_INCLUDE_DIR=/usr/include/ \
    -DLIBLZMA_LIBRARY=lzma \
    -DCMAKE_MODULE_PATH=/usr/share/cmake/Modules

  cmake --build build
  # build manpages
  cd doc
  make man
}

check() {
  cd "$pkgname-$pkgver"

  ctest --test-dir build --output-on-failure

}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644  include/{*.h,*.hpp,*.tpp} -t ${pkgdir}/usr/include/${pkgname}

  #install manpages
  install -d ${pkgdir}/usr/share/man/man1/
  install -Dm644 doc/build/man/salmon.1 ${pkgdir}/usr/share/man/man1/salmon.1

  # clear cmake files
  rm -rf ${pkgdir}/usr/lib/{graphdump,ntcard,twopaco}
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
