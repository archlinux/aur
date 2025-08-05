# Maintainer: Grey Christoforo <first name at last name dot net>

: ${_cuda_gcc_version:=$(LC_ALL=C pacman -Si cuda | grep -Pom1 '^Depends On\s*:.*\bgcc\K[0-9]+\b')}

pkgname=sunshine-git
pkgver=2025.805.150726.r0.g03bb53d
pkgrel=1
pkgdesc="A self-hosted GameStream host for Moonlight"
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
  "gcc${_cuda_gcc_version:?}"
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

provides=(sunshine)
conflicts=(sunshine)

install=sunshine-git.install

source=(
  git+https://github.com/LizardByte/Sunshine.git#branch=master
  git+https://github.com/moonlight-stream/moonlight-common-c.git
  git+https://gitlab.com/eidheim/Simple-Web-Server.git
  git+https://github.com/LizardByte/Virtual-Gamepad-Emulation-Client.git
  git+https://github.com/miniupnp/miniupnp.git
  git+https://github.com/michaeltyson/TPCircularBuffer.git
  git+https://github.com/LizardByte/build-deps.git
  git+https://github.com/sleepybishop/nanors.git
  git+https://github.com/cgutman/enet.git
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd Sunshine
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
      || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd Sunshine

  local i _unwanted=(
    packaging/linux/flatpak/deps/flatpak-builder-tools
    packaging/linux/flatpak/deps/shared-modules
    third-party/doxyconfig
    third-party/nv-codec-headers
  )

  for i in "${_unwanted[@]}"; do
    if [ -e "$i" ]; then
      git rm -r "$i"
    fi
  done

  git submodule init
  git config submodule.third-party/moonlight-common-c.url "${srcdir}/moonlight-common-c"
  git config submodule.third-party/Simple-Web-Server.url "${srcdir}/Simple-Web-Server"
  git config submodule.third-party/ViGEmClient.url "${srcdir}/Virtual-Gamepad-Emulation-Client"
  git config submodule.third-party/miniupnp.url "${srcdir}/miniupnp"
  git config submodule.third-party/TPCircularBuffer.url "${srcdir}/TPCircularBuffer"
  git config submodule.third-party/ffmpeg-linux-x86_64.url "${srcdir}/build-deps"
  git config submodule.third-party/nanors.url "${srcdir}/nanors"
  git -c protocol.file.allow=always submodule update --depth 1

  pushd third-party/moonlight-common-c
  git submodule init
  git config submodule.enet.url "${srcdir}/enet"
  git -c protocol.file.allow=always submodule update --depth 1
  popd

  # OK if this patch fails, probably means it's been upstreamed
  for patch in "${source[@]}"; do
    if [[ "$patch" == *.patch ]]; then
      patch -Np1 -i "$srcdir"/"$patch" || true
    fi
  done

  ## disable unwanted macros
  sed 's&macro(find_package)&macro(_disable_find_package)&' -i cmake/macros/common.cmake

  ## fix for miniupnpc 2.3.3
  sed '1i #include <cstddef>' -i src/upnp.cpp

  ## fix for boost 1.88
  sed -E 's&(Boost CONFIG) \S+ EXACT\b&\1&' -i cmake/dependencies/Boost_Sunshine.cmake

  sed -E 's&<boost/process.hpp>&"'"${srcdir}"'/boost_process_v1.hpp"&' \
    -i src/platform/common.h

  sed -E 's&(namespace bp = boost::process);&\1::v1;&' \
    -i src/platform/linux/misc.cpp

  sed -E 's&<boost/process/v1.hpp>&"'"${srcdir}"'/boost_process_v1.hpp"&' \
    -i src/platform/linux/misc.cpp \
    src/process.h

  install -Dm644 /dev/stdin "$srcdir/boost_process_v1.hpp" << END
#ifndef BOOST_PROCESS_V1_HPP
#define BOOST_PROCESS_V1_HPP
#include <boost/process/v1/args.hpp>
#include <boost/process/v1/async.hpp>
#include <boost/process/v1/async_system.hpp>
#include <boost/process/v1/group.hpp>
#include <boost/process/v1/child.hpp>
#include <boost/process/v1/cmd.hpp>
#include <boost/process/v1/env.hpp>
#include <boost/process/v1/environment.hpp>
#include <boost/process/v1/error.hpp>
#include <boost/process/v1/exe.hpp>
#include <boost/process/v1/group.hpp>
#include <boost/process/v1/handles.hpp>
#include <boost/process/v1/io.hpp>
#include <boost/process/v1/pipe.hpp>
#include <boost/process/v1/shell.hpp>
#include <boost/process/v1/search_path.hpp>
#include <boost/process/v1/spawn.hpp>
#include <boost/process/v1/system.hpp>
#include <boost/process/v1/start_dir.hpp>
#endif //BOOST_PROCESS_V1_HPP
END
}

build() {
  export BRANCH="master"
  export BUILD_VERSION="${pkgver}"
  export COMMIT="$(git -C Sunshine rev-parse HEAD)"

  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

  export CC="gcc-$_cuda_gcc_version"
  export CXX="g++-$_cuda_gcc_version"

  cmake -B build_dir -S Sunshine -W no-dev -G Ninja \
    -D CMAKE_BUILD_TYPE=None \
    -D CUDA_FAIL_ON_MISSING=OFF \
    -D SUNSHINE_ENABLE_CUDA=1 \
    -D SUNSHINE_ENABLE_X11=1 \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/sunshine \
    -D SUNSHINE_ASSETS_DIR="share/sunshine" \
    -D BUILD_DOCS=0 # docs require doxygen, don't want to bother

  cmake --build build_dir
}

check() {
  cd "build_dir/tests"
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

  DESTDIR="${pkgdir}" cmake --install build_dir
}
