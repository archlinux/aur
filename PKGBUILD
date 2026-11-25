# Maintainer: Kamil Piwowarski <kapiwko@gmail.com>
pkgname=meteo-pl
pkgver=0.9.5
pkgrel=1
pkgdesc='ICM weather forecasts, interactive meteograms and a Plasma 6 widget'
arch=('x86_64' 'aarch64')
url='https://github.com/kapiwko/meteo-pl'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'hicolor-icon-theme'
         'qt6-base' 'qt6-declarative' 'qt6-positioning' 'qt6-svg' 'qt6-wayland'
         'kirigami' 'ki18n' 'knotifications' 'kcolorscheme' 'kcoreaddons' 'qqc2-desktop-style'
         'breeze-icons' 'krunner')
makedepends=('cmake' 'ninja' 'gettext' 'extra-cmake-modules' 'python')
_build_tests=OFF
if [[ ${METEO_AUR_TESTS:-0} == 1 ]]; then
    _build_tests=ON
    checkdepends=('xorg-server-xvfb' 'xorg-xauth' 'dbus' 'ttf-dejavu'
                  'plasma-workspace' 'plasma-desktop')
fi
optdepends=('plasma-desktop: Plasma widget and KRunner integration'
            'libplasma: Plasma widget runtime'
            'kcmutils: Plasma widget settings')
# Qt SVG, Wayland, desktop controls and icon themes are loaded at runtime.
# The AUR repository provides the source signing key under keys/pgp/.
source=("https://github.com/kapiwko/meteo-pl/releases/download/v${pkgver}/meteo-pl-${pkgver}.tar.gz"
        "meteo-pl-${pkgver}-SHA256SUMS::https://github.com/kapiwko/meteo-pl/releases/download/v${pkgver}/SHA256SUMS"
        "meteo-pl-${pkgver}-SHA256SUMS.asc::https://github.com/kapiwko/meteo-pl/releases/download/v${pkgver}/SHA256SUMS.asc"
        'valijson-5eac4b66.tar.gz::https://codeload.github.com/tristanpenman/valijson/tar.gz/5eac4b66f20b2c189ae40281c29e71cf39a958ec')
sha256sums=('bb1477d8b192a528b505d4754abf264221fa64ec3dc36f70ecdee96d019e6a0f'
            'f1df7de7bf532a9e798d4c552e34963abf94e96e26f862d4111e7c75f0eaff71'
            '5be0bb655a31fa986e09000d80c082bbbad2d5c1f8d5952ae5943315f1ef1bf9'
            '8b68741da04708c806d07a5a5fd181d3fb801aa161d7f65f45d7a3cc1b0c98ee')
validpgpkeys=('1C0C43EF3001F658C11971D1A4A884E5B7A2A8A1')

prepare() {
    # makepkg verifies the maintainer signature on the checksum manifest.
    # Also bind the source archive to that signed manifest.
    cd "$srcdir"
    sha256sum --ignore-missing --check "meteo-pl-${pkgver}-SHA256SUMS"
}

build() {
    cmake -S "$srcdir/meteo-pl-${pkgver}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING="$_build_tests" \
        -DMETEO_BUILD_PLASMOID=ON \
        -DMETEO_BUILD_KRUNNER=ON \
        -DFETCHCONTENT_SOURCE_DIR_METEO_VALIJSON="$srcdir/valijson-5eac4b66f20b2c189ae40281c29e71cf39a958ec" \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON
    cmake --build build
}

if [[ $_build_tests == ON ]]; then
    check() {
        dbus-run-session -- xvfb-run --auto-servernum ctest --test-dir build --output-on-failure
    }
fi

package() {
    DESTDIR="$pkgdir" cmake --install build
}
