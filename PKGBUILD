# Maintainer: taotieren <admin@taotieren.com>

pkgname=libefex-git
pkgver=r48.98db4cf
pkgrel=1
pkgdesc="library and cli for embedded firmware exchange protocol, support fel and fes protocol"
arch=($CARCH)
url="https://github.com/YuzukiTsuru/libefex"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    glibc
    libusb
)
makedepends=(
    #clang
    #llvm
    cmake
    git
    pkgconf
)
optdepends=(
    "openixcard: Open Source Version of Allwinner PhoenixCard on Linux"
    "openiximg: A comprehensive toolset for handling Allwinner IMAGEWTY format firmware images"
)
source=("${pkgname}::git+${url}.git"
)
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
    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build

    cmake --build "${srcdir}/build"
}

package() {
    # DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
    install -Dm0755 "${srcdir}/build/efex-cli" -t "${pkgdir}/usr/bin"
    install -Dm0755 "${srcdir}/build/scan_device" "${pkgdir}/usr/bin/scan-device"
    install -Dm0755 "${srcdir}/build/fel_test" "${pkgdir}/usr/bin/fel-test"
    install -Dm0755 "${srcdir}/build/fes_test" "${pkgdir}/usr/bin/fes-test"
    install -Dm0755 "${srcdir}/build/fes_flash" "${pkgdir}/usr/bin/fes-flash"
    install -Dm0644 "${srcdir}/build/src/libefex.a" -t "${pkgdir}/usr/lib"
    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
