# Maintainer: taotieren <admin@taotieren.com>

pkgname=aria2-next
pkgver=2.5.2
pkgrel=1
pkgdesc="Maintained aria2 fork with extensive bug fixes and modernized architecture"
arch=($CARCH)
url="https://github.com/AnInsomniacy/aria2-next"
license=('GPL-2.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=(
    c-ares
    libgcc
    libstdc++
    libxml2
    openssl
    sqlite
    zlib
)
makedepends=(
    git
    boost
    boost-libs
    ca-certificates
    cmake
    cppunit
    curl
    fmt
    gnutls
    gzip
    libssh2
    libtorrent-rasterbar
    ninja
    pkgconf
    spdlog
)
optdepends=('motrix-next: A full-featured download manager rebuilt with Tauri 2, Vue 3, and Rust')
backup=()
options=()
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('d24d651bdfce7454b5be2db2dcc2549c89b50c84c51c49cada99d943151e75f9')

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
