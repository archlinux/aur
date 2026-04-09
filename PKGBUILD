pkgname=jasp-desktop
pkgver=0.96.0.38.gb498d5368
pkgrel=2
pkgdesc="JASP Desktop (development branch)"
arch=('x86_64')
url="https://github.com/jasp-stats/jasp-desktop"
license=('GPL3')

depends=(
  'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-positioning' 'qt6-webchannel' 'qt6-webengine' 'boost-libs'
  'r' 'librdata-git' 'jags' 'glpk' 'jsoncpp' 'libarchive' 'openssl' 'curl' 'sqlite' 'zlib' 'libfreexl' 'readstat'
)

makedepends=(
  'git' 'cmake' 'ninja' 'gcc' 'gcc-fortran' 'make' 'pkgconf' 'patchelf' 'autoconf' 'automake'
  'libtool' 'bison' 'flex' 'gettext' 'blas' 'lapack' 'ccache'
)

optdepends=('v8: for jaspProcess support')

source=(
  "git+https://github.com/jasp-stats/jasp-desktop.git#branch=development"
  "org.jaspstats.JASP.desktop"
)

sha256sums=('SKIP'
            '6415669f39de6484ce9a6a368caf69bb1db13b2e0e0388a15243bb09484f0d37')

_jasp_prefix="/opt/jasp-desktop"

pkgver() {
  cd "${srcdir}/jasp-desktop"
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/./g'
  else
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

check_env() {
  if [[ -z "${GITHUB_PAT:-}" ]]; then
    echo "==> ERROR: GITHUB_PAT is not set."
    echo "==> ERROR: Please export GITHUB_PAT=your_github_pat before running makepkg."
    echo "Aborting due to missing required environment variable."
    exit 1
  fi

  : "${GITHUB_PAT_DEF:=DUMMY}"
  export GITHUB_PAT_DEF
}

prepare() {
  check_env

  cd "${srcdir}/jasp-desktop"

  git submodule sync --recursive
  git submodule update --init --recursive --jobs "$(nproc)"

  # allows detection of host boost-libs
  sed -i 's/COMPONENTS system/COMPONENTS/' Tools/CMake/Libraries.cmake
}

build() {
  # Set compiler launcher to use ccache
  export CMAKE_C_COMPILER_LAUNCHER=ccache
  export CMAKE_CXX_COMPILER_LAUNCHER=ccache
  export CMAKE_Fortran_COMPILER_LAUNCHER=ccache

  # Set compiler flags
  export CFLAGS="${CFLAGS} -fPIC"
  export CXXFLAGS="${CXXFLAGS} -fPIC"
  export FCFLAGS="${FCFLAGS} -fPIC"
  export FFLAGS="${FFLAGS} -fPIC"

  # Navigate to the source directory
  cd "${srcdir}/jasp-desktop" || return

  # Clean previous build directory
  rm -rf "${srcdir}/build"

  # Run CMake to configure the build
  cmake -S . -B "${srcdir}/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${_jasp_prefix}" \
    -DLINUX_LOCAL_BUILD=ON \
    -Wno-dev

  # Build the project using Ninja
  ninja -C "${srcdir}/build"

  # Create necessary directories for the build
  mkdir -p "${srcdir}/build/Modules"/{binary_pkgs,manifests,module_libs,Tools}

  # Run additional build scripts
  cd "${srcdir}/jasp-desktop/Tools" || return
  Rscript buildAllDefaultJaspModules.R
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" ninja -C build install

  install -d "${pkgdir}${_jasp_prefix}/Modules"
  if [[ -d "${srcdir}/jasp-desktop/Tools/ModuleBundleBuildDir/Modules" ]]; then
    cp -a "${srcdir}/jasp-desktop/Tools/ModuleBundleBuildDir/Modules/"* \
      "${pkgdir}${_jasp_prefix}/Modules/" 2>/dev/null || true
  fi

  install -d "${pkgdir}${_jasp_prefix}/R/library"
  if [[ -d "${srcdir}/build/R/library" ]]; then
    shopt -s nullglob
    local modules=( "${srcdir}/build/R/library/"* )
    shopt -u nullglob
    if (( ${#modules[@]} )); then
      cp -a "${modules[@]}" "${pkgdir}${_jasp_prefix}/R/library/"
    fi
  fi

  if [[ -d "${pkgdir}${_jasp_prefix}/share/icons/hicolor" ]]; then
    install -d "${pkgdir}/usr/share/icons/hicolor"
    cp -a "${pkgdir}${_jasp_prefix}/share/icons/hicolor/"* \
      "${pkgdir}/usr/share/icons/hicolor/"
  fi

  install -Dm644 "${srcdir}/org.jaspstats.JASP.desktop" \
    "${pkgdir}/usr/share/applications/org.jaspstats.JASP.desktop"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${srcdir}/jasp-desktop"
  find . -name 'LICENSE*' -type f -exec install -m644 '{}' \
    "${pkgdir}/usr/share/licenses/${pkgname}/" \;
}
