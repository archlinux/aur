# Maintainer: Kamil Piwowarski <kapiwko@gmail.com>
pkgname=meteo-pl
pkgver=0.9.6
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
sha256sums=('3352e16f52db3a3c9159c322aa12ec6332e8993cd6e46bce37293c1e857ef262'
            '434c5e06491f9b6980315477e4eb18600622b769829de20e56ab3bfb1b9d06e8'
            'c3d1a2292feec7d44a4689d693d22664a3f9bab083476dc10185ab8907281d3a'
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
