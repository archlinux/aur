# Edit on github: https://github.com/LizardByte/Sunshine/blob/master/packaging/linux/Arch/PKGBUILD
# Reference: https://wiki.archlinux.org/title/PKGBUILD

pkgname='sunshine'
pkgver=2025.628.4510
pkgrel=5
pkgdesc="Self-hosted game stream host for Moonlight"
arch=('x86_64' 'aarch64')
url=https://app.lizardbyte.dev/Sunshine
license=('GPL-3.0-only')
install=sunshine.install

_gcc_version=14

depends=(
  'avahi'
  'curl'
  'libayatana-appindicator'
  'libcap'
  'libdrm'
  'libevdev'
  'libmfx'
  'libnotify'
  'libpulse'
  'libva'
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
  'which'
)

makedepends=(
  'appstream'
  'appstream-glib'
  'cmake'
  'desktop-file-utils'
  'cuda'
  "gcc${_gcc_version}"
  'git'
  'make'
  'nodejs'
  'npm'
)

optdepends=(
  'cuda: Nvidia GPU encoding support'
  'libva-mesa-driver: AMD GPU encoding support'
  'xorg-server-xvfb: Virtual X server for headless testing'
)

provides=()
conflicts=()

source=("$pkgname::git+https://github.com/LizardByte/Sunshine.git#commit=65f14e1003f831e776c170621bd06d8292f65155")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    git submodule update --recursive --init
}

build() {
    export BRANCH="master"
    export BUILD_VERSION="v2025.628.4510"
    export COMMIT="65f14e1003f831e776c170621bd06d8292f65155"

    export CC="gcc-${_gcc_version}"
    export CXX="g++-${_gcc_version}"

    export CFLAGS="${CFLAGS/-Werror=format-security/}"
    export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

    cmake \
        -S "$pkgname" \
        -B build \
        -Wno-dev \
        -D BUILD_DOCS=OFF \
        -D BUILD_WERROR=ON \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D SUNSHINE_EXECUTABLE_PATH=/usr/bin/sunshine \
        -D SUNSHINE_ASSETS_DIR="share/sunshine" \
        -D SUNSHINE_PUBLISHER_NAME='LizardByte' \
        -D SUNSHINE_PUBLISHER_WEBSITE='https://app.lizardbyte.dev' \
        -D SUNSHINE_PUBLISHER_ISSUE_URL='https://app.lizardbyte.dev/support'

    appstreamcli validate "build/dev.lizardbyte.app.Sunshine.metainfo.xml"
    appstream-util validate "build/dev.lizardbyte.app.Sunshine.metainfo.xml"
    desktop-file-validate "build/dev.lizardbyte.app.Sunshine.desktop"
    desktop-file-validate "build/dev.lizardbyte.app.Sunshine.terminal.desktop"

    make -C build
}

check() {
    export CC="gcc-${_gcc_version}"
    export CXX="g++-${_gcc_version}"

    cd "${srcdir}/build/tests"
    ./test_sunshine --gtest_color=yes
}

package() {
    make -C build install DESTDIR="$pkgdir"
}
