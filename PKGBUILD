# Maintainer:
# Contributor: Grey Christoforo <first name at last name dot net>

: ${_cuda_gcc_version:=$(LC_ALL=C pacman -Si cuda | grep -Pom1 '^Depends On\s*:.*\bgcc\K[0-9]+\b')}

: ${_branch=master}
: ${_commit=}

_pkgname="sunshine"
pkgname="$_pkgname-git"
pkgver=2025.1014.193231.r0.g179c01a
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight"
url="https://github.com/LizardByte/Sunshine"
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
  "gcc${_cuda_gcc_version:-}"
  'boost'
  'cmake'
  'git'
  'ninja'
  'npm'
)
optdepends=(
  'cuda: Nvidia GPU encoding support'
  'intel-media-driver: Intel GPU encoding support'
  'libva-mesa-driver: AMD GPU encoding support'
  'nvidia-utils: Nvidia GPU encoding support'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}${_commit:-${_branch:+#branch=$_branch}}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  git rm -r 'packaging/linux/flatpak/deps/flatpak-builder-tools'
  git rm -r 'packaging/linux/flatpak/deps/shared-modules'
  git rm -r 'third-party/doxyconfig'
  git rm -r 'third-party/nv-codec-headers'

  git submodule update --init --depth 1
  git -C third-party/moonlight-common-c submodule update --init --depth 1

  ## disable unwanted macros
  sed 's&macro(find_package)&macro(_disable_find_package)&' -i cmake/macros/common.cmake

  ## allow boost 1.88
  sed -E 's&(Boost CONFIG) \S+ EXACT\b&\1&' -i cmake/dependencies/Boost_Sunshine.cmake
}

build() {
  export BRANCH="master"
  export BUILD_VERSION="${pkgver}"
  export COMMIT="$(git -C Sunshine rev-parse HEAD)"

  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

  export CC="gcc${_cuda_gcc_version:+-$_cuda_gcc_version}"
  export CXX="g++${_cuda_gcc_version:+-$_cuda_gcc_version}"

  export CUDA_PATH=/opt/cuda
  export NVCC_CCBIN="/usr/bin/g++${_cuda_gcc_version:+-$_cuda_gcc_version}"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_DOCS=OFF
    -DBUILD_TESTS=$CHECKFUNC
    -Wno-dev

    -DSUNSHINE_ASSETS_DIR="share/$_pkgname"
    -DSUNSHINE_EXECUTABLE_PATH="/usr/bin/$_pkgname"

    -DSUNSHINE_PUBLISHER_NAME="AUR"
    -DSUNSHINE_PUBLISHER_WEBSITE="https://aur.archlinux.org/packages/$pkgname"
    -DSUNSHINE_PUBLISHER_ISSUE_URL="https://aur.archlinux.org/packages/$pkgname"

    -DSUNSHINE_ENABLE_CUDA=ON
    -DSUNSHINE_ENABLE_DRM=ON
    -DSUNSHINE_ENABLE_TRAY=ON
    -DSUNSHINE_ENABLE_VAAPI=ON
    -DSUNSHINE_ENABLE_WAYLAND=ON
    -DSUNSHINE_ENABLE_X11=ON
    -DCUDA_FAIL_ON_MISSING=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  cd "build/tests"
  ./test_sunshine || :
}

package() {
  depends+=(
    'avahi'
    'libx11'
    'libxcb'
    'libxfixes'
    'libxrandr'
    'mesa' # libgbm
  )

  DESTDIR="$pkgdir" cmake --install build
}
