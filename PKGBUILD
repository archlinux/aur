# maintainer: bipin <kbipinkumar@pm.me>
pkgbase=mmseqs2
pkgname=('mmseqs2-sse4' 'mmseqs2-avx2')
_pkgbase=${pkgbase//mm/MM}
pkgver=18.8cc5c
_pkgver=18-8cc5c
pkgrel=1
pkgdesc="ultra fast and sensitive search and clustering suite. https://doi.org/10.1038/nbt.3988"
arch=('x86_64')
url="https://github.com/soedinglab/mmseqs2"
license=('MIT')
makedepends=('cmake' 'zlib' 'openmp' 'vim' 'perl')
source=("$_pkgbase-$_pkgver.tar.gz::https://github.com/soedinglab/MMseqs2/archive/refs/tags/${_pkgver}.tar.gz"
        "bash-completion.patch"
        "fix_util_installation.patch"
        )
install=bash-completion.install
sha256sums=('3541b67322aee357fd9ca529750d36cb1426aa9bcd1efb2dc916e35219e1a41c'
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
  optdepends=('r: For running bundled rscript file')
  provides=('mmseqs2')
  conflicts=('mmseqs2-avx2')
  pkgdesc="ultra fast and sensitive search and clustering suite optimised for SSE4 instructions. https://doi.org/10.1038/nbt.3988"

  cd $_pkgbase-$_pkgver
  DESTDIR="$pkgdir" cmake --install build1
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname}"
  cd util
  install -Dm755 bash-completion.sh "${pkgdir}"/usr/share/${pkgbase}/bash-completion.sh
  install -Dm644 format_substitution_matrix.R "${pkgdir}"/usr/share/${pkgbase}/format_substitution_matrix.R
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
  install -Dm644 format_substitution_matrix.R "${pkgdir}"/usr/share/${pkgbase}/format_substitution_matrix.R
}
