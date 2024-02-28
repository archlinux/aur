# Maintainer: detiam <dehe_tian@outlook.com>

# shellcheck disable=SC1090
pkgname=lightlyshaders
pkgver='2.2.1'
pkgrel='1'
pkgdesc="Rounded window corners and outline effect for KWin."
arch=(x86_64)
url="https://github.com/a-parhom/${pkgname}"
license=(GPL-2.0-or-later)
depends=(kio5 knotifications5 kinit kwin kcrash5 kglobalaccel5 qt5-x11extras)
makedepends=(git extra-cmake-modules qt5-tools)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    mkdir -p lib
    ln -sf /usr/lib/libkwin.so.5 lib/libkwin.so
    echo "target_link_directories(lightlyshaders_blur PUBLIC ../lib)" >> "$pkgname/CMakeLists.txt"
}

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "$pkgname"
    make -j"$(nproc)" -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}
