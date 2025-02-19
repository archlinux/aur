# Maintainer: taotieren <admin@taotieren.com>

pkgname=usb-can-git
pkgver=r28.abb584a
pkgrel=1
pkgdesc="USB-CAN Analyzer Linux Support"
url="https://github.com/kobolt/usb-can"
arch=($CARCH)
license=('MIT')
provides=(${pkgname%-git} canusb)
conflicts=(${pkgname%-git} canusb)
replaces=()
options=()
depends=(
    glibc
)
makedepends=(
    git
    pkgconf
)
optdepends=()
source=(
    "${pkgname}::git+${url}.git"
    "${pkgname}.install"
)
sha256sums=('SKIP'
    '45b92e9788ac186a4fa2bad728fe7956b2afb52c4f4b01481ddd2b26ed47bdc3')
install=${pkgname}.install

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
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export LDFLAGS+=" ${LDFLAGS}"

    cd "${srcdir}/${pkgname}/"
    make
}

package() {
    cd "${srcdir}/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm755 canusb -t "${pkgdir}/usr/bin/"
}
