# Maintainer: taotieren <admin@taotieren.com>

pkgname=qserial
pkgver=1.2.r0.g82c1af2
pkgrel=1
pkgdesc="An advanced cross-platform serial port utility"
arch=('aarch64'
    'riscv64'
    'x86_64')
url="https://github.com/tuna/QSerial"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
_qt=qt6
depends=(
    glibc
    gcc-libs
    libusb
    $_qt-base
    $_qt-webchannel
    $_qt-webengine
    $_qt-5compat
    $_qt-serialport)
makedepends=(
    git
    $_qt-tools)
backup=()
options=()
source=("${pkgname}::git+${url}.git"
    "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '26d2b87276ab02ba15cc5d947721bde4fab7378d139ecb308ae70a0652ed394c')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd ${srcdir}/${pkgname}
    qmake6 ${pkgname%-git}.pro
    make
}

package() {
    install -Dm755 ${srcdir}/${pkgname}/QSerial ${pkgdir}/usr/bin/${pkgname%-git}
    install -Dm644 ${srcdir}/${pkgname%-git}.desktop ${pkgdir}/usr/share/applications/${pkgname%-git}.desktop
}
