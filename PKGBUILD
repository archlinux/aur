# Maintainer: taotieren <admin@taotieren.com>

pkgname=icsim-git
pkgver=r41.74c0916
pkgrel=1
pkgdesc="Instrument Cluster Simulator for SocketCAN"
url="https://github.com/zombieCraig/ICSim"
arch=($CARCH)
license=('GPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
options=()
depends=(
    glibc
    can-utils
    sdl2-compat
    sdl2_gfx
    sdl2_image
)
makedepends=(
    cmake
    git
    meson
    pkgconf
)
source=(
    "${pkgname}::git+${url}.git"
    meson.patch
)
sha256sums=('SKIP'
            'e311c2c4a9a8871047e0dc72317b88876118f565940b291b2fc653ded91795c6')

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
    patch -p1 -i "${srcdir}/meson.patch"
    sed -e 's|./data/|/usr/share/icsim/data|g' \
        -e 's|DATA_DIR "sample-can.log"|"/var/log/icsim/sample-can.log"|g' \
        -i \
        controls.c \
        icsim.c
}

build() {
    arch-meson ${pkgname} build
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install

    cd "${srcdir}/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm755 setup_vcan.sh "${pkgdir}/usr/bin/${pkgname%-git}-setup-vcan"
    install -Dm644 /dev/stdin "${pkgdir}/var/log/icsim/sample-can.log" <<EOF
EOF
}
