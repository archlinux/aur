# Maintainer: taotieren <admin@taotieren.com>

pkgname=udsim-git
pkgver=r33.b379464
pkgrel=1
pkgdesc="UDS Simulator and Fuzzer"
url="https://github.com/zombieCraig/UDSim"
arch=($CARCH)
license=('GPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
options=()
depends=(
    sh
    gcc-libs
    glibc
    sdl2-compat
    sdl2_image
    sdl2_ttf
)
makedepends=(
    git
    pkgconf
)
optdepends=('icsim: Instrument Cluster Simulator for SocketCAN')
source=(
    "${pkgname}::git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    sed -e 's|../data/|/usr/share/udsim/data|g' \
        -i \
        src/gui.cc
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export LDFLAGS+=" ${LDFLAGS}"

    cd "${srcdir}/${pkgname}/src"
    make
}

package() {
    cd "${srcdir}/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm755 src/udsim "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 src/setup_vcan.sh "${pkgdir}/usr/bin/${pkgname%-git}-setup-vcan"
    install -Dm755 src/setup_can.sh "${pkgdir}/usr/bin/${pkgname%-git}-setup-can"
    install -dm755 "${pkgdir}/usr/share/udsim/"
    cp -r {Peach.Core.OS.Linux,data,README.md} "${pkgdir}/usr/share/udsim/"

}
