# Maintainer: taotieren <admin@taotieren.com>

pkgname=cannelloni
pkgver=2.1.0
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('21946af75429387788b26bd46bfdb34cd12afd4c310343f08de316935c9cc52b')
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
