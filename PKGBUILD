# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=sunshine-git
pkgver=nightly.dev.r214.g032680c
pkgrel=1
pkgdesc="Game Stream server for Moonlight, latest git"
arch=('x86_64')
url=https://github.com/LizardByte/Sunshine
license=('GPL3')
install=sunshine-git.install

depends=(
avahi
boost-libs
curl
libevdev
libmfx
libpulse
libva
libvdpau
libx11
libxcb
libxfixes
libxrandr
libxtst
numactl
openssl
opus
udev
)
makedepends=(
git
boost
cmake
ninja
nodejs
npm
)
optdepends=(
'cuda: NvFBC capture support'
'libcap'
'libdrm'
)

provides=(sunshine)
conflicts=(sunshine sunshine-nox)

source=(
git+https://github.com/LizardByte/Sunshine.git#branch=nightly
git+https://github.com/moonlight-stream/moonlight-common-c.git
git+https://gitlab.com/eidheim/Simple-Web-Server.git
git+https://github.com/ViGEm/ViGEmClient.git
git+https://github.com/miniupnp/miniupnp.git
git+https://github.com/FFmpeg/nv-codec-headers.git
git+https://github.com/michaeltyson/TPCircularBuffer.git
git+https://github.com/LizardByte/build-deps.git
git+https://github.com/sleepybishop/nanors.git
git+https://github.com/cgutman/enet.git
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd Sunshine
  ( set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd Sunshine
  git rm -f third-party/ffmpeg-windows-x86_64
  git rm -f third-party/ffmpeg-macos-x86_64
  git rm -f third-party/ffmpeg-macos-aarch64
  git rm -f third-party/ffmpeg-linux-aarch64
  git submodule init
  git config submodule.third-party/moonlight-common-c.url "${srcdir}/moonlight-common-c"
  git config submodule.third-party/Simple-Web-Server.url "${srcdir}/Simple-Web-Server"
  git config submodule.third-party/ViGEmClient.url "${srcdir}/ViGEmClient"
  git config submodule.third-party/miniupnp.url "${srcdir}/miniupnp"
  git config submodule.third-party/nv-codec-headers.url "${srcdir}/nv-codec-headers"
  git config submodule.third-party/TPCircularBuffer.url "${srcdir}/TPCircularBuffer"
  git config submodule.third-party/ffmpeg-linux-x86_64.url "${srcdir}/build-deps"
  git config submodule.third-party/nanors.url "${srcdir}/nanors"
  git -c protocol.file.allow=always submodule update

  pushd third-party/moonlight-common-c
  git submodule init
  git config submodule.enet.url "${srcdir}/enet"
  git -c protocol.file.allow=always submodule update
  popd
}

build() {
  pushd Sunshine
  npm install
  popd

  export CFLAGS="${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

  cmake -B build_dir -S Sunshine -W no-dev -G Ninja \
    -D CMAKE_BUILD_TYPE=None \
    -D SUNSHINE_ENABLE_CUDA=1 \
    -D SUNSHINE_ENABLE_X11=1 \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/sunshine \
    -D SUNSHINE_ASSETS_DIR="share/sunshine"

  cmake --build build_dir
}

package() {
  DESTDIR="${pkgdir}" cmake --install build_dir
}
