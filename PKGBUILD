# Maintainer: taotieren <admin@taotieren.com>

pkgname=usb-can-git
pkgver=r28.abb584a
pkgrel=2
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
            'ff0b54e17c698480b0502c20768ed7ec828388f61b5bafa066219d83ef0cda23')
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
    install -Dm755 canusb -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
