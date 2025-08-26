# Maintainer: taotieren <admin@taotieren.com>

pkgbase=deepin-unioncode-git
pkgname=deepin-unioncode-git
pkgver=1.4.8.r3.gbac15c2
pkgrel=1
pkgdesc="IDE authored by deepin"
arch=($CARCH)
url="https://github.com/linuxdeepin/deepin-unioncode"
license=('GPL-3.0-only')
groups=()
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(
    bash
    capstone
    clang
    cmark
    dbus
    dtk6core
    dtk6log
    dtk6widget
    dtk6gui
    gcc-libs
    glibc
    hicolor-icon-theme
    java-runtime
    jsoncpp
    json-c
    icu
    libchardet
    libelf
    libelfin
    libunwind
    libx11
    qt6-5compat
    qt6-base
    qt6-declarative
    qt6-location
    qt5-script
    qt6-webchannel
    qt6-webengine
    syntax-highlighting5
    python
    yaml-cpp
    uchardet
    zstd)
makedepends=(
    argtable
    cmake
    cmark
    git
    ninja
    catch2
    doxygen
    hiredis
    llvm
    ncurses
    libdwarf
    libmicrohttpd
    libutf8proc
    libxi
    lxqt-build-tools
    lxqt-build-tools-qt5
    qt6-networkauth
    qt6-tools
    qtermwidget
    openssl
    systemd
    pkgconf
    python-onnxruntime
    python-pip
    python-pyjsparser
    vulkan-headers
)
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^[vV]//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    export LDFLAGS="-Wl,-z,relro,-z,now -Wl,-z,shstk -Wl,--no-as-needed"
    cd "${srcdir}/${pkgname}"

    # See：https://wiki.archlinux.org/title/CMake_package_guidelines
    # cmake -DCMAKE_BUILD_TYPE=None \
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_CXX_STANDARD=11 \
        -DCMAKE_CXX_STANDARD_REQUIRED=ON \
        -DCMAKE_CXX_EXTENSIONS=OFF \
        -Winconsistent-missing-override \
        -Wunused-command-line-argument \
        -Wno-dev \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
