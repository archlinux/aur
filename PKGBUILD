# Maintainer: taotieren <admin@taotieren.com>

pkgname=cannelloni
pkgver=2.1.3
pkgrel=1
pkgdesc="a SocketCAN over Ethernet tunnel"
arch=($CARCH)
url="https://github.com/mguentner/cannelloni"
license=('GPL-2.0-only')
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    libgcc_s.so
    libstdc++.so
    lksctp-tools
)
makedepends=(
    cmake
    git
    ninja
    pkgconf
)
checkdepends=()
optdepends=(
    'can-utils: Linux-CAN / SocketCAN user space applications'
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('56a23ccabebf4a8953c5ba0c87381249c02e46ea860a457d0b638d8ae3f7058c')
options=(!debug)

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-author \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -vDm644 "${srcdir}"/${pkgname}/gpl-2.0.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
