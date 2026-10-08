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
pkgname=${_pkgbase}-git
pkgver=1.13.2.DEV.r60286.ga379b7678a0
pkgrel=1
arch=(x86_64)
pkgdesc='High-level, high-performance, dynamic programming language'
url='https://julialang.org/'
license=(MIT)
depends=(blas64-openblas
         dsfmt
         fftw
         libatomic
         libblastrampoline
         libgit2
         libnghttp2
         libunwind
         libutf8proc
         lld
         llvm-julia-libs
         openlibm
         openssl
         7zip
         pcre2
         suitesparse
         zstd)
makedepends=(cmake
             git
             gcc-fortran
             libwhich
             llvm-julia
             patchelf
             python)
optdepends=('gnuplot: If using the Gaston Package from julia')
source=(git+https://github.com/JuliaLang/julia.git#branch=release-1.13
        c12e8515.patch
        julia-hardcoded-libs.patch
        system-llvm.patch
        system-zstd.patch)
backup=(etc/julia/startup.jl)
sha256sums=('SKIP'
            '2cc294b63e601d50341979fb936826bdba59de2165a5929eae927e152652f367'
            '120c3b77a1aecfdb045ac64902164210ea8dd139d2fb8e8b098155b344a8e1fb'
            '263e3d23109c8f8170dfc1418a6c31e0c86c089ba622a46ce861cd874e6dca8e'
            '3dfa4890ad82d6c30d7f9db1dcef6f8f5c5cdf147ec622f102f555b714d57978')
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

# Revert test that depends on patched gmp
  patch -Rp1 -i ../c12e8515.patch
# Don't hardcode library names
  patch -p1 -i ../julia-hardcoded-libs.patch
# https://github.com/JuliaLang/julia/issues/63102
  patch -p1 -i ../system-llvm.patch
# https://github.com/JuliaLang/julia/issues/63100
  patch -p1 -i ../system-zstd.patch
}

_make() {
# Follow https://github.com/JuliaCI/julia-buildbot/blob/master/master/inventory.py for JULIA_CPU_TARGET
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
    USE_SYSTEM_DSFMT=1
    USE_SYSTEM_LIBUV=0
    USE_SYSTEM_UTF8PROC=1
    USE_SYSTEM_LIBGIT2=1
    USE_SYSTEM_LIBSSH2=1
    USE_SYSTEM_OPENSSL=1
    USE_SYSTEM_NGHTTP2=1
    USE_SYSTEM_CURL=1
    USE_SYSTEM_PATCHELF=1
    USE_SYSTEM_ZLIB=1
    USE_SYSTEM_ZSTD=1
    USE_SYSTEM_P7ZIP=1
    USE_SYSTEM_OPENLIBM=1
    USE_BLAS64=1
    LIBBLAS=-lblas64
    LIBBLASNAME=libblas64
    LIBLAPACK=-llapack64
    LIBLAPACKNAME=liblapack64
    VERBOSE=1
    JLDFLAGS="$LDFLAGS -lLLVM-20jl"
    LLVM_CONFIG=/usr/lib/llvm-julia/bin/llvm-config
  )

  [[ ${CARCH} == 'aarch64' ]] && make_options+=(MARCH=armv8.2-a JULIA_CPU_TARGET="generic;armv8.2-a,crypto,fullfp16,lse,rdm")
  [[ ${CARCH} == 'x86_64' ]] &&  make_options+=(MARCH=x86-64 JULIA_CPU_TARGET="generic;sandybridge,-xsaveopt,clone_all;haswell,-rdrnd,base(1)")

  make "${make_options[@]}" "$@"
}

build() {
  cd $_pkgbase
  PATH="/usr/lib/llvm-julia/bin/:$PATH" \
  _make release
}

check() {
  cd $_pkgbase/test
  ln -s /etc/ssl/cert.pem ../usr/share/julia

  ../julia --check-bounds=yes --startup-file=no ./runtests.jl \
    --skip cmdlineargs \
    --skip errorshow \
    --skip Downloads \
    --skip Sockets \
    --skip Profile \
    --skip channels \
    --skip nghttp2_jll \
    --skip GMP_jll \
    --skip LibCURL \
    --skip LibSSH2_jll \
    --skip OpenSSL_jll \
    --skip MPFR_jll \
    --skip OpenBLAS_jll \
    --skip SuiteSparse_jll \
    --skip PCRE2_jll \
    --skip LibGit2_jll \
    --skip Zlib_jll \
    --skip Zstd_jll \
    --skip precompile # https://github.com/JuliaLang/julia/issues/59887
  find ../stdlib \( -name \*.cov -o -name \*.mem \) -delete
  rm -fr ../stdlib/Artifacts/test/artifacts
}

package() {
  cd $_pkgbase
  _make DESTDIR="$pkgdir" install
# Prevent compiled modules from being stripped, as it changes their checksum so Julia refuses to load them
  chmod -w "$pkgdir"/usr/share/julia/compiled/*/*/*.so

  ln -sf /etc/ssl/cert.pem "$pkgdir"/usr/share/julia # Needed by some packages

  rm "$pkgdir"/usr/lib/julia/libccalltest.so.debug # Remove debug testing library
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname

  install -Dm644 contrib/julia.svg -t "$pkgdir"/usr/share/pixmaps
}
