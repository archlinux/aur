# Maintainer: Nico Ungruhe <nico@planet-express.org>

pkgname="kwi"
pkgrel=7
pkgver=0.1.0
pkgdesc="Modern and fast terminal for KDE Plasma and other desktops"
arch=('x86_64')
url="https://invent.kde.org/utilities/${pkgname}"
license=('GPL-2.0-only OR GPL-3.0-only OR LicenseRef-scancode-kde-accepted-gpl'
    'LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-scancode-kde-accepted-lgpl'
    'GPL-2.0-or-later'
    'LGPL-2.0-or-later'
    'CC0-1.0'
    'BSD-2-Clause'
    'CC-BY-SA-4.0'
)
makedepends=('cmake' 'extra-cmake-modules' 'ninja' 'git' 'qt6-shadertools'
    'zig')   # zig required for libghostty-vt
depends=('qt6-base' 'qt6-declarative'
    'kwindowsystem' 'kwidgetsaddons' 'kguiaddons' 'kdbusaddons' 'ki18n'
    'knotifications' 'kcoreaddons' 'kconfig' 'kpty' 'kconfigwidgets' 'kio'
    'kparts' 'kxmlgui' 'kitemmodels' 'qqc2-desktop-style'
    'kirigami' 'kirigami-addons' 'kirigami-app-components')
provides=('kwi')
source=("kwi::git+https://invent.kde.org/utilities/kwi#commit=851d9a7d9252f601061dbff23db0275012a86fce"
    "https://release.files.ghostty.org/libghostty-vt/1.0.1/libghostty-vt-1.0.1.tar.gz"
    "https://release.files.ghostty.org/libghostty-vt/1.0.1/libghostty-vt-1.0.1-deps.tar.gz")
sha512sums=('71eaf12421f9e69ef7abcc60b2c1cad9fe9894e582ba52318bb3ffdbd0735f7885938db0ce92dd61b3524359563b50b4a0f7620186055bfee1c03269be11c27f'
    '74ad5ab2d8f62ddfbf7e0904803008c2cf3769dd29de3dc700d39f1fd01cb1827b3d663ced2d365137e2cf0f0fa33abc3eaf98327e429a206a1156da59b7f688'
    'b741c19118a800a61105750fabceef84585d404da92a3082baaab087b71f26800c24cfd2841ce18859a5f23a53d17d2f24f41231ce30be010e446752a813de9d')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    grep "project(kwi VERSION" CMakeLists.txt | cut -d " " -f 3
}

# TEMPORARY: kwi needs libghostty-vt >= 1.0, Arch's ghostty ships 0.1.0-dev.
# We use zig to build it from source and link statically.
build_libghostty_vt() {
    cd "${srcdir}/libghostty-vt-1.0.1"
    DESTDIR="${srcdir}/libghostty-vt-root" \
    ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-cache" \
    zig build \
        --prefix /usr \
        --system "${srcdir}/libghostty-vt-1.0.1-deps" \
        -Doptimize=ReleaseFast \
        -Dcpu=baseline
}

build() {
    (build_libghostty_vt)
    local cmake_options=(
        -B build
        -S "${pkgname}"
        -G Ninja
        -W no-author
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D CMAKE_PREFIX_PATH="${srcdir}/libghostty-vt-root/usr"
        -D Ghostty_USE_STATIC_LIBS=ON
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    # add statiscally linked libghostty-vt licence
    install -Dm644 "${srcdir}/libghostty-vt-1.0.1/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/libghostty-vt-LICENSE"
}
