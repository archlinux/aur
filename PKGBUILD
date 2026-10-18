# Maintainer: Caus <caus@ik.me>
# Maintainer: Felitendo
# Contributor: Cosmo <cptncosmo@gmail.com>

pkgname=fluxer-canary-bin
pkgver=2026.1018.133614
pkgrel=1
pkgdesc="Fluxer Canary Desktop Application"
arch=('x86_64' 'aarch64')
url="https://fluxer.app"
license=('AGPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib')
options=('!strip')

source=("fluxer-canary.desktop")
sha256sums=('0435d76ef93c99abd3f772984aa4d535149900c3a810ffba1676f3a4c98134ac')

source_x86_64=("fluxer-canary-${pkgver}-x64.tar.gz::https://pkgs.fluxer.com/desktop/canary/linux/x64/${pkgver}/tar_gz")
sha256sums_x86_64=('edb7f7622c75698d8b7e0b51c4103707f1c4d30c91976eef6086075a49ba3116')

source_aarch64=("fluxer-canary-${pkgver}-arm64.tar.gz::https://pkgs.fluxer.com/desktop/canary/linux/arm64/${pkgver}/tar_gz")
sha256sums_aarch64=('6efb42041b4d81a7ddfeb88b479eee12e2c3783905f34d003c17b0328b45a31b')

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

    install -Dm644 "$srcdir/fluxer-canary.desktop" \
        "$pkgdir/usr/share/applications/fluxer-canary.desktop"

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
