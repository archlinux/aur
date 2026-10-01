# Maintainer: calmcrow <calmcrow@outlook.com>
#
# ============================================================
#  hypricons-bin — Third-party repackaging
# ============================================================
#  Installs the pre-built Arch package published in the upstream
#  GitHub release. Nothing is patched: the release artifact is
#  unpacked as-is, and only the upstream LICENSE is added, because
#  the upstream package (built with nfpm) ships no license file.
#
#  - Upstream:  https://github.com/Anabilsarker/HyprIcons
#  - Artifact:  hypricons-<pkgver>-1-x86_64.pkg.tar.zst (nfpm)
#  - Usage:     start it once per session from ~/.config/hypr/hyprland.lua:
#                 hl.on("hyprland.start", function() hl.exec_cmd("hypricons") end)
#
#  Upstream publishes no tagged source tarball, so this package
#  relies on the project's own release artifacts.

pkgname=hypricons-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Desktop icons for Hyprland (Wayland), drawn as a gtk4-layer-shell surface per monitor (pre-built binary)'
arch=('x86_64')
url='https://github.com/Anabilsarker/HyprIcons'
license=('GPL-2.0-only')
depends=('gtk4' 'gtk4-layer-shell')
provides=('hypricons')
conflicts=('hypricons' 'hypricons-git')
options=('!strip' '!debug')
install=hypricons-bin.install

_asset="hypricons-$pkgver-1-$CARCH.pkg.tar.zst"

source=("$_asset::https://github.com/Anabilsarker/HyprIcons/releases/download/v$pkgver/$_asset"
        "LICENSE::https://raw.githubusercontent.com/Anabilsarker/HyprIcons/v$pkgver/LICENSE"
        'hypricons.desktop')
noextract=("$_asset")
sha256sums=('a82112be9eb6cce9f48f4aedb92aa63b608ad0b8ed1f0ee5fed49ef04d781bd9' '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643' '9546437805a371e5c7402429b769c0e3a53262157b1cb96c70988ed419903f7e')

package() {
    bsdtar --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.BUILDINFO' --exclude='.INSTALL' \
        -xf "$srcdir/$_asset" -C "$pkgdir"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/hypricons.desktop" "$pkgdir/usr/share/applications/hypricons.desktop"
}
