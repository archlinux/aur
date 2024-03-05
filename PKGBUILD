# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ok-edu-classroom-desktop-git
pkgname=(ok-msg-desktop-git)
pkgver=r11.4ebddbc
pkgrel=1
arch=(x86_64
    aarch64
    riscv64)
_url="https://github.com/okstar-org"
url="${_url}/ok-msg-desktop"
pkgdesc="OkEDU 是基于“互联网+教育”理念， 解决在线上课问题而研发的互动教室。"
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
license=('GPL-2.0-or-later' 'MulanPubL-2.0')
groups=()
depends=(
    python
#     gbm
    gtk3
    libdrm
    libinput
    libxi
    libxkbfile
    krb5
    mtdev
    openssl
    systemd
    perl
    pkgconf

# Qt xcb
    qt5-tools
    freetype2
    fontconfig
    libx11
    libxcb
    libxcrypt
    libxext
    libxfixes
    libxrender

# Qt Multimedia
    alsa-lib
    gstreamer
    qt5-multimedia
    qt5-svg
    qt5-xmlpatterns

# sqlite sqlcipher
    sqlite
    sqlcipher

# vpx qrencode sodium
    ffmpeg
    qrencode
    libexif
    libvpx
    libjpeg-turbo
    libtiff
    libpng
    libsodium
    libxss

# webrtc gloox
#     webrtc-audio-processing
#     ok-gloox
            )
makedepends=(
    cmake
    clang
    llvm
    gcc
    git
    ninja)
checkdepends=()
optdepends=()
source=("${pkgname}::git+${_url}/ok-msg-desktop.git"
    "gloox::git+https://gitee.com/okstar-org/ok-gloox.git"
)
sha256sums=('SKIP'
            'SKIP')
options=()

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.3rdparty/gloox.url "$srcdir/gloox"
    git -c protocol.file.allow=always submodule update
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}
build() {
#     export QTDIR=/usr/lib
    cd "${srcdir}/${pkgname}"
#     sed -i '1,13d' cmake/dependencies.cmake
# see：https://wiki.archlinux.org/title/CMake_package_guidelines
#     cmake -DCMAKE_BUILD_TYPE=Release None \
    cmake -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_MAKE_PROGRAM=/usr/bin/ninja \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname%-git}/build install
}
