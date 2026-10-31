# Maintainer: Kamil Piwowarski <kapiwko@gmail.com>
pkgname=meteo-pl
pkgver=0.9.2
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
checkdepends=('xorg-server-xvfb' 'xorg-xauth' 'dbus' 'ttf-dejavu'
              'plasma-workspace' 'plasma-desktop')
optdepends=('plasma-desktop: Plasma widget and KRunner integration'
            'libplasma: Plasma widget runtime'
            'kcmutils: Plasma widget settings')
# Qt SVG, Wayland, desktop controls and icon themes are loaded at runtime.
# The AUR repository provides the source signing key under keys/pgp/.
source=("https://github.com/kapiwko/meteo-pl/releases/download/v${pkgver}/meteo-pl-${pkgver}.tar.gz"
        "meteo-pl-${pkgver}-SHA256SUMS::https://github.com/kapiwko/meteo-pl/releases/download/v${pkgver}/SHA256SUMS"
        "meteo-pl-${pkgver}-SHA256SUMS.asc::https://github.com/kapiwko/meteo-pl/releases/download/v${pkgver}/SHA256SUMS.asc"
        'valijson-5eac4b66.tar.gz::https://codeload.github.com/tristanpenman/valijson/tar.gz/5eac4b66f20b2c189ae40281c29e71cf39a958ec')
sha256sums=('d542b05a4ab2eb6adfece48f3d50ed26c9be00b37d6dfc00bdf5bddf0c623814'
            'c5ffe770b3f581177782705cf3a3848f61d7483ccea4640953c5a9c196968045'
            '56068c8369eca007aeb2b0a8d94aaba8ab0e249091121b1f80360ee79e386d93'
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
        -DBUILD_TESTING=ON \
        -DMETEO_BUILD_PLASMOID=ON \
        -DMETEO_BUILD_KRUNNER=ON \
        -DFETCHCONTENT_SOURCE_DIR_METEO_VALIJSON="$srcdir/valijson-5eac4b66f20b2c189ae40281c29e71cf39a958ec" \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON
    cmake --build build
}

check() {
    dbus-run-session -- xvfb-run --auto-servernum ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
