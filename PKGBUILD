# Maintainer:

_pkgname="sunshine"
pkgname="$_pkgname"
pkgver=0.23.1
pkgrel=2
pkgdesc="A self-hosted GameStream host for Moonlight"
url="https://github.com/LizardByte/Sunshine"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')

depends=(
  'avahi'
  'boost-libs'
  'curl'
  'libayatana-appindicator'
  'libcap'
  'libdrm'
  'libevdev'
  'libmfx'
  'libnotify'
  'libpulse'
  'libva'
  'libvdpau'
  'libx11'
  'libxcb'
  'libxfixes'
  'libxrandr'
  'libxtst'
  'miniupnpc'
  'numactl'
  'openssl'
  'opus'
  'udev'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'ninja'
  'nodejs'
  'npm'
)
optdepends=(
  'cuda: Nvidia GPU encoding support'
  'libva-mesa-driver: AMD GPU encoding support'
  'intel-media-driver: Intel GPU encoding support'
  'xorg-server-xvfb: Virtual X server for headless testing'
)

install="sunshine.install"

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

_source_sunshine() {
  source+=(
    'eidheim.simple-web-server'::'git+https://gitlab.com/eidheim/Simple-Web-Server.git'
    'ffmpeg.nv-codec-headers'::'git+https://github.com/FFmpeg/nv-codec-headers.git'
    #'flathub.org.flatpak.builder.baseapp'::'git+https://github.com/flathub/org.flatpak.Builder.BaseApp.git'
    #'flathub.shared-modules'::'git+https://github.com/flathub/shared-modules.git'
    #'google.googletest'::'git+https://github.com/google/googletest.git'
    'lizardbyte.build-deps'::'git+https://github.com/LizardByte/build-deps.git'
    'lizardbyte.nvapi-open-source-sdk'::'git+https://github.com/LizardByte/nvapi-open-source-sdk.git'
    'lizardbyte.tray'::'git+https://github.com/LizardByte/tray.git'
    'lizardbyte.virtual-gamepad-emulation-client'::'git+https://github.com/LizardByte/Virtual-Gamepad-Emulation-Client.git'
    'michaeltyson.tpcircularbuffer'::'git+https://github.com/michaeltyson/TPCircularBuffer.git'
    'moonlight-stream.moonlight-common-c'::'git+https://github.com/moonlight-stream/moonlight-common-c.git'
    'sleepybishop.nanors'::'git+https://github.com/sleepybishop/nanors.git'
    'wayland.wayland-protocols'::'git+https://gitlab.freedesktop.org/wayland/wayland-protocols.git'
    'wlroots.wlr-protocols'::'git+https://gitlab.freedesktop.org/wlroots/wlr-protocols.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
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
}

_source_moonlight_common_c() {
  source+=(
    'cgutman.enet'::'git+https://github.com/cgutman/enet.git'
  )
  sha256sums+=(
    'SKIP'
  )

}

_prepare_sunshine() (
  cd "$srcdir/$_pkgsrc"
  local _submodules=(
    'eidheim.simple-web-server'::'third-party/Simple-Web-Server'
    'ffmpeg.nv-codec-headers'::'third-party/nv-codec-headers'
    #'flathub.org.flatpak.builder.baseapp'::'packaging/linux/flatpak/deps/org.flatpak.Builder.BaseApp'
    #'flathub.shared-modules'::'packaging/linux/flatpak/deps/shared-modules'
    #'google.googletest'::'third-party/googletest'
    'lizardbyte.build-deps'::'third-party/build-deps'
    'lizardbyte.nvapi-open-source-sdk'::'third-party/nvapi-open-source-sdk'
    'lizardbyte.tray'::'third-party/tray'
    'lizardbyte.virtual-gamepad-emulation-client'::'third-party/ViGEmClient'
    'michaeltyson.tpcircularbuffer'::'third-party/TPCircularBuffer'
    'moonlight-stream.moonlight-common-c'::'third-party/moonlight-common-c'
    'sleepybishop.nanors'::'third-party/nanors'
    'wayland.wayland-protocols'::'third-party/wayland-protocols'
    'wlroots.wlr-protocols'::'third-party/wlr-protocols'
  )
  _submodule_update
)

_prepare_moonlight_common_c() (
  cd "$srcdir/$_pkgsrc"
  cd 'third-party/moonlight-common-c'
  local _submodules=(
    'cgutman.enet'::'enet'
  )
  _submodule_update
)

_source_sunshine
_source_moonlight_common_c

_node_env() {
  export HOME="$SRCDEST/node-home"
}

prepare() {
  _node_env

  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
      echo
    done
  }
  _prepare_sunshine
  _prepare_moonlight_common_c

  git -C "$_pkgsrc" cherry-pick -n -m1 a940cdb394055139ca6a964289f414da562452e3

  cd "$_pkgsrc"
  npm install --force --no-audit --no-fund
}

build() {
  _node_env

  export BRANCH="master"
  export BUILD_VERSION="${pkgver}"
  export COMMIT="$(git rev-parse HEAD)"

  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DSUNSHINE_ASSETS_DIR="share/sunshine"
    -DSUNSHINE_EXECUTABLE_PATH='/usr/bin/sunshine'
    -DSUNSHINE_ENABLE_CUDA=ON
    -DSUNSHINE_ENABLE_X11=ON
    -DBUILD_TESTS=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
