# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ok-rtc-git
pkgname=ok-rtc-git
pkgver=r480.14b54d8
pkgrel=1
arch=($CARCH)
pkgdesc="OkStar - WebRTC 对 OkStar
的拓展，上游主页：https://github.com/desktop-app/tg_owt"
_url="https://github.com/okstar-org"
url="${_url}/ok-rtc"
groups=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
license=('BSD-3-Clause')
depends=(
    abseil-cpp
    ffmpeg
    gcc-libs
    glib2
    glibc
    libjpeg-turbo
    libpipewire
    libvpx
    libx11
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxrandr
    libxtst
    openh264
    openssl
    opus
    protobuf)
makedepends=(
    cmake
    gcc
    gdm
    git
    ninja
    yasm
    zlib
)
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git"
    "libyuv::git+https://gitlab.com/chromiumsrc/libyuv.git"
    "crc32c::git+https://github.com/google/crc32c.git"
    "abseil-cpp::git+https://github.com/abseil/abseil-cpp.git"
    "libsrtp::git+https://github.com/cisco/libsrtp.git"

)
sha256sums=('SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP')
options=('!emptydirs')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.src/third_party/libyuv.url "$srcdir/libyuv"
    git config submodule.src/third_party/crc32c/src.url "$srcdir/crc32c"
    git config submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
    git config submodule.src/third_party/libsrtp.url "$srcdir/libsrtp"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${pkgname}"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
