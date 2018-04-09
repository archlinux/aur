# Maintainer: Israel Herraiz <isra@herraiz.org

pkgbase=julia-mkl
pkgname=('julia-mkl' 'julia-mkl-docs')
pkgver=0.6.2
pkgrel=1
arch=('x86_64')
pkgdesc='High-level, high-performance, dynamic programming language (compiled with the Intel MKL library)'
url='http://julialang.org/'
license=('MIT')
makedepends=('python2' 'libuv' 'libunwind' 'mpfr' 'zlib' 'suitesparse-mkl' 'patchelf' 'cmake' 'pcre2' 'openssl' 'intel-mkl' 'intel-compiler-base' 'intel-fortran-compiler' 'libgit2' 'git')
options=('!emptydirs' 'staticlibs')
source=("https://github.com/JuliaLang/julia/releases/download/v$pkgver/julia-$pkgver.tar.gz" julia-libunwind-version.patch)
sha256sums=('19d15b07a7609e163420a13f4f9ca885cf61adcd1d970a8d9273919e2c9b74eb'
            '16009ce454f58463464027cbaf6186ccfab84c37660a52fb1ec3a0f514df64f9')

conflicts=('julia-git' 'julia')

prepare() {
  # For /etc/ld.so.conf.d/
  echo '/usr/lib/julia' > julia.conf

  cd julia-$pkgver
  patch -p1 -i ../julia-libunwind-version.patch
}

build() {

  source /opt/intel/composerxe/linux/bin/compilervars.sh intel64
  source /opt/intel/composerxe/linux/bin/iccvars.sh intel64
  source /opt/intel/composerxe/linux/bin/ifortvars.sh intel64
  source /opt/intel/mkl/bin/mklvars.sh intel64
  
  make -C julia-$pkgver prefix=/usr sysconfdir=/etc \
    USEICC=0 \
    USEIFC=0 \
    USE_INTEL_MKL=1 \
    USE_INTEL_MKL_FFT=1 \
    USE_INTEL_LIBM=1 \
    USE_SYSTEM_CURL=1 \
    USE_SYSTEM_LIBUNWIND=1 \
    USE_SYSTEM_PCRE=1 \
    USE_SYSTEM_LIBGIT2=1 \
    USE_SYSTEM_PATCHELF=1 \
    USE_SYSTEM_SUITESPARSE=1 \
    USE_SYSTEM_LLVM=0
}

package_julia-mkl() {
  backup=('etc/ld.so.conf.d/julia.conf' 'etc/julia/juliarc.jl')
  depends=('libunwind' 'mpfr' 'zlib' 'suitesparse-mkl' 'pcre2' 'libgit2' 'openssl' 'patchelf' 'intel-mkl')
  optdepends=('gnuplot: If using the Gaston Package from julia')
  install='sysfix.install'

  source /opt/intel/composerxe/linux/bin/compilervars.sh intel64
  source /opt/intel/composerxe/linux/bin/iccvars.sh intel64
  source /opt/intel/composerxe/linux/bin/ifortvars.sh intel64
  source /opt/intel/mkl/bin/mklvars.sh intel64
  
  make -C julia-$pkgver DESTDIR="$pkgdir" \
    prefix=/usr sysconfdir=/etc \
    USEICC=0 \
    USEIFC=0 \
    USE_INTEL_MKL=1 \
    USE_INTEL_MKL_FFT=1 \
    USE_INTEL_LIBM=1 \
    USE_SYSTEM_CURL=1 \
    USE_SYSTEM_LIBUNWIND=1\
    USE_SYSTEM_PCRE=1 \
    USE_SYSTEM_LIBGIT2=1 \
    USE_SYSTEM_PATCHELF=1 \
    USE_SYSTEM_SUITESPARSE=1 \
    USE_SYSTEM_LLVM=0 \
    install

  # Remove duplicate man-page from julia/doc
  rm -rvf "$pkgdir/usr/share/julia/doc/man"

  # For /etc/ld.so.conf.d, FS#41731
  install -Dm644 julia.conf "$pkgdir/etc/ld.so.conf.d/julia.conf"

  # Documentation and examples are in the julia-docs package
  rm -rvf "$pkgdir/usr/share/doc/"
  rm -rvf "$pkgdir/usr/share/julia/doc/"
  rm -rvf "$pkgdir/usr/share/julia/examples/"

  cd julia-$pkgver
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

package_julia-mkl-docs() {
  pkgdesc='Documentation and examples for Julia (package corresponding to the MKL version)'
  cd "julia-$pkgver"

  install -d "$pkgdir/usr/share/doc"
  cp -rv doc "$pkgdir/usr/share/doc/julia"
  cp -rv examples "$pkgdir/usr/share/doc/julia/examples"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

# getver: julialang.org/downloads
# vim:set ts=2 sw=2 et:
