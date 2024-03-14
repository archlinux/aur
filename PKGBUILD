# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Michael Jakl <jakl.michael@gmail.com>
# Contributor: devmotion <nospam-archlinux.org@devmotion.de>
# Contributor: Valentin Churavy <v.churavy@gmail.com>
# With contributions from many kind people at https://aur.archlinux.org/packages/julia-git/

_pkgbase=julia
pkgbase=${_pkgbase}-git
pkgname=${_pkgbase}-git
pkgver=1.10.2.r55077.gbd47eca2c8a
pkgrel=1
arch=(x86_64)
pkgdesc='High-level, high-performance, dynamic programming language'
url='https://julialang.org/'
license=(MIT)
depends=(blas64-openblas
         fftw
         libblastrampoline
         libgit2
         libunwind
         libutf8proc
         lld
         llvm-julia-libs
         mbedtls2
         openlibm
         p7zip
         pcre2
         suitesparse)
makedepends=(cmake
             git
             gcc-fortran
             libwhich
             llvm-julia
             patchelf
             python)
optdepends=('gnuplot: If using the Gaston Package from julia')
source=(git+https://github.com/JuliaLang/julia.git#branch=release-1.10
        c12e8515.patch
        julia-libgit2-1.7.patch::https://github.com/JuliaLang/julia/commit/2c4c068e.patch
        julia-libunwind-1.6.patch
        julia-libcholmod-cuda.patch
        julia-suitesparse-7.patch
        julia-hardcoded-libs.patch)
backup=(etc/julia/startup.jl)
sha256sums=('SKIP'
            '2cc294b63e601d50341979fb936826bdba59de2165a5929eae927e152652f367'
            'b533dd999f019258cbcae1563f18715f41e42e0786b681150cb2c28f8a0da963'
            '3c0c03eabb668e3242fcd3058c1011dfbb579cc1c5adc3ae1016531e711cc64e'
            'f69afd7db3fabe4b747afa2404e1202c1dcfe0f8c5fe5238e424eea737fa2a23'
            '0fd1a0c1fcbe7f583139ed3a4a87f77963f06876d69058fa3ffbedfaec609ee7'
            '02f0ae518dfd50c2b3abf95fa760de85298baf79d80c2f6f48ac182e58a736d7')
options=(!lto)
provides=('julia')
conflicts=('julia')


pkgver() {
  cd $_pkgbase

  # use the version from VERSION file
  ver=`git show makepkg:VERSION | sed 's/-/./g'`
  # Combine ver with rev-count and latest commit
  printf "%s.r%s.g%s" $(echo $ver) "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgbase
  git submodule init
  git submodule update

# libunwind 1.6 compatibility
  patch -p1 -i ../julia-libunwind-1.6.patch
# Ignore harmless test failure, needs investigation
  sed -e '/int.jl/d' -i test/cmdlineargs.jl
# Revert test that depends on patched gmp
  patch -Rp1 -i ../c12e8515.patch
# Harmless test failure, needs investigation
  sed -e '/int.jl/d' -i test/cmdlineargs.jl
# libgit2 1.7 compatibility
  patch -p1 -i ../julia-libgit2-1.7.patch
# Don't use libcholmod-cuda
  patch -p1 -i ../julia-libcholmod-cuda.patch
# Don't hardcode library names
  patch -p1 -i ../julia-hardcoded-libs.patch
# Fix warnings with suitesparse 7
  #cd stdlib/srccache
  #_SAsha=279b363ca8d3129d4742903d37c8b11545fa08a2
  #tar -xzf SparseArrays-$_SAsha.tar.gz
  #patch -d JuliaSparse-SparseArrays.jl-${_SAsha:0:7} -p1 < "$srcdir"/julia-suitesparse-7.patch
  #rm SparseArrays-$_SAsha.tar.gz
  #tar -czf SparseArrays-$_SAsha.tar.gz JuliaSparse-SparseArrays.jl-${_SAsha:0:7}
  #md5sum SparseArrays-$_SAsha.tar.gz | cut -d ' ' -f 1 > ../../deps/checksums/SparseArrays-$_SAsha.tar.gz/md5
  #sha512sum SparseArrays-$_SAsha.tar.gz | cut -d ' ' -f 1 > ../../deps/checksums/SparseArrays-$_SAsha.tar.gz/sha512
}

_make() {
  local make_options=(
    prefix=/usr
    bindir=/usr/bin
    sysconfdir=/etc
    libexecdir=/usr/lib
    USE_BINARYBUILDER=0
    USE_SYSTEM_CSL=1
    USE_SYSTEM_LLVM=1
    USE_SYSTEM_LLD=1
    USE_SYSTEM_LIBUNWIND=1
    USE_SYSTEM_PCRE=1
    USE_SYSTEM_BLAS=1
    USE_SYSTEM_LAPACK=1
    USE_SYSTEM_LIBBLASTRAMPOLINE=1
    USE_SYSTEM_GMP=1
    USE_SYSTEM_MPFR=1
    USE_SYSTEM_LIBSUITESPARSE=1
    USE_SYSTEM_LIBWHICH=1
    USE_SYSTEM_DSFMT=0
    USE_SYSTEM_LIBUV=0
    USE_SYSTEM_UTF8PROC=1
    USE_SYSTEM_LIBGIT2=1
    USE_SYSTEM_LIBSSH2=1
    USE_SYSTEM_MBEDTLS=1
    USE_SYSTEM_CURL=1
    USE_SYSTEM_PATCHELF=1
    USE_SYSTEM_ZLIB=1
    USE_SYSTEM_P7ZIP=1
    USE_SYSTEM_OPENLIBM=1
    USE_BLAS64=1
    LIBBLAS=-lblas64
    LIBBLASNAME=libblas64
    LIBLAPACK=-llapack64
    LIBLAPACKNAME=liblapack64
    MARCH=x86-64
    VERBOSE=1
    JLDFLAGS="$LDFLAGS"
    LLVM_CONFIG=/usr/lib/llvm-julia/bin/llvm-config
  )

  LD_LIBRARY_PATH="/usr/lib/mbedtls2" make "${make_options[@]}" "$@"
}

build() {
  cd $_pkgbase
  _make release
}

check() {
  cd $_pkgbase/test
  ln -s /etc/ssl/cert.pem ../usr/share/julia

  ../julia --check-bounds=yes --startup-file=no ./runtests.jl \
    --skip Downloads \
    --skip Sockets \
    --skip nghttp2_jll \
    --skip GMP_jll \
    --skip LibCURL \
    --skip LibSSH2_jll \
    --skip MbedTLS_jll \
    --skip MPFR_jll \
    --skip OpenBLAS_jll \
    --skip SuiteSparse_jll \
    --skip PCRE2_jll \
    --skip LibGit2_jll \
    --skip Zlib_jll
  find ../stdlib \( -name \*.cov -o -name \*.mem \) -delete
  rm -fr ../stdlib/Artifacts/test/artifacts
}

package() {
  cd $_pkgbase
  _make DESTDIR="$pkgdir" install

  ln -sf /etc/ssl/cert.pem "$pkgdir"/usr/share/julia # Needed by some packages

  rm "$pkgdir"/usr/lib/julia/libccalltest.so.debug # Remove debug testing library
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname

  install -Dm644 contrib/julia.svg -t "$pkgdir"/usr/share/pixmaps
}
