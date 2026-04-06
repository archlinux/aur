# Maintainer: Oskar Gerlicz Kowalczuk <oskar@gerlicz.space>
# Contributor: Mambuco <gabriele.giambrone@icloud.com>
# Contributor: Grey Christoforo <first name at last name dot net>

## options
: "${_run_unit_tests:=false}"
: "${_support_headless_testing:=false}"
: "${_use_cuda:=detect}"
: "${_commit:=}"

_pkgname='sunshine'
pkgname="${_pkgname}-git"
pkgver=2026.403.124357.r0.gba4db46
pkgrel=2
pkgdesc='A self-hosted game stream host for Moonlight'
arch=('x86_64')
url='https://github.com/LizardByte/Sunshine'
license=('GPL-3.0-only')
install="${_pkgname}.install"

# Keep this toggle so CUDA toolchain pinning can be re-enabled if upstream
# requires an older GCC again.
_gcc_version=15
_versioned_gcc=false

_gcc_dep_suffix=''
_gcc_env_suffix=''
if [[ "${_versioned_gcc}" == true ]]; then
  _gcc_dep_suffix="${_gcc_version}"
  _gcc_env_suffix="-${_gcc_version}"
fi

depends=(
  'avahi'
  'boost-libs'
  'curl'
  'gtk3'
  'icu'
  'libayatana-appindicator'
  'libcap'
  'libdrm'
  'libevdev'
  'libmfx'
  'libnotify'
  'libpipewire'
  'libpulse'
  'libva'
  'libx11'
  'libxcb'
  'libxfixes'
  'libxrandr'
  'libxtst'
  'mesa'
  'miniupnpc'
  'numactl'
  'openssl'
  'opus'
  'systemd-libs'
  'vulkan-icd-loader'
  'wayland'
  'which'
)
makedepends=(
  'appstream'
  'appstream-glib'
  'boost'
  'cmake'
  'desktop-file-utils'
  "gcc${_gcc_dep_suffix}"
  'git'
  'ninja'
  'nlohmann-json'
  'nodejs'
  'npm'
  'python-jinja'
  'python-setuptools'
  'shaderc'
)
checkdepends=(
  'gcovr'
)
optdepends=(
  'libva-mesa-driver: AMD GPU encoding support'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc::git+$url.git${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

if [[ "${_use_cuda::1}" == 'd' ]] && pacman -Qi cuda &>/dev/null; then
  _use_cuda=true
fi

if [[ "${_use_cuda::1}" == 't' ]]; then
  optdepends+=('cuda: Nvidia GPU encoding support')
fi

if [[ "${_support_headless_testing::1}" == 't' ]]; then
  optdepends+=('xorg-server-xvfb: Virtual X server for headless testing')
fi

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  git submodule update --recursive --init --depth 1

  # Upstream currently pins Boost 1.89 exactly. On Arch, that quickly falls out
  # of sync and makes CMake fetch Boost during the build. Prefer the packaged
  # Boost version instead so makepkg stays reproducible.
  sed -i 's/find_package(Boost CONFIG ${BOOST_VERSION} EXACT COMPONENTS ${BOOST_COMPONENTS})/find_package(Boost CONFIG ${BOOST_VERSION} COMPONENTS ${BOOST_COMPONENTS})/' \
    cmake/dependencies/Boost_Sunshine.cmake
}

build() {
  local _branch
  local _build_version
  local _commit_current

  _branch="$(git -C "$_pkgsrc" rev-parse --abbrev-ref HEAD)"
  _build_version="$(pkgver)"
  _commit_current="$(git -C "$_pkgsrc" rev-parse HEAD)"

  export BRANCH="$_branch"
  export BUILD_VERSION="$_build_version"
  export COMMIT="$_commit_current"

  export CC="gcc${_gcc_env_suffix}"
  export CXX="g++${_gcc_env_suffix}"

  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"
  export MAKEFLAGS="${MAKEFLAGS:--j$(nproc)}"

  local _cmake_options=(
    -S "$_pkgsrc"
    -B build
    -G Ninja
    -Wno-dev
    -D BUILD_DOCS=OFF
    -D BUILD_WERROR=ON
    -D BOOST_USE_STATIC=OFF
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D SUNSHINE_ASSETS_DIR="share/${_pkgname}"
    -D SUNSHINE_EXECUTABLE_PATH="/usr/bin/${_pkgname}"
    -D SUNSHINE_ENABLE_CUDA=ON
    -D SUNSHINE_ENABLE_DRM=ON
    -D SUNSHINE_ENABLE_PORTAL=ON
    -D SUNSHINE_ENABLE_TRAY=ON
    -D SUNSHINE_ENABLE_VAAPI=ON
    -D SUNSHINE_ENABLE_VULKAN=ON
    -D SUNSHINE_ENABLE_WAYLAND=ON
    -D SUNSHINE_ENABLE_X11=ON
    -D SUNSHINE_PUBLISHER_NAME='AUR'
    -D SUNSHINE_PUBLISHER_WEBSITE="https://aur.archlinux.org/packages/${pkgname}"
    -D SUNSHINE_PUBLISHER_ISSUE_URL="https://aur.archlinux.org/packages/${pkgname}"
  )

  if [[ "${_use_cuda::1}" != 't' ]]; then
    _cmake_options+=(
      -D CUDA_FAIL_ON_MISSING=OFF
      -D SUNSHINE_ENABLE_CUDA=OFF
    )
  elif [[ -z "${CUDA_PATH:-}" ]] && pacman -Qi cuda &>/dev/null; then
    local _cuda_gcc_version
    _cuda_gcc_version="$(LC_ALL=C pacman -Si cuda | grep -Pom1 '^Depends On\\s*:.*\\bgcc\\K[0-9]+\\b' || true)"

    export CUDA_PATH=/opt/cuda
    if [[ -n "$_cuda_gcc_version" ]]; then
      export NVCC_CCBIN="/usr/bin/g++-${_cuda_gcc_version}"
    else
      export NVCC_CCBIN='/usr/bin/g++'
    fi
  fi

  if [[ "${_run_unit_tests::1}" != 't' ]]; then
    _cmake_options+=(-D BUILD_TESTS=OFF)
  fi

  cmake "${_cmake_options[@]}"

  appstreamcli validate build/dev.lizardbyte.app.Sunshine.metainfo.xml
  appstream-util validate build/dev.lizardbyte.app.Sunshine.metainfo.xml
  desktop-file-validate build/dev.lizardbyte.app.Sunshine.desktop
  desktop-file-validate build/dev.lizardbyte.app.Sunshine.terminal.desktop

  cmake --build build
}

check() {
  if [[ "${_run_unit_tests::1}" == 't' ]]; then
    export CC="gcc${_gcc_env_suffix}"
    export CXX="g++${_gcc_env_suffix}"

    cd "${srcdir}/build/tests"
    ./test_sunshine --gtest_color=yes --gtest_output=xml:test_results.xml

    cd "${srcdir}/build"

    local gcov_path
    gcov_path="$(find /usr/lib/gcc/x86_64-pc-linux-gnu/${_gcc_version}.*/ -name gcov -type f 2>/dev/null | head -n 1)"
    if [[ -z "$gcov_path" ]]; then
      gcov_path='gcov'
    fi

    gcovr --gcov-executable "$gcov_path" . -r "../${_pkgsrc}/src" \
      --exclude-noncode-lines \
      --exclude-throw-branches \
      --exclude-unreachable-branches \
      --xml-pretty \
      -o coverage.xml

    sed -i "s|${srcdir}/${_pkgsrc}/src|src|g" coverage.xml
  fi

  cd "${srcdir}/build"
  ./sunshine --version
}

package() {
  export MAKEFLAGS="${MAKEFLAGS:--j$(nproc)}"
  DESTDIR="$pkgdir" cmake --install build
}
