
# SPDX-License-Identifier: 0BSD
# SPDX-FileCopyrightText: Ian Monroe <imonroe@kde.org>

# Maintainer: Ian Monroe <imonroe@kde.org>
pkgname=player-for-kexp-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Stream KEXP with album art and track information, straight to your desktop or terminal."
arch=('x86_64')
url="https://kexp.eean.dev"
license=('GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-quick3d'
    'qt6-graphs'
    'faad2'
    'kissfft'
    'notcurses'
    'libdeflate'
    'kcoreaddons'
    'ki18n'
    'kconfig'
    'kirigami'
    'kiconthemes'
    'kcmutils'
    'kirigami-addons'
    'sdl3'
    'pipewire'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'extra-cmake-modules'
)
source=(
    "git+https://invent.kde.org/ianmonroe/player-for-kexp.git"
    "kissfft.hh::https://raw.githubusercontent.com/mborgerding/kissfft/131.2.0/kissfft.hh"
)
sha256sums=(
    'SKIP'
    '0a31467599b981d784f53a944c19e6991aa96eee703ab424d648e436b2718a8d'
)
build() {
    cd "$srcdir"

    # Setup include directory for kissfft.hh (Arch package is missing the C++ header)
    mkdir -p kissfft-extra/include
    cp kissfft.hh kissfft-extra/include/

    # Build player-for-kexp
    cmake -B build-kexp -S player-for-kexp \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_NOTCURSES=ON \
        -DBUILD_TESTING=OFF \
        -DCMAKE_CXX_FLAGS="-I$srcdir/kissfft-extra/include"

    cmake --build build-kexp
}

package() {
    cd "$srcdir"

    # Install the application
    DESTDIR="$pkgdir" cmake --install build-kexp
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g'
}
