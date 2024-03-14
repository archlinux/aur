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
pkgver=1.9.3.r53539.gbed2cd540a1
pkgrel=1
arch=(x86_64)
pkgdesc='High-level, high-performance, dynamic programming language'
url='https://julialang.org/'
license=(MIT)
depends=(fftw hicolor-icon-theme libgit2 libunwind libutf8proc blas64-openblas
         suitesparse mbedtls2 openlibm pcre2 llvm-julia-libs p7zip libblastrampoline lld)
makedepends=(git cmake gcc-fortran python llvm-julia patchelf libwhich)
optdepends=('gnuplot: If using the Gaston Package from julia')
provides=('julia')
conflicts=('julia')
options=(!lto)
backup=(etc/julia/startup.jl)
source=(git+https://github.com/JuliaLang/julia.git#branch=release-1.9
        julia-libunwind-1.6.patch
        julia-hardcoded-libs.patch
        julia-libgit2-1.7.patch
        julia-suitesparse-7.patch
        959902f1.patch
        e08e1444.patch
        f11bfc6c.patch
        21d4c2f1.patch)
sha256sums=('SKIP'
            '3c0c03eabb668e3242fcd3058c1011dfbb579cc1c5adc3ae1016531e711cc64e'
            '94e6d4fa9c68360c795807b49bcb126bbbbf4c927cf7e8358b3e0e3d2183d63e'
            '97efa327f1d389de59258f6047689ca7bed2b7be922088566865defd5d305ed0'
            '481ce9b093969c2433b86d4d2bc0815470225f680712fc6231df3629ca7fbe5e'
            '5e3f55e68e3f7172d545888479cd9a35e7589d0467684c6d98c721e3b1878acd'
            '628d41c0b7739ed6c4c34c7416efd81646fbd17ebab9e88ae46a3668650d3104'
            'ea1b30a11fe4d381d5a2ee2aeb4d7cb688d03e0520805cad8939a11267545e04'
            '2152da5125eb24c7747d6bf47f46af80251ce653dbde952a96ab6a5424b5ae7c')


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

# Port to LLVM 15
  patch -p1 -i ../e08e1444.patch
  patch -p1 -i ../959902f1.patch
  patch -p1 -i ../f11bfc6c.patch
  patch -p1 -i ../21d4c2f1.patch
# libunwind 1.6 compatibility
  patch -p1 -i ../julia-libunwind-1.6.patch
# Don't hardcode library names
  patch -p1 -i ../julia-hardcoded-libs.patch
# Fix tests with libgit2 1.7
  patch -p1 -i ../julia-libgit2-1.7.patch
# Fix warnings with suitesparse 7 (ToDo: not available from git?)
  #cd stdlib/srccache
  #tar -xzf SparseArrays-37e6e58706a54c5a1b96a17cda7d3e8be8bcb190.tar.gz
  #patch -d JuliaSparse-SparseArrays.jl-37e6e58 -p1 < "$srcdir"/julia-suitesparse-7.patch
  #rm SparseArrays-37e6e58706a54c5a1b96a17cda7d3e8be8bcb190.tar.gz
  #tar -czf SparseArrays-37e6e58706a54c5a1b96a17cda7d3e8be8bcb190.tar.gz JuliaSparse-SparseArrays.jl-37e6e58
  #md5sum SparseArrays-37e6e58706a54c5a1b96a17cda7d3e8be8bcb190.tar.gz | cut -d ' ' -f 1 > ../../deps/checksums/SparseArrays-37e6e58706a54c5a1b96a17cda7d3e8be8bcb190.tar.gz/md5
  #sha512sum SparseArrays-37e6e58706a54c5a1b96a17cda7d3e8be8bcb190.tar.gz | cut -d ' ' -f 1 > ../../deps/checksums/SparseArrays-37e6e58706a54c5a1b96a17cda7d3e8be8bcb190.tar.gz/sha512
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
    LLVM_CONFIG=llvm-config-15
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

# TODO: Remove SparseArrays from skip list when SuiteSparse is updated to v7 (it is downloaded at build time from a separate repo, not easily patchable)
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
    --skip SparseArrays \
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
}
