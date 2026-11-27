pkgname=thps2x-recompiled-bin
pkgver=2.0.2
pkgrel=2
pkgdesc="Native static recompilation and launcher for Tony  Hawk's Pro Skater 2X (Xbox, USA)"
arch=('x86_64')
url='https://github.com/almost-drowned-rat/THPS2X-Recompiled'
license=('GPL-3.0-or-later' 'MIT' 'LGPL-2.1-or-later')
depends=('glibc' 'vulkan-icd-loader' 'vulkan-driver')
optdepends=('zenity: disc image picker when a desktop portal is unavailable'
            'xdg-desktop-portal: native disc image picker with a desktop portal backend')
options=('staticlibs' '!strip' '!debug')
source=("${url}/releases/download/v${pkgver}/THPS2X-Recompiled-v${pkgver}-Linux-x86_64.tar.gz")
sha256sums=('5a3b2ecc1295b5a147f5e731e877f637803de4761101ba23b5733bbba9c8f575')

package() {
    cd "THPS2X_Recompiled-${pkgver}-Linux-x86_64"

    local appdir="$pkgdir/usr/lib/thps2x-recompiled"
    install -d "$appdir" "$pkgdir/usr/bin"
    cp -a --no-preserve=ownership app/usr "$appdir/"
    # The tarball ships its private directories with mode 0700.
    find "$appdir" -type d -exec chmod 755 {} +

    install -Dm644 app/thps2x-recomp.desktop \
        "$pkgdir/usr/share/applications/thps2x-recomp.desktop"
    install -Dm644 app/thps2x-recomp.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/thps2x-recomp.png"
    install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /usr/lib/thps2x-recompiled/usr/share/thps2x-recomp/tools/licenses \
        "$pkgdir/usr/share/licenses/$pkgname/upstream"

    cat > "$pkgdir/usr/bin/thps2x-recomp" <<'LAUNCHER'
#!/bin/sh
set -eu

data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/thps2x-recompiled"
export APPDIR=/usr/lib/thps2x-recompiled
export APPIMAGE="$data_dir/thps2x_launcher"

# Upstream uses dirname(APPIMAGE) for game data and APPIMAGE for restarts.
mkdir -p -- "$data_dir"
if [ ! -e "$APPIMAGE" ] && [ ! -L "$APPIMAGE" ]; then
    ln -s -- /usr/bin/thps2x-recomp "$APPIMAGE" || [ -L "$APPIMAGE" ]
fi
exec "$APPDIR/usr/bin/thps2x-recomp" "$@"
LAUNCHER
    chmod 755 "$pkgdir/usr/bin/thps2x-recomp"
}
