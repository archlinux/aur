# Maintainer: taotieren <admin@taotieren.com>

pkgname=libdft-git
pkgver=r80.066c9d8
pkgrel=3
pkgdesc="libdft: Practical Dynamic Data Flow Tracking"
arch=($CARCH)
url="https://github.com/AngoraFuzzer/libdft64"
license=('BSD-3-Clause AND custom')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    #     glibc
    #     gcc-libs
    libdwarf
)
makedepends=(
    git
    pin
)
backup=()
options=('!strip')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^[vV]//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    export PIN_ROOT=/opt/pin

    cd "${srcdir}/${pkgname}/"
    sed -i 's|track|track nullpin libdft libdft-dta|g' tools/makefile.rules
    make V=1
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    cd "${srcdir}/${pkgname}/tools/obj-intel64"
    install -Dm755 track.so -t "${pkgdir}/usr/lib/"
    install -Dm755 nullpin.so -t "${pkgdir}/usr/lib/"
    install -Dm755 libdft.so -t "${pkgdir}/usr/lib/"
    install -Dm755 libdft-dta.so -t "${pkgdir}/usr/lib/"

}
