# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# Based on keepassxc

pkgname=keepassxc-qt6
pkgver=2.7.9
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
        "https://github.com/orsonteodoro/oiledmachine-overlay/raw/2758996/app-admin/keepassxc/files/keepassxc-$pkgver-qt6-support-v2.patch")
sha256sums=('3c44e45f22c00ddac63d8bc11054b4b0ada0222ffac08d3ed70f196cb9ed46fd'
            '6299df9f4eb262ccaea7ed65021694fc32f48887401a9734688933f20a3e9f52')

prepare() {
  cd keepassxc-$pkgver
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
    -DWITH_GUI_TESTS=OFF \
    -DWITH_XC_UPDATECHECK=OFF
  cmake --build build
}

package() {
  cmake --build build --target install -- DESTDIR="$pkgdir"
}
