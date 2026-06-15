# Maintainer: taotieren <admin@taotieren.com>

pkgname=aria2-next
pkgver=2.4.7
pkgrel=1
pkgdesc="Maintained aria2 fork with extensive bug fixes and modernized architecture"
arch=($CARCH)
url="https://github.com/AnInsomniacy/aria2-next"
license=('GPL-2.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=(
    boost-libs
    curl
    fmt
    glibc
    libgcc
    libstdc++
    libtorrent-rasterbar
    openssl
    spdlog
    zlib
)
makedepends=(
    git
    boost
    c-ares
    ca-certificates
    cmake
    cppunit
    gnutls
    gzip
    libssh2
    libxml2
    ninja
    sqlite
    pkgconf
)
optdepends=('motrix-next: A full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust')
backup=()
options=()
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('5f26154e238384093d143c5ea5252f546a7d8e576e2187bf13b0184326c483ad')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm0644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
