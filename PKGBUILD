# Maintainer: fuddlesworth
# PlasmaZones (binary) - FancyZones-style window tiling for KDE Plasma
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Binary package - downloads prebuilt binaries from GitHub releases.
# For source-based package, see: https://aur.archlinux.org/packages/plasmazones

pkgname=plasmazones-bin
pkgver=1.3.4
pkgrel=1
pkgdesc="FancyZones-style window tiling for KDE Plasma (prebuilt binary)"
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
optdepends=(
    'plasma-activities: activity-based layouts'
)
provides=('plasmazones')
conflicts=('plasmazones' 'plasmazones-git')
source=(
    "$pkgname-$pkgver.pkg.tar.zst::$url/releases/download/v$pkgver/plasmazones-$pkgver-1-x86_64.pkg.tar.zst"
    "kbuildsycoca.hook"
    "plasmazones-refresh-sycoca"
)
sha256sums=(
    'f21bf6aa1ffa6f0d5d59ad3bd1f6a8b0b54227ce482446e502ff67c0a7cf4e29'
    '8bd1b7fe1ca040f18fc0aa95f5da775cdbc1b090a23f63d8e16dd572cbba3c80'
    'f128058da53fd97e6a35718348fefa219b6352517bd13f6a1039368872cb0b6d'
)
install=plasmazones.install

package() {
    # Extract the prebuilt Arch package directly into $pkgdir
    # The .pkg.tar.zst contains the filesystem layout ready to install
    bsdtar -xf "$srcdir/$pkgname-$pkgver.pkg.tar.zst" -C "$pkgdir"

    # Remove pacman metadata (not needed when repackaging)
    rm -rf "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"

    # Install pacman hook to auto-refresh sycoca cache
    install -Dm644 "$srcdir/kbuildsycoca.hook" \
        "$pkgdir/usr/share/libalpm/hooks/plasmazones-kbuildsycoca.hook"
    install -Dm755 "$srcdir/plasmazones-refresh-sycoca" \
        "$pkgdir/usr/share/libalpm/scripts/plasmazones-refresh-sycoca"
}
