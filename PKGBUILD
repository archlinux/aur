# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=bluejay
pkgver=1.0.3
pkgrel=19
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
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "CMakeLists.txt.patch::${url}/commit/4d6d4e661310f1692a5ec62300105149571c949d.patch"
)
b2sums=('8315db4f7c807a956d7b0c7849cc2ff874332c4506b07d234749a9000ad094e09ad6073037d6acfa440310c1344dd5c362ab5074a84640c39a51d24178e800a2'
        'f8cd43fee7d874a75ed6c0faa0e7b7ee44b57eb33740ceafe150f5770958df050b52cb89faf6d5c2cf5907f35f7e6a9598658b2fa2a97bfb59f9d8d82f612059')

prepare() {
    # Don't include quiet packages in the feature summary
    patch -d ${pkgname}-${pkgver} -Np1 -i ../CMakeLists.txt.patch
}

build() {
    local cmake_options=(
        -S "${pkgname}-${pkgver}"
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
}

# vim: set ts=4 sw=4 et:
