# Maintainer: bipin kumar <kbipinkumar@pm.me>
# Contributor: Saulius Lukauskas <luksaulius@gmail.com>
# Contributor: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
pkgname=salmon
pkgver=1.11.4
pkgrel=3
pkgdesc="Highly-accurate & wicked fast transcript-level quantification from RNA-seq reads using lightweight alignments"
arch=('x86_64')
url="https://combine-lab.github.io/$pkgname/"
license=('GPL-3.0-only')
depends=('intel-tbb' 'libgcc' 'libstdc++' 'bzip2' 'htslib' 'boost-libs' 'gcc-libs' 'xz' 'zlib' 'zlib-ng' 'glibc' 'libgff')
makedepends=('boost>=1.55' 'catch2' 'mimalloc' 'cmake' 'eigen' 'unzip' 'cereal' 'curl' 'bzip2' 'python-sphinx' 'libdivide' 'git')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/COMBINE-lab/$pkgname/archive/v$pkgver.tar.gz"
    "pufferfish::git+https://github.com/COMBINE-lab/pufferfish.git#commit=ace68c1c022816ba8c50a1a07c5d08f2abd597d6"
    "sshash::git+https://github.com/rob-p/sshash.git#commit=c11d0f03fa33880bc152df64d528f1896601502b"
    "pthash::git+https://github.com/jermp/pthash.git#commit=e04a1920ffeae9e7d876acd0362cab79605f7af3"
    "bits::git+https://github.com/jermp/bits.git#commit=f5498a856f13e657d62c78afa22448c16d335972"
    "doctest::git+https://github.com/doctest/doctest.git#commit=ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
    "essentials::git+https://github.com/jermp/essentials.git#commit=9da682ff4809ed6a45b81a6785313a9b60e50699"
    "cmd_line_parser::git+https://github.com/jermp/cmd_line_parser.git#commit=89ab616e01b50dcf492cd5a8e0b4973e65e636bc"
    "mm_file::git+https://github.com/jermp/mm_file.git#commit=5b5291360488095ce3617c48af0f5145fdf9e710"
    "xxHash::git+https://github.com/Cyan4973/xxHash.git#commit=d4ad85e4afaad5c780f54db1dc967fff5a869ffd"
    "FQFeeder::git+https://github.com/rob-p/FQFeeder.git#commit=f5b08d1002351c192b69048ac9f6cf4c7c116265"
    )
sha256sums=('9410904fa787f1f9aca635626fcdca08f3af9b02f820963f9439e80fb56d23b8'
            '96c9f9d339a3ede0f33006a153994e2ed25ab4aa94a3384c8d08f2e6e17f340c'
            '9e87ba229be12cd5832298fd3da0333e5706ab8ca996a01323fcc65d28dcd121'
            '02964606fba93939b3783a36f5bb8d7fbd45445187b1efecc3451bdd4b8e196d'
            '2265ab353dcbffcde02347752595d9fedb03cae1d3e813059a70db5e0f93cc86'
            'e5044b134640bbc1344f03ad919806d9856ac2973f6bdb80cdb0da67c7d701e6'
            '1f78df3905e4b5497be89ccba3d6465ffc22a72cf87afbf8484b5998f53e3758'
            'a0a5ffd61def371da5bc7f1d8874b79e112458a437f56f69e566867fbcfce93a'
            '87047f06a8547abf8d5388ca3cc3fd087dfb5f1ecc561ac6c378a74c69ec93fc'
            '4bea37fc445b659987e0e8d311cab0bd1b6fefdcbac255b353454d5b57b4c3df'
            '5852bc4d5386e8fc9ee1a7a47e36fe7791b0f2053084989d02f2103102dbc1b7')

prepare() {
  cd "${srcdir}/pufferfish"
  git submodule init
  git config submodule.external/sshash.url "${srcdir}/sshash"
  git -c protocol.file.allow=always submodule update
  
  cd "${srcdir}/pufferfish/external/sshash"
  git submodule init
  git config submodule.external/pthash.url "${srcdir}/pthash"
  git -c protocol.file.allow=always submodule update
  
  cd "${srcdir}/pufferfish/external/sshash/external/pthash"
  git submodule init
  git config submodule.external/bits.url "${srcdir}/bits"
  git config submodule.external/cmd_line_parser.url "${srcdir}/cmd_line_parser"
  git config submodule.external/mm_file.url "${srcdir}/mm_file"
  git config submodule.external/xxHash.url "${srcdir}/xxHash"
  git -c protocol.file.allow=always submodule update

  cd "${srcdir}/pufferfish/external/sshash/external/pthash/external/bits"
  git submodule init
  git config submodule.external/doctest.url "${srcdir}/doctest"
  git config submodule.external/essentials.url "${srcdir}/essentials"
  git -c protocol.file.allow=always submodule update
  
  cd "${srcdir}/pufferfish"
  # Prevent Pufferfish from redundantly fetching and compiling zlib-ng statically by aliasing the system one
  sed -i 's/FetchContent_MakeAvailable(zlib-ng)/add_library(zlibstatic SHARED IMPORTED)\n  set_target_properties(zlibstatic PROPERTIES IMPORTED_LOCATION "\${ZLIBNG_LIBRARY}" INTERFACE_INCLUDE_DIRECTORIES "\${ZLIBNG_INCLUDE_DIR}")/g' CMakeLists.txt
  # patch pufferfish to use system provided libdivide
  sed -i 's|#include "libdivide/libdivide.h"|#include <libdivide.h>|g' "${srcdir}/pufferfish/src/PuffAligner.cpp"
  
  cd "${srcdir}/$pkgname-$pkgver"
  
  # Relax libgff version detection to accept any >= 2.0.x package, bypassing strict config-reporting bugs.
  sed -i 's/find_package(libgff 2.0.1/find_package(libgff 2.0/g' cmake/SalmonDependencies.cmake

  # Ensure ZLIB comes AFTER static pufferfish archives to correctly resolve its missing symbols
  sed -i -e '/pufferfish::puffer/a \    ${SALMON_ZLIB_LIBRARIES}' src/CMakeLists.txt
  
  # Use pacman provided eigen3 instead of one bundled with sources.
  sed -i 's|${GAT_SOURCE_DIR}/include/eigen3|/usr/include/eigen3|g' src/CMakeLists.txt
  # Modern Boost (like 1.90.0) is header-only for 'system' and no longer ships the empty stub library.
  # We must strip 'system' from the COMPONENTS list otherwise find_package(Boost) aborts incorrectly!
  sed -i 's/set(_salmon_boost_components system /set(_salmon_boost_components /' cmake/SalmonDependencies.cmake
}


build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
    -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_SKIP_RPATH=YES \
    -Wno-dev \
    -DSALMON_BOOST_USE_STATIC_LIBS=OFF \
    -DBZIP2_LIBRARIES=-lbz2 \
    -DBZIP2_INCLUDE_DIR=/usr/include \
    -DLIBLZMA_INCLUDE_DIR=/usr/include/ \
    -DLIBLZMA_LIBRARY=lzma \
    -DZLIBNG_LIBRARY=/usr/lib/libz.so \
    -DZLIBNG_INCLUDE_DIR=/usr/include \
    -DHTSLIB_LIBRARY=/usr/lib/libhts.so \
    -DHTSLIB_INCLUDE_DIR=/usr/include \
    -DFETCHCONTENT_SOURCE_DIR_SALMON_PUFFERFISH="${srcdir}/pufferfish" \
    -DFETCHCONTENT_SOURCE_DIR_SALMON_FQFEEDER="${srcdir}/FQFeeder" \
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
