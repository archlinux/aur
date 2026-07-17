# Maintainer: Felitendo
# Contributor: Cosmo <cptncosmo@gmail.com>
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=fluxer-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="Fluxer Desktop Application"
arch=('x86_64' 'aarch64')
url="https://fluxer.app"
license=('AGPL-3.0-only')
depends=('gtk3' 'nss' 'alsa-lib')
options=('!strip')

source=("fluxer.desktop")
sha256sums=('981daa8015b823fef254bb8e79fe6b28f77dda02cdc374796443bd64f5041de1')

source_x86_64=("fluxer-${pkgver}-x64.tar.gz::https://api.fluxer.app/dl/desktop/stable/linux/x64/${pkgver}/tar_gz")
sha256sums_x86_64=('acf6398fa6810720fed85b06c011b324e7db4fec6bf2fc7ad93c2446c3600f2d')

source_aarch64=("fluxer-${pkgver}-arm64.tar.gz::https://api.fluxer.app/dl/desktop/stable/linux/arm64/${pkgver}/tar_gz")
sha256sums_aarch64=('77b874a98caf48de5bc4ccf03119f45262fe26fd7be085b57d7b40b1505d0ec8')

package() {
    local _dir
    case "$CARCH" in
        x86_64)  _dir="fluxer-stable-${pkgver}-x64" ;;
        aarch64) _dir="fluxer-stable-${pkgver}-arm64" ;;
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

    if [ -f "$pkgdir/opt/$pkgname/resources/512x512.png" ]; then
        install -Dm644 "$pkgdir/opt/$pkgname/resources/512x512.png" \
            "$pkgdir/usr/share/icons/hicolor/512x512/apps/fluxer.png"
    fi
}
