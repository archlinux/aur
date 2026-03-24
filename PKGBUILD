pkgname=jasp-desktop
pkgver=0.96.0.16.g9116257a9
pkgrel=1
pkgdesc="JASP Desktop (development branch) with private Boost 1.88 and librdata under /opt/jasp-desktop"
arch=('x86_64')
url="https://github.com/jasp-stats/jasp-desktop"
license=('GPL3')

depends=(
  'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-positioning' 'qt6-webchannel' 'qt6-webengine'
  'r' 'glpk' 'jsoncpp' 'libarchive' 'openssl' 'curl' 'sqlite' 'zlib' 'libfreexl' 'readstat'
)
makedepends=(
  'git' 'cmake' 'ninja' 'gcc' 'gcc-fortran' 'make' 'pkgconf' 'patchelf' 'autoconf' 'automake'
  'libtool' 'bison' 'flex' 'gettext' 'blas' 'lapack'
  'ccache'
)

source=(
  "git+https://github.com/jasp-stats/jasp-desktop.git#branch=development"
  "https://archives.boost.io/release/1.88.0/source/boost_1_88_0.tar.bz2"
  "git+https://github.com/WizardMac/librdata.git"
  "org.jaspstats.JASP.desktop"
)
sha256sums=(
  'SKIP'
  '46d9d2c06637b219270877c9e16155cbd015b6dc84349af064c088e9b5b12f7b'
  'SKIP'
  'SKIP'
)

_boostsrc="boost_1_88_0"
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
    echo "==> ERROR: Please export GITHUB_PAT=\"REAL\" before running makepkg."
    echo "Aborting due to missing required environment variable."
    exit 1
  fi

  : "${GITHUB_PAT_DEV:=DUMMY}"
  export GITHUB_PAT_DEV
}

prepare() {
  check_env

  cd "${srcdir}/jasp-desktop"
  git submodule sync --recursive
  git submodule update --init --recursive --jobs "$(nproc)"

  cd "${srcdir}/${_boostsrc}"
  ./bootstrap.sh \
    --prefix="${srcdir}/boost-staging" \
    --with-libraries=system,filesystem,thread,date_time,regex,program_options,container,container_hash \
    --with-toolset=gcc

  cd "${srcdir}/librdata"
  export ACLOCAL_PATH="/usr/share/gettext/m4:/usr/share/aclocal"
  ./autogen.sh
}

build() {
  export CC="ccache gcc"
  export CXX="ccache g++"
  export FC="ccache gfortran"
  export F77="ccache gfortran"
  export CMAKE_C_COMPILER_LAUNCHER=ccache
  export CMAKE_CXX_COMPILER_LAUNCHER=ccache
  export CMAKE_Fortran_COMPILER_LAUNCHER=ccache

  cd "${srcdir}/${_boostsrc}"
  rm -rf "${srcdir}/build-boost"
  ./b2 \
    --prefix="${srcdir}/boost-staging" \
    --build-dir="${srcdir}/build-boost" \
    -j"$(nproc)" \
    cxxflags="-fPIC" \
    install

  cd "${srcdir}/librdata"
  ./configure --prefix="${srcdir}/librdata-staging"
  make -j"$(nproc)"

  export BOOST_ROOT="${srcdir}/boost-staging"
  export Boost_ROOT="${srcdir}/boost-staging"
  export BOOST_INCLUDEDIR="${srcdir}/boost-staging/include"
  export BOOST_LIBRARYDIR="${srcdir}/boost-staging/lib"

  export CMAKE_PREFIX_PATH="${srcdir}/boost-staging"
  export PKG_CONFIG_PATH="${srcdir}/boost-staging/lib/pkgconfig"

  export LIBRARY_PATH="${srcdir}/boost-staging/lib:${LIBRARY_PATH}"
  export LD_LIBRARY_PATH="${srcdir}/boost-staging/lib:${LD_LIBRARY_PATH}"

  cd "${srcdir}/jasp-desktop"
  rm -rf "${srcdir}/build"
  cmake -S . -B "${srcdir}/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${_jasp_prefix}" \
    -DCMAKE_PREFIX_PATH="${srcdir}/boost-staging" \
    -DBoost_ROOT="${srcdir}/boost-staging" \
    -DBOOST_ROOT="${srcdir}/boost-staging" \
    -DBoost_NO_SYSTEM_PATHS=ON \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DBoost_ADDITIONAL_VERSIONS="1.88.0;1.88" \
    -DLINUX_LOCAL_BUILD=ON \
    -DCMAKE_C_COMPILER_LAUNCHER=ccache \
    -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
    -DCMAKE_Fortran_COMPILER_LAUNCHER=ccache \
    -Wno-dev

  ninja -C "${srcdir}/build"

  # SIMPLest FIX: CMake only needs this directory to exist
  mkdir -p "${srcdir}/build/Modules"/{binary_pkgs,manifests,module_libs,Tools}

  cd "${srcdir}/jasp-desktop/Tools"
  Rscript buildAllDefaultJaspModules.R
}

package() {
  cd "${srcdir}/${_boostsrc}"
  ./b2 \
    --prefix="${pkgdir}${_jasp_prefix}" \
    --build-dir="${srcdir}/build-boost" \
    --layout=system \
    install

  cd "${srcdir}/librdata"
  make DESTDIR="${pkgdir}" install

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
