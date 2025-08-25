# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# Based on keepassxc

pkgname=keepassxc-qt6
pkgver=2.7.10
pkgrel=1
pkgdesc="Cross-platform community-driven port of Keepass password manager, with Qt6 patch"
arch=(x86_64)
url="https://keepassxc.org/"
license=('GPL-2.0-only OR GPL-3.0-only OR LGPL-2.1-only')
depends=(argon2 botan hicolor-icon-theme libxtst
         minizip pcsclite qrencode qt6-svg libusb)
makedepends=(asciidoctor cmake qt6-tools)
optdepends=('xclip: keepassxc-cli clipboard support under X server'
            'wl-clipboard: keepassxc-cli clipboard support under Wayland')
conflicts=('keepassxc')
provides=(org.freedesktop.secrets "keepassxc=$pkgver")
source=("https://github.com/keepassxreboot/keepassxc/releases/download/$pkgver/keepassxc-$pkgver-src.tar.xz"
        "https://github.com/orsonteodoro/oiledmachine-overlay/raw/f4916d8/app-admin/keepassxc/files/keepassxc-$pkgver-entryattributesmodel.patch"
        "https://github.com/orsonteodoro/oiledmachine-overlay/raw/f4916d8/app-admin/keepassxc/files/keepassxc-$pkgver-fix-getTopLevelDomainFromUrl.patch"
        # "https://github.com/orsonteodoro/oiledmachine-overlay/raw/f4916d8/app-admin/keepassxc/files/keepassxc-$pkgver-fix-testpasskeys.patch"
        # "https://github.com/orsonteodoro/oiledmachine-overlay/raw/f4916d8/app-admin/keepassxc/files/keepassxc-$pkgver-fix-testentrymodel-test.patch"
        "https://github.com/orsonteodoro/oiledmachine-overlay/raw/f4916d8/app-admin/keepassxc/files/keepassxc-$pkgver-qt6-support-v2.patch")
sha256sums=('5ce76d6440986c24842585f019d5f3cadc166fa71fc911a4fe97b8bbc4819dfa'
            '4866837a05b1ee524a598d1fb803c55e9769eb3a6bad842b6283cc0d950443de'
            'c7d83fc97cc3d7a0fb27387ef8153ac1388695ae3c8455402c333ce8a66a2d78'
            # 'c1c9a8c919ef38bfb0860145b3b13a7ccb3b88a167f1c77b05ba5732dcbcd26a'
            # '541462d0831c18e98c0d9e5e33f7ac247dfc9656bd881039480fa3f8745fcb4e'
            'fefe707ce4ae0a42708980709ee987d48f8a949ee6ddce14eb1d072b9c0cf413')

prepare() {
  cd keepassxc-$pkgver
  sed -i CMakeLists.txt -e '/_FORTIFY_SOURCE/d'
  patch -N -p1 -i ../keepassxc-$pkgver-entryattributesmodel.patch
  patch -N -p1 -i ../keepassxc-$pkgver-fix-getTopLevelDomainFromUrl.patch
  # patch -N -p1 -i ../keepassxc-$pkgver-fix-testpasskeys.patch
  # patch -N -p1 -i ../keepassxc-$pkgver-fix-testentrymodel-test.patch
  patch -N -p1 -i ../keepassxc-$pkgver-qt6-support-v2.patch
}

build() {
  cmake -S keepassxc-$pkgver -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKEEPASSXC_BUILD_TYPE=Release \
    -DWITH_QT6=ON \
    -DWITH_QT5=OFF \
    -DWITH_XC_ALL=ON \
    -DWITH_TESTS=OFF \
    -DWITH_GUI_TESTS=OFF \
    -DWITH_XC_UPDATECHECK=OFF
  cmake --build build
}

check() {
  : # cmake --build build --target test
}

package() {
  cmake --build build --target install -- DESTDIR="$pkgdir"
}
