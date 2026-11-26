# SPDX-FileCopyrightText: 2026 OFD plugin contributors
# SPDX-License-Identifier: BSD-3-Clause
# Local-checkout packaging: run makepkg in this source directory.

pkgname=okular-backend-libofd
pkgver=0.2.0
pkgrel=1
pkgdesc='Standalone Open Fixed-layout Document (OFD) reader plugin for Okular'
arch=('x86_64' 'aarch64')
license=('GPL-2.0-or-later')
depends=(
    'okular'
    'qt6-base>=6.8'
    'karchive>=6.13'
    'ki18n>=6.13'
    'kcoreaddons>=6.13'
    'shared-mime-info'
)
makedepends=('cmake' 'ninja' 'extra-cmake-modules>=6.13')
checkdepends=('appstream')
source=("https://github.com/leaeasy/okular-backend-libofd/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1382006f4cf1facf09ee10cf0a2a78a19753b6ceb0481d0cc03e1b08b7d684fd')

build() {
    cmake -S "$srcdir/$pkgname-$pkgver" -B "$srcdir/build" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        -DBUILD_TESTING=OFF \
        -DOKULAR_OFD_CORE_CONFIGURATION="${OKULAR_OFD_CORE_CONFIGURATION:-NOCONFIG}"
    cmake --build "$srcdir/build"
}

check() {
    QT_QPA_PLATFORM=offscreen ctest --test-dir "$srcdir/build" --output-on-failure
}

package() {
    # shared-mime-info's pacman hook refreshes the target MIME database.
    # DESTDIR makes our CMake install hook skip updating the host database.
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
