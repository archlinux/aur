# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for Driftwood — repackages the official GitHub release tarball.
# Submit by pushing this (plus the generated .SRCINFO) to ssh://aur@aur.archlinux.org/driftwood-game-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=driftwood-game-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Open-world survival crafting game: gather, build, explore, fight, trade and learn magic"
arch=('x86_64')
url="https://github.com/codingncaffeine/Driftwood"
license=('GPL-3.0-only')
provides=('driftwood-game')
conflicts=('driftwood-game')
# The release brings .NET, GLFW, OpenAL Soft and SDL3 with it; GLFW and SDL open the window-system
# and input libraries below at run time, and .NET needs ICU, OpenSSL (pack downloads) and zlib.
depends=('glibc' 'gcc-libs' 'zlib' 'icu' 'openssl'
         'libglvnd' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'libxext'
         'wayland' 'libxkbcommon' 'libpulse' 'systemd-libs' 'hicolor-icon-theme')
optdepends=('libdecor: window decorations on GNOME Wayland'
            'xdg-desktop-portal: the desktop file chooser for importing packs and skins'
            'zenity: a file chooser where no desktop portal is running')
options=('!strip')   # self-contained .NET single-file bundle — stripping breaks it
source_x86_64=("$url/releases/download/v$pkgver/Driftwood-v$pkgver-linux-x64.tar.gz")
# The release's own tarball, hashed when it was built (publish-release.sh writes the .sha256).
sha256sums_x86_64=('aeab03ce9ddc1dda3d2ba35c98705aa5a8a94bdc98071152ddc53d7a154c8c24')

package() {
    local id=io.github.codingncaffeine.Driftwood
    local src="$srcdir/Driftwood-v$pkgver-linux-x64"

    install -dm755 "$pkgdir/usr/lib/driftwood-game" "$pkgdir/usr/bin"
    install -m755 "$src/Driftwood" "$pkgdir/usr/lib/driftwood-game/Driftwood"
    install -m644 "$src"/lib*.so* "$pkgdir/usr/lib/driftwood-game/"
    ln -s /usr/lib/driftwood-game/Driftwood "$pkgdir/usr/bin/driftwood-game"

    # The tarball carries these for a player who unpacks it by hand and runs install.sh; here they
    # go where a package puts them. The entry already says Exec=driftwood-game.
    install -Dm644 "$src/$id.desktop" "$pkgdir/usr/share/applications/$id.desktop"
    install -Dm644 "$src/$id.metainfo.xml" "$pkgdir/usr/share/metainfo/$id.metainfo.xml"
    for size in 16 24 32 48 64 128 256; do
        install -Dm644 "$src/icons/hicolor/${size}x${size}/apps/$id.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$id.png"
    done
    install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
