# Maintainer: GreyXor <greyxor@protonmail.com>
pkgname=vesc-tool-all-firmwares
pkgver=6.05
_pkgver=6_05
pkgrel=1
pkgdesc='VESC ESC graphical configuration tool with all firmwares'
arch=('x86_64')
url="https://github.com/vedderb/vesc_tool"
license=("MIT")
depends=(
	"qt5-location"
    "qt5-connectivity"
    "qt5-serialport"
    "qt5-gamepad"
    "xdg-utils"
    "qt5-base"
    "qt5-declarative"
    "qt5-wayland"
    "qt5-quickcontrols2"
)
makedepends=(
	"git"
)
source=("${pkgname}::git+${url}.git#branch=release_$_pkgver"
        "${pkgname}_bldc::git+https://github.com/vedderb/bldc.git#branch=release_$_pkgver"
        'vesc-tool.desktop')
b2sums=('SKIP'
        'SKIP'
        '075ccf8f9d1ce81b346c9c7d553272bafdad1b1be6991c8d9f5bfd7f92d256167718bfe72e319b3b14d9acdb9d2ea7ff6b02e38a271d09baa268c84863b8e93b')

build() {
    cd "${srcdir}/${pkgname}_bldc"

    # Install the ARM SDK
    make arm_sdk_install

    # Build all firmware, have to return true because rm: clean list too big
    make all_fw_package || true

    # Copy firmwares
    cp -r package/* ../${pkgname}/res/firmwares

    cd ../${pkgname}

    qmake -config release "CONFIG += release_lin build_platinum"
    make
    strip -s "build/lin/vesc_tool_$pkgver"
}

package() {
    cd "${srcdir}/${pkgname}"

    install -d "${pkgdir}/opt/vesc-tool"
    install -Dm644 ../vesc-tool.desktop \
    "$pkgdir/usr/share/applications/vesc-tool.desktop"
    install -m755 "build/lin/vesc_tool_${pkgver}" "${pkgdir}/opt/vesc-tool/vesc_tool"
}
