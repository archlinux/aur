# Maintainer: taotieren <admin@taotieren.com>

pkgname=aria2-next
pkgver=2.7.1
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
    expat
    libgcc_s.so
    libstdc++.so
    libssh2
    libz.so
    openssl
    sqlite
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
sha256sums=('87bfb3a9824bea3d3eab3480af2ca382280d7ec7fa4eb261d17758c0eda7f269')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -DCMAKE_SKIP_RPATH=ON \
        -Wno-author \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}"
    # DESTDIR="${pkgdir}" ninja -C build install
    install -Dvm0755 build/aria2-next -t "${pkgdir}/usr/bin/"
    install -Dvm0644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
