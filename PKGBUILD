# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ok-edu-classroom-desktop-git
pkgname=(ok-edu-classroom-desktop-git)
pkgver=r31.341cfc8
pkgrel=1
arch=(x86_64
    aarch64
    riscv64)
_url="https://gitee.com/okstar-org"
url="${_url}/ok-edu-desktop"
pkgdesc="OkEDU 是基于“互联网+教育”理念，
解决在线上课问题而研发的互动教室。具备跨平台、拓展性等，可独立部署私有化系统，支持Windows、Linux、macOS平台。"
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
license=('GPL-2.0-or-later' 'MulanPubL-2.0')
groups=()
depends=(glibc
    gcc-libs)
# _cver=14
# _gver=12
makedepends=(
    cmake
#     clang${_cver}
#     llvm${_cver}
#     gcc${_gver}
    git
    ninja
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
    highway
# webrtc gloox
#     webrtc-audio-processing
#     ok-gloox
    )
checkdepends=()
optdepends=()
source=("${pkgname}::git+${_url}/ok-edu-desktop.git"
    "gloox::git+${_url}/ok-gloox.git"
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
    git checkout develop
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
# clang
#     cmake -DCMAKE_BUILD_TYPE=Debug \
#         -DCMAKE_INSTALL_PREFIX=/usr \
#         -DCMAKE_C_COMPILER=/usr/lib/llvm${_cver}/bin/clang \
#         -DCMAKE_CXX_COMPILER=/usr/lib/llvm${_cver}/bin/clang++ \
#         -B build \
#         -G Ninja \
#         -Wno-dev
# #         -DCMAKE_MAKE_PROGRAM=/usr/bin/ninja \
# gcc 12
#     cmake -DCMAKE_BUILD_TYPE=Debug \
#         -DCMAKE_INSTALL_PREFIX=/usr \
#         -DCMAKE_C_COMPILER=/usr/bin/gcc-${_gver} \
#         -DCMAKE_CXX_COMPILER=/usr/bin/g++-${_gver} \
#         -B build \
#         -G Ninja \
#         -Wno-dev
    cmake -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja \
        -Wno-dev
#         -DCMAKE_MAKE_PROGRAM=/usr/bin/ninja \
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
