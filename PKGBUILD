# Maintainer: fuddlesworth <fuddlesworth at users dot noreply dot github dot com>
# SPDX-FileCopyrightText: 2026 fuddlesworth
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Requires Plasma 6.7+ (KF6 6.26, Qt 6.10, KWin 6.7).

pkgname=plasmazones
# pkgver/pkgrel are placeholders; CI rewrites them against the release tag
# before publishing. See packaging/arch/update-aur.sh.
pkgver=3.2.5
pkgrel=1
pkgdesc='Window tiling and autotiling for KDE Plasma'
arch=('x86_64')
url='https://github.com/fuddlesworth/PlasmaZones'
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later')

# KWin: minimum version, NOT an exact pin. The kwin-effect plugin's IID embeds
# KWin's exact upstream version string and KWin refuses to load an effect whose
# IID doesn't match its own version (even across patch bumps, e.g. 6.7.0 ->
# 6.7.1). An exact `kwin=<ver>` pin, however, makes pacman hold KWin back on
# -Syu whenever a newer KWin lands before this package is rebuilt, stranding the
# desktop in a half-upgraded Plasma ("No KScreen backend found", black screen).
# A mismatched effect is harmless — KWin reads the IID from plugin metadata and
# never loads a non-matching effect, so the .so stays inert; only the drag
# overlay is missing until a rebuild. Core tiling runs in the daemon +
# layer-shell QPA plugin and is independent of the effect.
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
    'kwin>=6.7.0'
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
# 'SKIP' so local `makepkg -p PKGBUILD` doesn't fail integrity-check
# on the placeholder pkgver. release.yml templates a real sha256 when
# publishing to AUR (see the awk rewrite in the publish-aur job).
sha256sums=('520a959b4079225a928b7d7969f95ca6e301b404c26f5d4681d5d19e271a6017')
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

    # License files — GPL-3.0-or-later (main) + LGPL-2.1-or-later (the
    # bundled Phosphor component libraries). The `license=()` array
    # above declares both; both files must be shipped under
    # /usr/share/licenses.
    install -Dm644 "PlasmaZones-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "PlasmaZones-$pkgver/COPYING.LESSER" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING.LESSER"

    # `cmake --install` above also installs every Phosphor component
    # shared library plus its CMake config and headers into /usr/lib
    # and /usr/include. No separate -devel package is produced; they
    # ship bundled with the main package.
}
