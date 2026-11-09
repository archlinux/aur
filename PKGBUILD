# Maintainer: taotieren <admin@taotieren.com>

pkgname=nuvoton-hid-isp-git
pkgver=r2.151134b
pkgrel=1
pkgdesc="Nuvoton USB HID ISP Programmer"
arch=($CARCH)
url="https://github.com/Jen-Chih-Liu/LINUX_HID_ISP_NUVOTON"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    libusb
)
makedepends=(
    git
    cmake
    ninja
    pkgconf
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

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
    cd "${srcdir}/${pkgname}"
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Bbuild \
        -GNinja \
        -Wno-author

    ninja -C build
}

package() {
    cd "${srcdir}"/${pkgname}/
    DESTDIR="${pkgdir}" ninja -C build install
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/99-nuvoton-isp.rules" <<EOF
# Nuvoton USB HID ISP Device
SUBSYSTEM=="usb|hidraw", ATTRS{idVendor}=="0416", ATTRS{idProduct}=="3f00", TAG+="uaccess"
EOF
}
