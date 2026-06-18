# Maintainer: fuddlesworth <fuddlesworth at users dot noreply dot github dot com>
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=plasmazones-bin
# pkgver/pkgrel are placeholders; CI overwrites them with the release tag
# before publishing. See packaging/arch/update-aur.sh.
pkgver=3.0.16
pkgrel=1
pkgdesc='Window tiling and autotiling for KDE Plasma (binary)'
arch=('x86_64')
url='https://github.com/fuddlesworth/PlasmaZones'
# Dual-licensed: the main daemon + KCM + editor are GPL-3.0-or-later; the
# bundled Phosphor component shared libraries are LGPL-2.1-or-later. The
# binary tarball contains all of them so both licenses apply to this
# package.
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later')

# Exact KWin upstream version this binary was built against. The kwin-effect
# plugin's IID embeds KWin's exact upstream version string; KWin refuses to
# load effects whose IID doesn't match its own version, including across patch
# bumps (e.g. 6.7.0 -> 6.7.1). CI substitutes this value at release time from
# the build-host's installed kwin (see .github/workflows/release.yml).
_kwin_ver=6.7.0

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
    "kwin=${_kwin_ver}"
)
optdepends=(
    'plasma-activities: activity-based layouts'
)
provides=('plasmazones')
conflicts=('plasmazones' 'plasmazones-git')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/plasmazones-$pkgver-linux-x86_64.tar.gz")
sha256sums=('3fee71b4ba826a250cf58bd3fd7b593cec3eef332581d8a05e1a7d2b0a523c6c')
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
