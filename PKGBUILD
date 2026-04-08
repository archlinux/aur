# Maintainer: taotieren <admin@taotieren.com>

pkgname=huawei-modem-calculator-git
pkgver=r37.f007c01
pkgrel=2
pkgdesc="Huawei modem unlock code calculator with the USB serial interface"
arch=($CARCH)
url="https://github.com/bigbigmdm/Huawei_modem_calculator_v2"
license=('GPL-2.0-only')
groups=()
_qt=qt5
depends=(
    glibc
    libgcc
    libstdc++
    $_qt-base
    $_qt-serialport
    openssl
)
makedepends=(
    cmake
    git
    ninja
    $_qt-tools
    pkgconf
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
noextract=()

pkgver() {
    cd "${srcdir}/${pkgname}"
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
    cmake -S "$srcdir/${pkgname}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C $srcdir/build
}

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
    install -Dm644 ${srcdir}/${pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
