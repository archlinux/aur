# Maintainer: taotieren <admin@taotieren.com>

pkgbase=deepin-unioncode-git
pkgname=deepin-unioncode-git
pkgver=1.2.9.r90.g24d1ace
pkgrel=1
pkgdesc="IDE authored by deepin"
arch=(x86_64
    aarch64
    loongarch64
    mips64
    sw_64
    riscv64)
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
    dbus
    dtkcore
    dtkwidget
    dtkgui
    gcc-libs
    glibc
    hicolor-icon-theme
    java-runtime
    jsoncpp
    json-c
    libelf
    libelfin
    libunwind
    libx11
    qt5-base
    qt5-declarative
    qt5-location
    qt5-script
    qt5-webchannel
    qt5-webengine
    syntax-highlighting5
    python
    zstd)
makedepends=(
    argtable
    cmake
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
    qt5-tools
    openssl
    systemd
    pkgconf
    )
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^[vV]//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
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
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm0644 "${srcdir}/${pkgname}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m0644 "${srcdir}/${pkgname}"/LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
