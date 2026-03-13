# Maintainer: taotieren <admin@taotieren.com>

pkgname=libefex-git
pkgver=r89.83819c6
pkgrel=2
pkgdesc="library and cli for embedded firmware exchange protocol, support fel and fes protocol"
arch=($CARCH)
url="https://github.com/YuzukiTsuru/libefex"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    glibc
    libusb
    systemd-libs
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
source=(
    "${pkgname}::git+${url}.git"
    "libusb-cmake::git+https://github.com/libusb/libusb-cmake.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

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
    cd ${srcdir}/${pkgname}
    git submodule init
    git config submodule.lib/libusb-cmake.url "$srcdir/libusb-cmake"
    git -c protocol.file.allow=always submodule update
}

build() {
    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIBEFEX_USE_SHARED_LIBUSB=ON \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev \
        -B build

    cmake --build "${srcdir}/build"
}

# check() {
#     # cd "${srcdir}/${pkgname}"
#     ctest --test-dir ${srcdir}/build --output-on-failure
# }

package() {
    # DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
    find "${srcdir}/build/" \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
    # install -Dm0755 "${srcdir}/build/efex-cli" -t "${pkgdir}/usr/bin"
    # install -Dm0755 "${srcdir}/build/scan_device" "${pkgdir}/usr/bin/scan-device"
    # install -Dm0755 "${srcdir}/build/fel_test" "${pkgdir}/usr/bin/fel-test"
    # install -Dm0755 "${srcdir}/build/fes_test" "${pkgdir}/usr/bin/fes-test"
    # install -Dm0755 "${srcdir}/build/fes_flash" "${pkgdir}/usr/bin/fes-flash"
    install -Dm0644 "${srcdir}/build/src/libefex.a" -t "${pkgdir}/usr/lib"
    install -Dm0644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
