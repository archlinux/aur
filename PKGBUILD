# Maintainer: Margot Prego <mopigames@proton.me>

: "${_run_unit_tests:=false}"
: "${_use_cuda:=detect}"

pkgname=helios
pkgver=0.6.1
pkgrel=1
pkgdesc='Game stream host for Selene and Moonlight OS'
arch=('x86_64' 'aarch64')
url='https://github.com/moonlight-os/helios'
license=('GPL-3.0-only')
install=helios.install

depends=(
  'avahi' 'boost-libs' 'curl' 'gcc-libs' 'libayatana-appindicator' 'libcap'
  'libdrm' 'libevdev' 'libmfx' 'libnotify' 'libpulse' 'libva' 'libx11'
  'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'miniupnpc' 'msquic' 'numactl'
  'open-iscsi' 'openssl' 'opus' 'systemd-libs' 'udev' 'usbip' 'wayland' 'which'
)
makedepends=(
  'appstream' 'appstream-glib' 'boost' 'cmake' 'desktop-file-utils' 'git'
  'ninja' 'nlohmann-json' 'nodejs' 'npm'
)
checkdepends=('xorg-server-xvfb')
optdepends=(
  'cuda: Nvidia GPU encoding support'
  'libva-mesa-driver: AMD GPU encoding support'
  'sway: Isolated virtual displays on Linux hosts without an existing Sway session'
)
provides=('helios')
conflicts=('helios-bin' 'helios-git')

_commit='4e1139eb0ca2c5768fbff5dbde2a036bf88b0796'
source=(
  "helios::git+$url.git#commit=${_commit}"
  'simple-web-server::git+https://github.com/ClassicOldSong/Simple-Web-Server.git'
  'enet::git+https://github.com/cgutman/enet.git'
  'googletest::git+https://github.com/google/googletest.git'
  'inputtino::git+https://github.com/games-on-whales/inputtino.git'
  'libdisplaydevice::git+https://github.com/LizardByte/libdisplaydevice.git'
  'lunaris::git+https://github.com/moonlight-os/lunaris.git'
  'nanors::git+https://github.com/sleepybishop/nanors.git'
  'nv-codec-headers::git+https://github.com/FFmpeg/nv-codec-headers.git'
  'tray::git+https://github.com/LizardByte/tray.git'
  'wayland-protocols::git+https://gitlab.freedesktop.org/wayland/wayland-protocols.git'
  'wlr-protocols::git+https://gitlab.freedesktop.org/wlroots/wlr-protocols.git'
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            'SKIP' 'SKIP' 'SKIP' 'SKIP')
source_x86_64=('ffmpeg-bundle::https://github.com/LizardByte/build-deps/releases/download/v2026.516.30821/Linux-x86_64-ffmpeg.tar.gz')
sha256sums_x86_64=('c32319fcc2867befe8ff3ae26b4d3a58378c3a9c1bfef9029c9969321c3bc6ec')
source_aarch64=('ffmpeg-bundle::https://github.com/LizardByte/build-deps/releases/download/v2026.516.30821/Linux-aarch64-ffmpeg.tar.gz')
sha256sums_aarch64=('10b6c9440ba6178ec3b944f6c6f697253497cad5196d23a2d32d335daae0062e')

if [[ "${_use_cuda::1}" == 'd' ]] && pacman -Qi cuda &>/dev/null; then
  _use_cuda=true
fi

prepare() {
  cd helios
  git submodule init
  git config submodule.third-party/Simple-Web-Server.url "$srcdir/simple-web-server"
  git config submodule.third-party/googletest.url "$srcdir/googletest"
  git config submodule.third-party/inputtino.url "$srcdir/inputtino"
  git config submodule.third-party/libdisplaydevice.url "$srcdir/libdisplaydevice"
  git config submodule.third-party/moonlight-common-c.url "$srcdir/lunaris"
  git config submodule.third-party/nanors.url "$srcdir/nanors"
  git config submodule.third-party/nv-codec-headers.url "$srcdir/nv-codec-headers"
  git config submodule.third-party/tray.url "$srcdir/tray"
  git config submodule.third-party/wayland-protocols.url "$srcdir/wayland-protocols"
  git config submodule.third-party/wlr-protocols.url "$srcdir/wlr-protocols"
  git -c protocol.file.allow=always submodule update \
    third-party/Simple-Web-Server \
    third-party/googletest third-party/inputtino third-party/libdisplaydevice \
    third-party/moonlight-common-c third-party/nanors \
    third-party/nv-codec-headers third-party/tray \
    third-party/wayland-protocols third-party/wlr-protocols

  git -C third-party/moonlight-common-c submodule init
  git -C third-party/moonlight-common-c config submodule.enet.url "$srcdir/enet"
  git -C third-party/moonlight-common-c config submodule.nanors.url "$srcdir/nanors"
  git -C third-party/moonlight-common-c -c protocol.file.allow=always \
    submodule update enet nanors

  # Arch updates Boost faster than Helios's conservative exact pin. Accept the
  # packaged version instead of downloading another Boost during makepkg.
  sed -i 's/find_package(Boost CONFIG ${BOOST_VERSION} EXACT COMPONENTS ${BOOST_COMPONENTS})/find_package(Boost CONFIG ${BOOST_VERSION} COMPONENTS ${BOOST_COMPONENTS})/' \
    cmake/dependencies/Boost_Helios.cmake
  sed -i '/^[[:space:]]*system$/d' cmake/dependencies/Boost_Helios.cmake
  sed -i \
    -e 's/find_package(Boost 1.53.0 COMPONENTS system REQUIRED)/find_package(Boost 1.53.0 REQUIRED)/' \
    -e 's/Boost::boost Boost::system/Boost::boost/' \
    third-party/Simple-Web-Server/CMakeLists.txt
}

build() {
  export BRANCH=main
  export BUILD_VERSION="$pkgver"
  export COMMIT="$_commit"
  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

  local cmake_options=(
    -S helios -B build -G Ninja -Wno-dev
    -D BOOST_USE_STATIC=OFF
    -D BUILD_DOCS=OFF
    -D BUILD_TESTS="$_run_unit_tests"
    -D BUILD_WERROR=ON
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CUDA_FAIL_ON_MISSING=OFF
    -D ENABLE_MLOS_QUIC=ON
    -D FFMPEG_PREPARED_BINARIES="$srcdir/ffmpeg"
    -D SUNSHINE_ASSETS_DIR=share/helios
    -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/helios
    -D SUNSHINE_PUBLISHER_ISSUE_URL=https://github.com/moonlight-os/helios/issues
    -D SUNSHINE_PUBLISHER_NAME=AUR
    -D SUNSHINE_PUBLISHER_WEBSITE=https://aur.archlinux.org/packages/helios
  )

  if [[ "${_use_cuda::1}" != 't' ]]; then
    cmake_options+=(-D SUNSHINE_ENABLE_CUDA=OFF)
  fi

  cmake "${cmake_options[@]}"
  appstreamcli validate --no-net build/dev.mopigames.Helios.metainfo.xml
  appstream-util validate build/dev.mopigames.Helios.metainfo.xml
  desktop-file-validate build/dev.mopigames.Helios.desktop
  desktop-file-validate build/dev.mopigames.Helios.terminal.desktop
  cmake --build build
}

check() {
  build/helios --version
  if [[ "${_run_unit_tests::1}" == 't' ]]; then
    xvfb-run -a build/tests/test_helios --gtest_color=yes
  fi
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
