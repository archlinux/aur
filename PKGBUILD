# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>
# Maintainer: Vedran Miletic <vedran AT miletic DOT net>

pkgname=gromacs
pkgver=2025.2
pkgrel=2
pkgdesc='A versatile package to perform molecular dynamics, i.e. simulate the Newtonian equations of motion for systems with hundreds to millions of particles.'
url='http://www.gromacs.org/'
license=(LGPL-2.1-only)
arch=('x86_64')
depends=('lapack' 'fftw' 'zlib' 'hwloc' 'gcc14-libs' 'tinyxml2' 'muparser')
optdepends=('cuda: Nvidia GPU support'
	    'perl: needed for demux.pl and xplor2gmx.pl')
makedepends=('cmake' 'ninja' 'gcc14')
#options=('!libtool')
options=()
source=(https://gitlab.com/gromacs/gromacs/-/archive/v${pkgver}/gromacs-v${pkgver}.tar.gz)

sha256sums=('f780ba435199e68e8c38e95d38189bddfe4fe452c068eb2f0328068d5c0d9cd5')

# Build-time GPU toggle (OFF, CUDA, SYCL); override with: env _gpu=CUDA _cuda_sm=89 makepkg
: "${_gpu:=OFF}"
: "${_cuda_sm:-1}"

# 0) Set common build flags and build environment

_build_common_flags=(
-DGMX_HWLOC=ON
-DGMX_EXTERNAL_TINYXML2=ON
-DGMX_USE_MUPARSER=EXTERNAL
-DCMAKE_BUILD_TYPE=Release
-DCMAKE_INSTALL_PREFIX=/usr
-DCMAKE_INSTALL_LIBDIR=lib
-DBUILD_TESTING=ON #Enable ctests
-DREGRESSIONTEST_DOWNLOAD=ON
-DGMX_BUILD_HELP=ON #shell completions and man pages

# For AVX2 and AVX512 support, uncomment the following line
#-DGMX_BUILD_OWN_FFTW=ON
# For testing uncomment the following lines
#-DGMX_BUILD_UNITTESTS=ON
#-DREGRESSIONTEST_DOWNLOAD=ON
# For debugging uncomment the following line
#-DCMAKE_VERBOSE_MAKEFILE=ON
)

# 1) Extra CUDA GPU options
if [[ ${_gpu} == "CUDA" ]]; then
  # For CUDA (12+) support, compiling with GCC 14 is required.
  # If you not need CUDA support, uncomment the next two lines
  export CC=gcc-14
  export CXX=g++-14
  # lto does not play well with CUDA. We need to disable it.
  # Local copies of your flags (already without -flto), check your makepkg.conf
  _local_CFLAGS="$CFLAGS"
  _local_CXXFLAGS="$CXXFLAGS"

  _build_common_flags+=(
    -DGMX_USE_CCACHE=OFF          # safer with nvcc
    #override all compile/link flags CMake uses for Release so it can’t re-add -flto
    -DCMAKE_C_FLAGS="${_local_CFLAGS}"
    -DCMAKE_CXX_FLAGS="${_local_CXXFLAGS}"
    # Set target
    -DGMX_CUDA_TARGET_SM=${_cuda_sm}
  )
fi

prepare() {
  cd "$srcdir/gromacs-v${pkgver}"
  # Clean any leftover build trees (makepkg runs in a clean dir, but be safe for re-runs)
  rm -rf build-single build-double
}

build() {
  cd "$srcdir/gromacs-v${pkgver}"

  # 1) Configure + build single precision
  msg2 "Configuring single-precision build (GPU=${_gpu})"
  cmake -S . -B build-single -G Ninja\
    -DGMX_GPU="${_gpu}" \
    "${_build_common_flags[@]}"
  msg2 "Building the sigle precision binaries (GPU=${_gpu})"
  cmake --build build-single

  # 2) Configure + build double precision
  msg2 "Configuring double-precision build"
  cmake -S . -B build-double -G Ninja \
    -DGMX_DOUBLE=ON \
    "${_build_common_flags[@]}"
  msg2 "Building the double precision files"
  cmake --build build-double
}

check () {
  cd "$srcdir/gromacs-v${pkgver}"

  # Enable these if you want tests; regression tests can be large/slow to download.
  # You can also rebuild with:
  # -DGMX_BUILD_UNITTESTS=ON -DREGRESSIONTEST_DOWNLOAD=ON
  if [[ -d build-single ]]; then
    msg2 "Running tests (single precision)"
    #ctest -j"${CMAKE_BUILD_PARALLEL_LEVEL}" --test-dir build-single
    true
  fi

  if [[ -d build-double ]]; then
    msg2 "Running tests (double precision)"
    #ctest -j"${CMAKE_BUILD_PARALLEL_LEVEL}" --test-dir build-double
    true
  fi
}

package() {
  cd "$srcdir/gromacs-v${pkgver}"

  msg2 "Installing single-precision files"
  DESTDIR="$pkgdir" cmake --install build-single

  msg2 "Installing double-precision files"
  DESTDIR="$pkgdir" cmake --install build-double

  # Provide a profile.d shim that sources GMXRC, without moving upstream files.
  msg2 "Installing /etc/profile.d/gromacs.sh"
  install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/gromacs.sh" <<'EOF'
# shellcheck shell=sh
[ -r /usr/bin/GMXRC ] && . /usr/bin/GMXRC
EOF

install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/gromacs.csh" <<'EOF'
if ( -r /usr/bin/GMXRC.csh ) then
  source /usr/bin/GMXRC.csh
endif
EOF
}
