# Maintainer: Felitendo
# Contributor: Cosmo <cptncosmo@gmail.com>
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=fluxer-bin
# Upstream versions are date-based: this is the build of 2026-09-20 at
# 04:13:03 UTC. They sort above the 0.0.x scheme the package used before.
pkgver=2026.925.141246
pkgrel=1
pkgdesc="Fluxer Desktop Application"
arch=('x86_64' 'aarch64')
url="https://fluxer.app"
license=('AGPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib')
# /usr/bin/fluxer is also installed by fluxer-git on the AUR and by the
# "fluxer" package in upstream's own pacman repository:
# provides/conflicts makes that an either/or instead of a file conflict
provides=('fluxer')
conflicts=('fluxer')
options=('!strip')

source=("fluxer.desktop")
sha256sums=('981daa8015b823fef254bb8e79fe6b28f77dda02cdc374796443bd64f5041de1')

source_x86_64=("fluxer-${pkgver}-x64.tar.gz::https://api.fluxer.app/dl/desktop/stable/linux/x64/${pkgver}/tar_gz")
sha256sums_x86_64=('8d3f27b663a0dad03b8c4e0e91e47e7e69958e79f22602189e33758e27613ab5')

source_aarch64=("fluxer-${pkgver}-arm64.tar.gz::https://api.fluxer.app/dl/desktop/stable/linux/arm64/${pkgver}/tar_gz")
sha256sums_aarch64=('78c72ca0f49ccc2f2bc2c4c92c6bba83670e35b4b130f2224b12738c4377f149')

package() {
    local _dir
    case "$CARCH" in
        x86_64)  _dir="Fluxer-${pkgver}-linux-x64" ;;
        aarch64) _dir="Fluxer-${pkgver}-linux-arm64" ;;
    esac
    # upstream has changed the archive layout before - fall back to a glob
    if [ ! -d "$srcdir/$_dir" ]; then
        _dir=$(cd "$srcdir" && ls -d [Ff]luxer*"${pkgver}"*/ 2>/dev/null | head -n1)
        _dir="${_dir%/}"
    fi
    if [ -z "$_dir" ] || [ ! -d "$srcdir/$_dir" ]; then
        echo "Error: could not find extracted directory for $CARCH" >&2
        ls -la "$srcdir" >&2
        return 1
    fi

    install -d "$pkgdir/opt/$pkgname"
    cp -a "$srcdir/$_dir/." "$pkgdir/opt/$pkgname/"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/fluxer" "$pkgdir/usr/bin/fluxer"

    install -Dm644 "$srcdir/fluxer.desktop" "$pkgdir/usr/share/applications/fluxer.desktop"

    # The bundle carries a full icon set, named after the size it holds.
    # The glob takes those and leaves icon.png and the tray templates, which
    # carry no size, alone.
    local _icon _size _found=0
    for _icon in "$srcdir/$_dir"/resources/icons/[0-9]*x[0-9]*.png; do
        [ -f "$_icon" ] || continue
        _size="$(basename "$_icon" .png)"
        install -Dm644 "$_icon" \
            "$pkgdir/usr/share/icons/hicolor/$_size/apps/fluxer.png"
        _found=1
    done
    # the .desktop entry points at this icon, so a silent miss would ship a
    # window with no icon at all
    if [ "$_found" -eq 0 ]; then
        echo "Error: no icons in $_dir/resources/icons" >&2
        ls -la "$srcdir/$_dir/resources" >&2
        return 1
    fi
}
