# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for Cheatmaster: repackages the official GitHub release tarball.
# Submit by pushing this and the generated .SRCINFO (makepkg --printsrcinfo > .SRCINFO) to
#   ssh://aur@aur.archlinux.org/cheatmaster-bin.git
pkgname=cheatmaster-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Memory scanner that works out how a game stores a number: find it, freeze it, keep it across restarts"
arch=('x86_64')
url="https://github.com/codingncaffeine/Cheatmaster"
license=('GPL-3.0-or-later')
provides=('cheatmaster')
conflicts=('cheatmaster')
# Self-contained .NET publish. Avalonia draws through X11; icu = .NET globalization.
depends=('glibc' 'gcc-libs' 'zlib' 'icu' 'fontconfig' 'freetype2' 'libglvnd'
         'libx11' 'libxext' 'libxi' 'libxrandr' 'libxcursor' 'libxrender' 'libice' 'libsm')
optdepends=('polkit: the one-click "Allow memory access" for games not started from Cheatmaster'
            'libsecret: keep the GitHub backup sign-in in the desktop keyring')
options=('!strip')   # a self-contained .NET bundle: stripping breaks it
source=("$url/releases/download/v$pkgver/Cheatmaster-$pkgver-linux-x64.tar.gz")
sha256sums=('d7e8ff5b3f3e69fb4b01bd3957ae05f7183723e9f9788f42878bb541637fcf99')
noextract=("Cheatmaster-$pkgver-linux-x64.tar.gz")

prepare() {
    rm -rf "${srcdir:?}/publish"
    mkdir -p "$srcdir/publish"
    bsdtar -xf "$srcdir/Cheatmaster-$pkgver-linux-x64.tar.gz" -C "$srcdir/publish"
}

package() {
    install -dm755 "$pkgdir/usr/lib/cheatmaster" "$pkgdir/usr/bin"
    # Copy the WHOLE publish output, never a list of names: a narrowed copy installs cleanly and fails at launch.
    cp -a "$srcdir/publish/." "$pkgdir/usr/lib/cheatmaster/"
    local _f
    for _f in README.txt LICENSE cheatmaster.png cheatmaster io.github.codingncaffeine.Cheatmaster.desktop; do
        rm -f "${pkgdir:?}/usr/lib/cheatmaster/$_f"
    done
    for _f in Cheatmaster Cheatmaster.dll Cheatmaster.Core.dll libcoreclr.so libSkiaSharp.so libHarfBuzzSharp.so; do
        [[ -f "$pkgdir/usr/lib/cheatmaster/$_f" ]] || { echo "==> ERROR: $_f is missing from the payload." >&2; return 1; }
    done
    printf '#!/bin/sh\nexec /usr/lib/cheatmaster/Cheatmaster "$@"\n' > "$pkgdir/usr/bin/cheatmaster"
    chmod 755 "$pkgdir/usr/bin/cheatmaster"

    install -Dm644 "$srcdir/publish/cheatmaster.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/cheatmaster.png"
    install -Dm644 "$srcdir/publish/io.github.codingncaffeine.Cheatmaster.desktop" \
        "$pkgdir/usr/share/applications/io.github.codingncaffeine.Cheatmaster.desktop"
    install -Dm644 "$srcdir/publish/README.txt" "$pkgdir/usr/share/doc/cheatmaster/README.txt"
    install -Dm644 "$srcdir/publish/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
