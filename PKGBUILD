# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# Based on keepassxc

pkgname=keepassxc-qt6
pkgver=2.8.0qt6.r17.81e1e89
pkgrel=1
pkgdesc="Cross-platform community-driven port of Keepass password manager (Qt6 fork)"
arch=(x86_64)
url="https://keepassxc.org/"
license=('GPL-2.0-only OR GPL-3.0-only OR LGPL-2.1-only')
depends=(argon2 botan hicolor-icon-theme libxtst libusb
         minizip pcsclite qrencode qt6-svg qt6-5compat)
makedepends=(asciidoctor cmake git qt6-tools)
optdepends=('xclip: keepassxc-cli clipboard support under X server'
            'wl-clipboard: keepassxc-cli clipboard support under Wayland')
conflicts=('keepassxc')
provides=(org.freedesktop.secrets "keepassxc=$pkgver")
source=("git+https://github.com/the-nic/keepassxc#commit=81e1e89")
sha256sums=('c81abce39dc58bbf2922449e0634006a06fc295afc01d68d126d0f48953f2446')

prepare() {
  sed -i keepassxc/CMakeLists.txt -e '/_FORTIFY_SOURCE/d'
}

build() {
  cmake -S keepassxc -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKEEPASSXC_BUILD_TYPE=Release \
    -DWITH_TESTS=OFF \
    -DWITH_GUI_TESTS=OFF \
    -DKPXC_FEATURE_UPDATES=OFF
  cmake --build build
}

check() {
  : # cmake --build build --target test
}

package() {
  cmake --build build --target install -- DESTDIR="$pkgdir"
}
