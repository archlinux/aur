# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for WadSmith: repackages the official GitHub release tarball.
# Submit by pushing this and the generated .SRCINFO (makepkg --printsrcinfo > .SRCINFO) to
#   ssh://aur@aur.archlinux.org/wadsmith-bin.git
pkgname=wadsmith-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Map editor for Doom, Heretic, Hexen and Strife, made for UZDoom and GZDoom"
arch=('x86_64')
url="https://github.com/codingncaffeine/WadSmith"
license=('GPL-3.0-or-later')
provides=('wadsmith')
conflicts=('wadsmith')
# The publish is self-contained (.NET, Skia and HarfBuzz are in the tarball). Avalonia draws through X11 or Wayland
# (libx11 + extensions, wayland + libxkbcommon), the 3D view through EGL/OpenGL (libglvnd); icu = .NET globalization.
depends=('fontconfig' 'freetype2' 'libglvnd' 'libx11' 'libxi' 'libxcursor' 'libxext' 'libxrandr' 'libxrender'
         'libice' 'libsm' 'wayland' 'libxkbcommon' 'icu' 'zlib')
optdepends=('uzdoom: play your maps (uzdoom-bin provides it; or the Flatpak org.zdoom.UZDoom)'
            'gzdoom: play your maps when UZDoom is not installed'
            'sdl2: an object'"'"'s sound when pointing at it on the shelf')
options=('!strip')   # a self-contained .NET bundle: stripping breaks it
source=("$url/releases/download/v$pkgver/WadSmith-$pkgver-linux-x64.tar.gz")
sha256sums=('2f42239da66088f1709d25e631cdd16fb6440a1667aa87f36bf7cd3db36d53fa')
# The tarball unpacks flat ("./"); stage it in its own folder so package() copies the payload wholesale.
noextract=("WadSmith-$pkgver-linux-x64.tar.gz")

prepare() {
    rm -rf "$srcdir/publish"
    mkdir -p "$srcdir/publish"
    bsdtar -xf "$srcdir/WadSmith-$pkgver-linux-x64.tar.gz" -C "$srcdir/publish"
}

package() {
    install -dm755 "$pkgdir/usr/lib/wadsmith" "$pkgdir/usr/bin"

    # Copy the WHOLE publish output, never a list of names: the payload is the apphost, ~200 managed assemblies, the
    # native libraries and the runtimeconfig/deps files, and a narrowed copy installs cleanly and fails at launch.
    cp -a "$srcdir/publish/." "$pkgdir/usr/lib/wadsmith/"
    rm -f "$pkgdir/usr/lib/wadsmith/"{README.txt,LICENSE,wadsmith.png}

    local _dlls _f
    _dlls=$(find "$pkgdir/usr/lib/wadsmith" -maxdepth 1 -name '*.dll' | wc -l)
    if (( _dlls < 150 )); then
        echo "==> ERROR: only $_dlls managed assemblies packaged (expected ~205)." >&2
        return 1
    fi
    for _f in wadsmith wadsmith.dll wadsmith-cli wadsmith-cli.dll WadSmith.Core.dll WadSmith.Editor.dll wadsmith.runtimeconfig.json wadsmith.deps.json libcoreclr.so libSkiaSharp.so; do
        if [[ ! -f "$pkgdir/usr/lib/wadsmith/$_f" ]]; then
            echo "==> ERROR: $_f is missing from the package payload." >&2
            return 1
        fi
    done

    cat > "$pkgdir/usr/bin/wadsmith" <<'WRAP'
#!/bin/sh
exec /usr/lib/wadsmith/wadsmith "$@"
WRAP
    cat > "$pkgdir/usr/bin/wadsmith-cli" <<'WRAP'
#!/bin/sh
exec /usr/lib/wadsmith/wadsmith-cli "$@"
WRAP
    chmod 755 "$pkgdir/usr/bin/wadsmith" "$pkgdir/usr/bin/wadsmith-cli"

    install -Dm644 "$srcdir/publish/wadsmith.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/wadsmith.png"
    install -Dm644 "$srcdir/publish/README.txt" "$pkgdir/usr/share/doc/wadsmith/README.txt"
    install -Dm644 "$srcdir/publish/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/io.github.codingncaffeine.WadSmith.desktop" <<'DESK'
[Desktop Entry]
Name=WadSmith
GenericName=Map Editor
Comment=Build maps for Doom, Heretic, Hexen and Strife, then play them in UZDoom or GZDoom
Exec=wadsmith %F
Icon=wadsmith
Terminal=false
Type=Application
Categories=Game;Development;
Keywords=doom;uzdoom;gzdoom;map;editor;wad;udmf;level;
StartupWMClass=wadsmith
DESK
}
