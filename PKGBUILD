# maintainer: bipin <kbipinkumar@pm.me>
pkgbase=mmseqs2
pkgname=('mmseqs2-sse4' 'mmseqs2-avx2')
_pkgbase=${pkgbase//mm/MM}
pkgver=16.747c6
_pkgver=16-747c6
pkgrel=1
pkgdesc="ultra fast and sensitive search and clustering suite. https://doi.org/10.1038/nbt.3988"
arch=('x86_64')
url="https://github.com/soedinglab/mmseqs2"
license=('GPL3')
makedepends=('cmake' 'zlib' 'openmp' 'vim')
source=("$_pkgbase-$_pkgver.tar.gz::https://github.com/soedinglab/MMseqs2/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('faeb6841feb8e028651c2391de1346c55c2091a96520b625525d27b99d07ef1d')

build() {
  cd $_pkgbase-$_pkgver
  # 'mmseqs2-sse4'
  cmake -B build1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None  \
    -DHAVE_SSE4_1=1 \
    -DNATIVE_ARCH=0 \
    -DCMAKE_C_FLAGS="${CFLAGS} ${CPPFLAGS}" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} ${CPPFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
    -Wno-dev \
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
    -Wno-dev \
    -DVERSION_OVERRIDE="${_pkgver}"-BioArchLinux_avx2

    # Build 'mmseqs2-sse4'
   MAKEFLAGS=-j1 cmake --build build1
   # Build 'mmseqs2-AVX2'
   MAKEFLAGS=-j1 cmake --build build2

}

package_mmseqs2-sse4() {
  depends=('gcc-libs' 'glibc' 'zlib' 'zstd' 'openmp' 'bzip2' 'bash')
  provides=('mmseqs2')
  conflicts=('mmseqs2-avx2')
  pkgdesc="ultra fast and sensitive search and clustering suite optimised for SSE4 instructions. https://doi.org/10.1038/nbt.3988"

  cd $_pkgbase-$_pkgver
  DESTDIR="$pkgdir" cmake --install build1
  cd util
  install -Dm755 bash-completion.sh "${pkgdir}"/etc/profile.d/mmseqs2-completion.sh
  install -Dm755 format_substitution_matrix.R ${pkgdir}/usr/share/${pkgbase}/format_substitution_matrix.R
  rm -rf "${pkgdir}"/usr/util
}

package_mmseqs2-avx2() {
  depends=('gcc-libs' 'glibc' 'zlib' 'zstd' 'openmp' 'bzip2' 'bash')
  provides=('mmseqs2')
  conflicts=('mmseqs2-sse4')
  pkgdesc="ultra fast and sensitive search and clustering suite optimised for AVX2 instructions. https://doi.org/10.1038/nbt.3988"

  cd $_pkgbase-$_pkgver
  DESTDIR="$pkgdir" cmake --install build2
  cd util
  install -Dm755 bash-completion.sh "${pkgdir}"/etc/profile.d/mmseqs2-completion.sh
  install -Dm755 format_substitution_matrix.R ${pkgdir}/usr/share/${pkgbase}/format_substitution_matrix.R
  rm -rf "${pkgdir}"/usr/util
}
