# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=sunshine-nox
pkgver=0.18.4
pkgrel=1
pkgdesc="Game Stream server for Moonlight with no X11 deps"
arch=('x86_64')
url=https://github.com/LizardByte/Sunshine
license=('GPL3')
install="sunshine-nox.install"

depends=(
avahi
boost-libs
curl
libevdev
libmfx
libpulse
libva
libvdpau
numactl
openssl
opus
udev
)
makedepends=(
patch
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
conflicts=(sunshine sunshine-git)

source=(
sunshine.sysusers
udev.rules
sunshine.service
git+https://github.com/LizardByte/Sunshine.git#tag=v${pkgver}
git+https://github.com/moonlight-stream/moonlight-common-c.git
git+https://gitlab.com/eidheim/Simple-Web-Server.git
git+https://github.com/ViGEm/ViGEmClient
git+https://github.com/miniupnp/miniupnp
git+https://github.com/FFmpeg/nv-codec-headers
git+https://github.com/michaeltyson/TPCircularBuffer
git+https://github.com/LizardByte/build-deps
git+https://github.com/sleepybishop/nanors.git
git+https://github.com/cgutman/enet.git
)
sha256sums=('f596fd4b30bd9f81aac136366666491aa401ee420155d6c4368016088cf19caa'
            '5ce01689247cb01d3f119cac32c731607d99bb875dcdd39c92b547f76d2befa0'
            'd5cd58dd6cfdef10ac70d55f4baed52f90a117f972799889703c441d27a9679f'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd Sunshine

  # nox build fix
  curl -q https://github.com/greyltc/Sunshine/commit/45f101d5f6f84816d7c4e2194939e2ead778b186.patch | patch -p1

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
    -D SUNSHINE_ENABLE_X11=0 \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/sunshine \
    -D SUNSHINE_ASSETS_DIR="share/sunshine"

  cmake --build build_dir
}

package() {
  DESTDIR="${pkgdir}" cmake --install build_dir
  install -D -m 644 sunshine.sysusers "${pkgdir}/usr/lib/sysusers.d/sunshine.conf"
  install -D -m 644 udev.rules "${pkgdir}/etc/udev/rules.d/41-sunshine.rules"
  cp sunshine.service "${pkgdir}/usr/lib/systemd/user/sunshine.service"
}
