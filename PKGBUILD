# Maintainer: Yoann ONO <contact@y0no.fr>

pkgname=zenith-gamestream
pkgver=2026.730.002631
pkgrel=2
pkgdesc='Linux game streaming host for Moonlight, forked from Sunshine'
arch=('x86_64' 'aarch64')
url='https://github.com/jacksonpate/zenith'
license=('GPL-3.0-only')
depends=(
  'avahi'
  'curl'
  'glib2'
  'icu'
  'kmod'
  'libcap'
  'libdrm'
  'libevdev'
  'libglvnd'
  'libmfx'
  'libnotify'
  'libpipewire'
  'libpulse'
  'libva'
  'libx11'
  'libxcb'
  'libxext'
  'libxfixes'
  'libxrandr'
  'libxtst'
  'mesa'
  'miniupnpc'
  'numactl'
  'openssl'
  'opus'
  'python'
  'qt6-base'
  'qt6-svg'
  'sudo'
  'systemd'
  'vulkan-icd-loader'
  'wayland'
  'which'
)
makedepends=(
  'appstream'
  'cmake'
  'desktop-file-utils'
  'git'
  'ninja'
  'nlohmann-json'
  'nodejs'
  'npm'
  'python-jinja'
  'python-setuptools'
  'shaderc'
  'uv'
  'vulkan-headers'
)
# Set ZENITH_USE_CUDA=1 before makepkg -s to install CUDA build dependencies.
if [[ ${ZENITH_USE_CUDA:-auto} == 1 ]]; then
  makedepends_x86_64=('cuda' 'gcc15')
fi
optdepends=(
  'evdi-dkms: virtual display fallback when all GPU ports are occupied'
  'libva-mesa-driver: hardware encoding on AMD GPUs'
  'python-gobject: GNOME virtual display control'
  'wlr-randr: virtual display control on Niri and wlroots compositors'
)
conflicts=('sunshine' 'sunshine-bin' 'zenith' 'zenith-bin')
install=zenith-gamestream.install

_commit=8f5f0e95569384d4d59dad8c4fa153c287ac7670
_ffmpeg_tag=v2026.708.4843
source=(
  "zenith::git+https://github.com/jacksonpate/zenith.git#commit=${_commit}"
  'zenith-gamestream.conf'
)
source_x86_64=("Linux-x86_64-ffmpeg.tar.gz::https://github.com/jacksonpate/build-deps/releases/download/${_ffmpeg_tag}/Linux-x86_64-ffmpeg.tar.gz")
source_aarch64=("Linux-aarch64-ffmpeg.tar.gz::https://github.com/jacksonpate/build-deps/releases/download/${_ffmpeg_tag}/Linux-aarch64-ffmpeg.tar.gz")
sha256sums=('SKIP' '0d328038322f62ff1f3319666df5f8f58c0a028415a917ad247b0446c1ff90f5')
sha256sums_x86_64=('727256835b71bc203e962f3c6c0ee58ee37ae344c453a11b691298aa94136367')
sha256sums_aarch64=('85e2797aeebb799af32803f93d6aedafd1147dc24fb3efdbcd8f464677838157')

prepare() {
  cd "$srcdir/zenith"
  git submodule update --init --recursive --depth 1 -- \
    third-party/Simple-Web-Server \
    third-party/glad \
    third-party/inputtino \
    third-party/libdisplaydevice \
    third-party/lizardbyte-common \
    third-party/moonlight-common-c \
    third-party/nanors \
    third-party/nv-codec-headers \
    third-party/plasma-wayland-protocols \
    third-party/tray \
    third-party/wayland-protocols \
    third-party/wlr-protocols
}

build() {
  export BRANCH=master BUILD_VERSION="v$pkgver" COMMIT="$_commit"

  local cmake_options=(
    -S "$srcdir/zenith"
    -B "$srcdir/build"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DBUILD_DOCS=OFF
    -DBUILD_TESTS=OFF
    -DSUNSHINE_ASSETS_DIR=share/zenith
    -DSUNSHINE_EXECUTABLE_PATH=/usr/bin/zenith
    -DSUNSHINE_PUBLISHER_NAME=jacksonpate
    -DSUNSHINE_PUBLISHER_WEBSITE=https://github.com/jacksonpate/zenith
    -DSUNSHINE_PUBLISHER_ISSUE_URL=https://github.com/jacksonpate/zenith/issues
    -DSUNSHINE_SYSTEM_VULKAN_HEADERS=ON
    -DFFMPEG_PREPARED_BINARIES="$srcdir/ffmpeg"
  )

  local use_cuda=${ZENITH_USE_CUDA:-auto}
  if [[ $use_cuda == auto ]]; then
    if [[ $CARCH == 'x86_64' && -x /opt/cuda/bin/nvcc ]] && command -v g++-15 >/dev/null; then
      use_cuda=1
    else
      use_cuda=0
    fi
  fi

  if [[ $CARCH == 'x86_64' && $use_cuda == 1 ]]; then
    export CC=gcc-15 CXX=g++-15 CUDA_PATH=/opt/cuda
    cmake_options+=(
      -DSUNSHINE_ENABLE_CUDA=ON
      -DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc
      -DCMAKE_CUDA_HOST_COMPILER=/usr/bin/g++-15
    )
  else
    cmake_options+=(-DSUNSHINE_ENABLE_CUDA=OFF)
  fi

  cmake "${cmake_options[@]}"
  cmake --build "$srcdir/build" --parallel 4
}

check() {
  appstreamcli validate --no-net "$srcdir/build/io.github.jacksonpate.Zenith.metainfo.xml"
  desktop-file-validate "$srcdir/build"/*.desktop
  "$srcdir/build/zenith" --version
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
  rm "$pkgdir/usr/lib/modules-load.d/60-sunshine.conf"
  install -Dm644 "$srcdir/zenith-gamestream.conf" "$pkgdir/usr/lib/modules-load.d/zenith-gamestream.conf"
  install -Dm644 "$srcdir/zenith/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/zenith/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
