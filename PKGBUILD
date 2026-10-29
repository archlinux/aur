# Maintainer: Caus <caus@ik.me>
# Maintainer: Felitendo
# Contributor: Cosmo <cptncosmo@gmail.com>

pkgname=fluxer-canary-bin
pkgver=2026.1026.22540
pkgrel=2
pkgdesc="Fluxer Canary Desktop Application"
arch=('x86_64' 'aarch64')
url="https://fluxer.app"
license=('AGPL-3.0-only')
# libpipewire and systemd-libs: two of the app's native modules link them
depends=('gtk3' 'nss' 'alsa-lib' 'libpipewire' 'systemd-libs')
options=('!strip')

# Upstream's .deb entry, with our paths. Its name is the app's desktopName:
# Wayland windows and fluxer:// links look the entry up by it.
source=("app.fluxer.FluxerDesktopCanary.desktop")
sha256sums=('51cd326b0e89ca07d9f54e901689ac4fa6792a3c520e9416ceb5e2c41ed0800f')

source_x86_64=("fluxer-canary-${pkgver}-x64.tar.gz::https://pkgs.fluxer.com/desktop/canary/linux/x64/${pkgver}/tar_gz")
sha256sums_x86_64=('a869b7dd808ecbf37b09e6369a38750fae13f5a30b2e56665f6e387ca06baf84')

source_aarch64=("fluxer-canary-${pkgver}-arm64.tar.gz::https://pkgs.fluxer.com/desktop/canary/linux/arm64/${pkgver}/tar_gz")
sha256sums_aarch64=('1e752109301de4ba955ad92dcbe9d7d1063518a9917b087b7f33c95719ddf73e')

package() {
    local _dir
    case "$CARCH" in
        x86_64)  _dir="Fluxer-Canary-${pkgver}-linux-x64" ;;
        aarch64) _dir="Fluxer-Canary-${pkgver}-linux-arm64" ;;
    esac
    # upstream has changed the archive layout before, so fall back to a glob
    if [ ! -d "$srcdir/$_dir" ]; then
        _dir=$(cd "$srcdir" && ls -d [Ff]luxer*[Cc]anary*"${pkgver}"*/ 2>/dev/null | head -n1)
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
    ln -s "/opt/$pkgname/fluxer-canary" "$pkgdir/usr/bin/fluxer-canary"

    install -Dm644 "$srcdir/app.fluxer.FluxerDesktopCanary.desktop" \
        -t "$pkgdir/usr/share/applications"

    # Take the sized icons (128x128.png, ...) and skip icon.png and the
    # tray templates. A miss would leave the .desktop entry without an icon.
    local _icon _size _found=0
    for _icon in "$srcdir/$_dir"/resources/icons/[0-9]*x[0-9]*.png; do
        [ -f "$_icon" ] || continue
        _size="$(basename "$_icon" .png)"
        install -Dm644 "$_icon" \
            "$pkgdir/usr/share/icons/hicolor/$_size/apps/fluxer-canary.png"
        _found=1
    done
    if [ "$_found" -eq 0 ]; then
        echo "Error: no icons in $_dir/resources/icons" >&2
        ls -la "$srcdir/$_dir/resources" >&2
        return 1
    fi
}
