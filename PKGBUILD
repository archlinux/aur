# Maintainer: taotieren <admin@taotieren.com>

pkgbase=deepin-unioncode-git
pkgname=deepin-unioncode-git
pkgver=1.1.19.r19.gfaa30c15
pkgrel=1
pkgdesc="IDE authored by deepin"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/linuxdeepin/deepin-unioncode"
license=('GPL-3.0')
groups=()
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(
    glib2
    glibc
    )
makedepends=(
    argtable
    cmake
    git
    ninja
    catch2
    capstone
    clang
    dbus
    doxygen
    hiredis
    llvm
    json-c
    jsoncpp
    ncurses
    libelf
    libelfin
    libmicrohttpd
    libunwind
    libutf8proc
    libxi
    lxqt-build-tools
    qt5-tools
    qt5-script
    openssl
    systemd
    pkgconf
    python
    zstd
    )
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/^[vV]//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"

# see：https://wiki.archlinux.org/title/CMake_package_guidelines
# clang llvm build
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_COMPILER=clang \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
