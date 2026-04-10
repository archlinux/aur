# Maintainer: fuddlesworth <fuddlesworth at users dot noreply dot github dot com>
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Requires Plasma 6.6+ (KF6 6.6, Qt 6.6, KWin 6.6).

pkgname=plasmazones
pkgver=2.8.5
pkgrel=1
pkgdesc='Window tiling and autotiling for KDE Plasma'
arch=('x86_64')
url='https://github.com/fuddlesworth/PlasmaZones'
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-shadertools'
    'qt6-svg'
    'kconfig'
    'kconfigwidgets'
    'kirigami'
    'kcmutils'
    'kglobalaccel'
    'qt6-wayland'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'ninja'
    'qt6-tools'
    'kwin'
    'wayland'
    'vulkan-headers'
    'vulkan-icd-loader'
)
optdepends=(
    'plasma-activities: activity-based layouts'
)
conflicts=('plasmazones-bin' 'plasmazones-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3271d2fc92486536125e0e90319cea7ebb4da50da0410f34a3fd31a189268082')
install=plasmazones.install

build() {
    cmake -B build -S "PlasmaZones-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Install pacman hook to auto-refresh sycoca cache
    install -Dm644 "PlasmaZones-$pkgver/packaging/arch/kbuildsycoca.hook" \
        "$pkgdir/usr/share/libalpm/hooks/plasmazones-kbuildsycoca.hook"
    install -Dm755 "PlasmaZones-$pkgver/packaging/arch/plasmazones-refresh-sycoca" \
        "$pkgdir/usr/share/libalpm/scripts/plasmazones-refresh-sycoca"
}
