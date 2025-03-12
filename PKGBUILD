# Maintainer: taotieren <admin@taotieren.com>

pkgname=cannelloni
pkgver=1.2.0
pkgrel=1
pkgdesc="cannelloni is written in C++11 and uses UDP, TCP or SCTP to transfer CAN frames between two machines."
arch=($CARCH)
url="https://github.com/mguentner/cannelloni"
license=('GPL-2.0-only')
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    gcc-libs
    glibc
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e03554533f8aa3a8c4b7e80db94ce4bab3f0aa601a9a41e67d614b4c14217d5e')
options=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}-${pkgver}/build install
    install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/gpl-2.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
