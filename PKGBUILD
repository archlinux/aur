# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=bluejay-git
pkgver=1.0.3.r6.g6c84125
pkgrel=1
pkgdesc="Bluetooth manager written in Qt"
arch=(x86_64)
url="https://codeberg.org/EbonJaeger/bluejay"
license=('CC0-1.0 AND CC-BY-SA-4.0 AND MPL-2.0')
depends=(
    bluez-qt
    glibc
    hicolor-icon-theme
    kcolorscheme
    kcoreaddons
    kdbusaddons
    ki18n
    kirigami
    kirigami-addons
    libgcc
    qqc2-desktop-style
    qt6-base
    qt6-declarative
    qt6-tools
)
makedepends=(
    appstream
    extra-cmake-modules
    git
    ninja
    vulkan-headers
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    local cmake_options=(
        -S "${pkgname%-git}"
        -B build
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -G Ninja
        -W no-dev
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" \
        "$srcdir/${pkgname%-git}/README.md" \
        "$srcdir/${pkgname%-git}/CONTRIBUTING.md"
}

# vim: set ts=4 sw=4 et:
