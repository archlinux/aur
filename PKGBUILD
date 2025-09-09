# Maintainer:

## options
: ${_use_sodeps:=false}

: ${_use_cuda:=false} # nvenc
: ${_cuda_gcc_version:=$(LC_ALL=C pacman -Si cuda | grep -Pom1 '^Depends On\s*:.*\bgcc\K[0-9]+\b')}

_pkgname="apollo"
pkgname="$_pkgname"
pkgver=0.4.6
pkgrel=1
pkgdesc="A self-hosted GameStream server"
url="https://github.com/ClassicOldSong/Apollo"
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'gtk3'
  'icu'
  'libayatana-appindicator'
  'libcap'
  'libdrm'
  'libevdev'
  'libnotify'
  'libpulse'
  'libva'
  'miniupnpc'
  'numactl'
  'openssl'
  'opus'
  'wayland'
)
makedepends=(
  "gcc${_cuda_gcc_version:?}"
  'boost'
  'cmake'
  'git'
  'ninja'
  'npm'
)
optdepends=(
  'intel-media-driver: Intel GPU encoding support'
  'libva-mesa-driver: AMD GPU encoding support'
)

if pacman -Qi cuda &> /dev/null; then
  _use_cuda=true
fi

if [[ "${_use_cuda::1}" == "t" ]]; then
  makedepends+=('cuda')
  checkdepends+=('nvidia-utils')
  optdepends+=(
    'cuda: Nvidia GPU encoding support'
    'nvidia-utils: Nvidia GPU encoding support'
  )
fi

install="$_pkgname.install"

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('c5f52391cfff5f76dadfcf692406120c2ea098d3835b99652fe478d79ccbe722')

prepare() {
  cd "$_pkgsrc"

  local i _unwanted=(
    third-party/nv-codec-headers
    packaging/linux/flatpak/deps/shared-modules
    packaging/linux/flatpak/deps/flatpak-builder-tools
    third-party/doxyconfig
  )

  for i in "${_unwanted[@]}"; do
    if [ -e "$i" ]; then
      git rm -r "$i"
    fi
  done

  git submodule update --init --recursive --depth 1

  ## disable unwanted macros
  sed 's&macro(find_package)&macro(_disable_find_package)&' -i cmake/macros/common.cmake

  ## allow any version of boost
  sed -E 's&(Boost CONFIG) \S+ EXACT\b&\1&' -i cmake/dependencies/Boost_Sunshine.cmake
}

build() (
  export BRANCH="master"
  export BUILD_VERSION="${pkgver}"
  export COMMIT="$(git -C "$_pkgsrc" rev-parse HEAD)"

  export CC="gcc-$_cuda_gcc_version"
  export CXX="g++-$_cuda_gcc_version"

  export CUDA_PATH=/opt/cuda
  export NVCC_CCBIN="/usr/bin/g++-$_cuda_gcc_version"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DSUNSHINE_ASSETS_DIR="share/$_pkgname"
    -DSUNSHINE_EXECUTABLE_PATH="/usr/bin/$_pkgname"
    -DSUNSHINE_ENABLE_CUDA=ON
    -DSUNSHINE_ENABLE_DRM=ON
    -DSUNSHINE_ENABLE_TRAY=ON
    -DSUNSHINE_ENABLE_VAAPI=ON
    -DSUNSHINE_ENABLE_WAYLAND=ON
    -DSUNSHINE_ENABLE_X11=ON
    -DBUILD_DOCS=OFF
    -DBUILD_TESTS=OFF
    -Wno-dev
  )

  if [[ "${_use_cuda::1}" == "t" ]]; then
    _cmake_options+=(-DCUDA_FAIL_ON_MISSING=ON)
  else
    _cmake_options+=(-DCUDA_FAIL_ON_MISSING=OFF)
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
)

package() {
  depends+=(
    'avahi'
    'libx11'
    'libxcb'
    'libxfixes'
    'libxrandr'
    'mesa' # libgbm
  )

  if [[ "$_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      'libicuuc.so'     # icu
      'libminiupnpc.so' # miniupnpc
    )"
  fi

  DESTDIR="$pkgdir" cmake --install build
}
