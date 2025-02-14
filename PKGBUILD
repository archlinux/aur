# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=bluejay-git
pkgver=1.0.2.r1.gfbe059e
pkgrel=1
pkgdesc="Bluetooth manager written in Qt"
arch=(x86_64)
url="https://github.com/EbonJaeger/bluejay"
license=(
    CC0-1.0
    CC-BY-SA-4.0
    MPL-2.0
)
depends=(
    bluez-qt
    kcoreaddons
    kdbusaddons
    ki18n
    kirigami
    kirigami-addons
    qqc2-desktop-style
    qt6-tools
    qt6-declarative
)
makedepends=(
    extra-cmake-modules
    git
    ninja
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
        -DCMAKE_INSTALL_PREFIX=/usr
        -G Ninja
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    cd "$srcdir/${pkgname%-git}"
    install -Dm0644 -t "$pkgdir/usr/share/doc/${pkgname%-git}" README.md
}
