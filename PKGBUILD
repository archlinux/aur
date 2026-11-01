# Maintainer: Kamil Piwowarski <kapiwko@gmail.com>
pkgname=meteo-pl
pkgver=0.9.3
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
sha256sums=('d8e679fe5bf0e596f8c7982718c1cf6637f2a01f26f1c7e0343124f65a7fd81e'
            '0c9e4295e9547acfc312afb614d4b9c0ed85031d1e1e4cda0a2579e6c6a03006'
            'b5794706e0bc326e6984b827b3bd1f2d319af9a793ffee4c00471fb5f9a7b26c'
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
