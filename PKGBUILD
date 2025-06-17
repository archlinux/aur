# Maintainer: Grey Christoforo <first name at last name dot net>

: ${_cuda_gcc_version:=14}

pkgname=sunshine-git
pkgver=2025.615.34501.r0.g958d783
pkgrel=1
pkgdesc="A self-hosted GameStream host for Moonlight"
url="https://github.com/LizardByte/Sunshine"
license=('GPL-3.0-only')
arch=('x86_64')

install=sunshine-git.install

depends=(
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
)

provides=(sunshine)
conflicts=(sunshine)

source=(
  git+https://github.com/LizardByte/Sunshine.git#branch=master
  git+https://github.com/moonlight-stream/moonlight-common-c.git
  git+https://gitlab.com/eidheim/Simple-Web-Server.git
  git+https://github.com/LizardByte/Virtual-Gamepad-Emulation-Client.git
  git+https://github.com/miniupnp/miniupnp.git
  git+https://github.com/FFmpeg/nv-codec-headers.git
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
  rm -f third-party/ffmpeg-windows-x86_64
  rm -f third-party/ffmpeg-macos-x86_64
  rm -f third-party/ffmpeg-macos-aarch64
  rm -f third-party/ffmpeg-linux-aarch64
  git submodule init
  git config submodule.third-party/moonlight-common-c.url "${srcdir}/moonlight-common-c"
  git config submodule.third-party/Simple-Web-Server.url "${srcdir}/Simple-Web-Server"
  git config submodule.third-party/ViGEmClient.url "${srcdir}/Virtual-Gamepad-Emulation-Client"
  git config submodule.third-party/miniupnp.url "${srcdir}/miniupnp"
  git config submodule.third-party/nv-codec-headers.url "${srcdir}/nv-codec-headers"
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

  ## fix for miniupnpc 2.3.3
  sed '1i #include <cstddef>' -i src/upnp.cpp
}

build() {
  pushd Sunshine
  npm install
  popd

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
