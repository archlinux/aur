# Maintainer: fuddlesworth
# PlasmaZones - FancyZones-style window tiling for KDE Plasma
# SPDX-License-Identifier: GPL-3.0-or-later
#
# pkgver is set by CI from the git tag when building in the release workflow.
# For local/AUR builds, update pkgver and sha256sums to match the release tarball.

pkgname=plasmazones
pkgver=0.0.0
pkgrel=1
pkgdesc="FancyZones-style window tiling for KDE Plasma"
arch=('x86_64')
url="https://github.com/fuddlesworth/PlasmaZones"
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-shadertools'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'kdbusaddons'
    'ki18n'
    'kcmutils'
    'kwindowsystem'
    'kglobalaccel'
    'knotifications'
    'kcolorscheme'
    'layer-shell-qt'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'qt6-tools'
    'qt6-shadertools'
)
optdepends=(
    'plasma-activities: activity-based layouts'
)
provides=('plasmazones')
conflicts=('plasmazones-git')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "kbuildsycoca.hook"
    "plasmazones-refresh-sycoca"
)
sha256sums=(
    '1836cc5877937666e1b139a4219d3a7cbf124551abc211e8ede5b09907403ae8'
    '8bd1b7fe1ca040f18fc0aa95f5da775cdbc1b090a23f63d8e16dd572cbba3c80'
    'f128058da53fd97e6a35718348fefa219b6352517bd13f6a1039368872cb0b6d'
)
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
    install -Dm644 kbuildsycoca.hook \
        "$pkgdir/usr/share/libalpm/hooks/plasmazones-kbuildsycoca.hook"
    install -Dm755 plasmazones-refresh-sycoca \
        "$pkgdir/usr/share/libalpm/scripts/plasmazones-refresh-sycoca"
}
