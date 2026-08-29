# Maintainer: fuddlesworth <fuddlesworth at users dot noreply dot github dot com>
# SPDX-FileCopyrightText: 2026 fuddlesworth
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=plasmazones-bin
# pkgver/pkgrel are placeholders; CI overwrites them with the release tag
# before publishing. See packaging/arch/update-aur.sh.
pkgver=3.4.3
pkgrel=1
pkgdesc='Window snapping, tiling and scrolling for KDE Plasma (binary)'
arch=('x86_64')
url='https://github.com/fuddlesworth/PlasmaZones'
# Dual-licensed: the main daemon + KCM + editor are GPL-3.0-or-later; the
# bundled Phosphor component shared libraries are LGPL-2.1-or-later. The
# binary tarball contains all of them so both licenses apply to this
# package.
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later')

# KWin: minimum version, NOT an exact pin. The kwin-effect plugin's IID embeds
# KWin's exact upstream version string and KWin refuses to load an effect whose
# IID doesn't match its own version (even across patch bumps, e.g. 6.7.0 ->
# 6.7.1). An exact `kwin=<ver>` pin, however, makes pacman hold KWin back on
# -Syu whenever a newer KWin lands before this package is rebuilt, stranding the
# desktop in a half-upgraded Plasma ("No KScreen backend found", black screen).
# This prebuilt's effect therefore only *loads* on systems running the exact
# KWin it was built against; on any other 6.7+ KWin the package still installs
# and core tiling (daemon + layer-shell QPA plugin) works — KWin just skips the
# mismatched effect (the .so is inert, never loaded), so only the drag overlay
# is missing until a matching rebuild.
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
    'kcolorscheme'
    'qt6-wayland'
    'kwin>=6.7.0'
)
optdepends=(
    'plasma-activities: activity-based layouts'
    'hwdata: readable GPU names in the rendering device picker'
)
provides=('plasmazones')
conflicts=('plasmazones' 'plasmazones-git')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/plasmazones-$pkgver-linux-x86_64.tar.gz")
sha256sums=('ea1ca03052653086ffe3a1b4f15eae14195c76e044152375ebd6b040bf2fa89c')
install=plasmazones.install

package() {
    # Release tarball contains the full install prefix, including every
    # Phosphor component shared library, the CMake configs, and the
    # headers — a straight copy preserves them.
    cp -a "$srcdir/plasmazones-linux-x86_64/usr" "$pkgdir/usr"

    # License files — GPL-3.0-or-later (main) + LGPL-2.1-or-later (the
    # bundled Phosphor component libraries). The release tarball carries
    # both at its root, so install from there rather than assuming they
    # exist in $srcdir.
    install -Dm644 "$srcdir/plasmazones-linux-x86_64/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/plasmazones-linux-x86_64/COPYING.LESSER" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING.LESSER"
}
