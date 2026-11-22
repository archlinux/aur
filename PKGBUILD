# maintainer: bipin <kbipinkumar@pm.me>
pkgbase=mmseqs2
pkgname=('mmseqs2-sse4' 'mmseqs2-avx2')
_pkgbase=${pkgbase//mm/MM}
pkgver=19.ab57c
_pkgver=19-ab57c
pkgrel=1
pkgdesc="ultra fast and sensitive search and clustering suite. https://doi.org/10.1038/nbt.3988"
arch=('x86_64')
url="https://github.com/soedinglab/mmseqs2"
license=('MIT')
makedepends=('cmake' 'zlib' 'openmp' 'vim' 'perl' 'rust')
source=("$_pkgbase-$_pkgver.tar.gz::https://github.com/soedinglab/MMseqs2/archive/refs/tags/${_pkgver}.tar.gz"
        "bash-completion.patch"
        "fix_util_installation.patch"
        )
install=bash-completion.install
sha256sums=('68b20700b82c93f2a30a8a7fbe545ab6ec715bfccb13ddcab144d3f3f504c5a4'
            '39432896625dca6240e7f4f6dffebd05f40a1d0de2c724d7123cb63e2464e791'
            'ca25afde5447ec6b72e0a6ca9874eb6b5b93c2ec52ff3f10e4b3929d1aea1e71')
prepare() {
  cd $_pkgbase-$_pkgver
  # add package specific information needed to enable bash autocompletion
  patch -p1 < ${srcdir}/bash-completion.patch
  # Prevent CMake from installing util/ contents to nonstandard /usr/util location.
  patch -p1 < ${srcdir}/fix_util_installation.patch
}

build() {
  cd $_pkgbase-$_pkgver
  # 'mmseqs2-sse4'
  cmake -B build1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None  \
    -DHAVE_SSE4_1=1 \
    -DNATIVE_ARCH=0 \
    -DUSE_SYSTEM_ZSTD=1 \
    -DZSTD_LIBRARIES=/usr/lib/libzstd.so \
    -DCMAKE_C_FLAGS="${CFLAGS} ${CPPFLAGS}" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} ${CPPFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
    -Wno-author \
    -DVERSION_OVERRIDE="${_pkgver}"-BioArchLinux_sse4

  # 'mmseqs2-AVX2'
  cmake -B build2 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DNATIVE_ARCH=0 \
    -DHAVE_AVX2=1 \
    -DCMAKE_C_FLAGS="${CFLAGS} ${CPPFLAGS}" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} ${CPPFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
    -DUSE_SYSTEM_ZSTD=1 \
    -DZSTD_LIBRARIES=/usr/lib/libzstd.so \
    -Wno-author \
    -DVERSION_OVERRIDE="${_pkgver}"-BioArchLinux_avx2

    # Build 'mmseqs2-sse4'
   MAKEFLAGS=-j1 cmake --build build1
   # Build 'mmseqs2-AVX2'
   MAKEFLAGS=-j1 cmake --build build2

}

check() {
      cd "$_pkgbase-$_pkgver"

      echo "==> Testing mmseqs SSE4.1 build..."
      build1/src/mmseqs version
      build1/src/mmseqs easy-search examples/QUERY.fasta examples/DB.fasta "$srcdir/aln_sse4.m8" "$srcdir/tmp_sse4"
      test -s "$srcdir/aln_sse4.m8"
      rm -rf "$srcdir/aln_sse4.m8" "$srcdir/tmp_sse4"

      echo "==> Testing mmseqs AVX2 build..."
      if grep -q avx2 /proc/cpuinfo; then
        build2/src/mmseqs version
        build2/src/mmseqs easy-search examples/QUERY.fasta examples/DB.fasta "$srcdir/aln_avx2.m8" "$srcdir/tmp_avx2"
        test -s "$srcdir/aln_avx2.m8"
        rm -rf "$srcdir/aln_avx2.m8" "$srcdir/tmp_avx2"
      else
        echo "==> Host CPU does not support AVX2; skipping AVX2 execution test."
      fi
    }

package_mmseqs2-sse4() {
  depends=('gcc-libs' 'glibc' 'zlib' 'zstd' 'openmp' 'bzip2' 'bash')
  optdepends=('r: For running bundled rscript file')
  provides=('mmseqs2')
  conflicts=('mmseqs2-avx2')
  pkgdesc="ultra fast and sensitive search and clustering suite optimised for SSE4 instructions. https://doi.org/10.1038/nbt.3988"

  cd $_pkgbase-$_pkgver
  DESTDIR="$pkgdir" cmake --install build1
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname}"
  cd util
  install -Dm755 bash-completion.sh "${pkgdir}"/usr/share/${pkgbase}/bash-completion.sh
  #install -Dm644 format_substitution_matrix.R "${pkgdir}"/usr/share/${pkgbase}/format_substitution_matrix.R
}

package_mmseqs2-avx2() {
  depends=('gcc-libs' 'glibc' 'zlib' 'zstd' 'openmp' 'bzip2' 'bash')
  optdepends=('r: For running bundled rscript file')
  provides=('mmseqs2')
  conflicts=('mmseqs2-sse4')
  pkgdesc="ultra fast and sensitive search and clustering suite optimised for AVX2 instructions. https://doi.org/10.1038/nbt.3988"

  cd $_pkgbase-$_pkgver
  DESTDIR="$pkgdir" cmake --install build2
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname}"
  cd util
  install -Dm755 bash-completion.sh "${pkgdir}"/usr/share/${pkgbase}/bash-completion.sh
  #install -Dm644 format_substitution_matrix.R "${pkgdir}"/usr/share/${pkgbase}/format_substitution_matrix.R
}
