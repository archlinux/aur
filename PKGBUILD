# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for EmuDOS — repackages the official GitHub release tarball.
# Submit by pushing this (plus the generated .SRCINFO) to
#   ssh://aur@aur.archlinux.org/emudos-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=emudos-bin
pkgver=0.5.0
pkgrel=2
pkgdesc="A beautiful frontend for your classic DOS games (DOSBox Pure libretro)"
arch=('x86_64')
url="https://github.com/codingncaffeine/EmuDOS-For-Linux"
license=('GPL-3.0-only')
provides=('emudos')
conflicts=('emudos')
# Complete runtime set (verified against the live process's loaded libraries). The publish is
# otherwise self-contained: .NET, the MT-32 shim and the librashader CRT runtime are bundled in the
# tarball. sdl3 = gamepads/audio; libglvnd provides libGL/libEGL (shaders + 3dfx); the X libs are the
# Avalonia surface; icu = .NET globalization; dbus/systemd-libs = desktop + udev (gamepad hotplug).
depends=('sdl3' 'fontconfig' 'libglvnd' 'libx11' 'libxi' 'libxcursor' 'libxext'
         'libxrandr' 'libxrender' 'libxfixes' 'icu' 'dbus' 'systemd-libs')
optdepends=('vlc: video snap previews on game cards'
            'ffmpeg: gameplay recording (also downloadable in-app)'
            'libisoburn: build ISO disc images from a folder (xorriso)')
options=('!strip')   # self-contained .NET bundle — stripping breaks it
# The icon ships loose in the tarball as a bundled asset only via the build; pull it
# from the repo at the tag instead, same as LICENSE.
source=("$url/releases/download/v$pkgver/EmuDOS-$pkgver-linux-x64.tar.gz"
        "$url/raw/v$pkgver/LICENSE"
        "emudos-linux.png::$url/raw/v$pkgver/src/EmuDOS/Assets/emudos-linux.png"
        "io.github.codingncaffeine.EmuDOS.metainfo.xml::$url/raw/v$pkgver/packaging/io.github.codingncaffeine.EmuDOS.metainfo.xml")
sha256sums=('74ca733b3338d401a7f8264a3c4b691cf0747d28f1cba2d1793e87c134587cc4'
            'SKIP'
            'SKIP'
            'SKIP')
# The release tarball unpacks flat (top-level "./") and carries its own LICENSE, so extracting it in
# $srcdir mixes the publish payload with the loose sources above. Stage it in its own directory
# instead: package() then copies the payload wholesale, and no AUR build source reaches the app dir.
noextract=("EmuDOS-$pkgver-linux-x64.tar.gz")

prepare() {
    rm -rf "$srcdir/publish"
    mkdir -p "$srcdir/publish"
    bsdtar -xf "$srcdir/EmuDOS-$pkgver-linux-x64.tar.gz" -C "$srcdir/publish"
}

package() {
    install -dm755 "$pkgdir/usr/lib/emudos" "$pkgdir/usr/bin" \
                   "$pkgdir/usr/share/applications" \
                   "$pkgdir/usr/share/icons/hicolor/512x512/apps" \
                   "$pkgdir/usr/share/metainfo"

    # Copy the entire publish output. Do NOT narrow this to a list of names: the app is a
    # self-contained .NET publish whose payload is the apphost, ~200 managed assemblies, the native
    # .so set and the runtimeconfig/deps JSON. 0.5.0-1 copied {EmuDOS,*.so,Assets,README.txt}, which
    # dropped every assembly: it installed cleanly, then failed at launch with
    # "The application to execute does not exist: '/usr/lib/emudos/EmuDOS.dll'".
    cp -a "$srcdir/publish/." "$pkgdir/usr/lib/emudos/"

    # Guard the copy above; nothing in the build or install path notices a missing assembly.
    local _dlls _f
    _dlls=$(find "$pkgdir/usr/lib/emudos" -maxdepth 1 -name '*.dll' | wc -l)
    if (( _dlls < 150 )); then
        echo "==> ERROR: only $_dlls managed assemblies packaged (expected ~206)." >&2
        return 1
    fi
    for _f in EmuDOS EmuDOS.dll EmuDOS.runtimeconfig.json EmuDOS.deps.json libcoreclr.so libhostfxr.so; do
        if [[ ! -f "$pkgdir/usr/lib/emudos/$_f" ]]; then
            echo "==> ERROR: $_f is missing from the package payload." >&2
            return 1
        fi
    done

    install -Dm644 "$srcdir/publish/NOTICES.txt" "$pkgdir/usr/share/doc/$pkgname/NOTICES.txt"

    cat > "$pkgdir/usr/bin/emudos" <<'EOF'
#!/bin/sh
exec /usr/lib/emudos/EmuDOS "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/emudos"

    install -Dm644 "$srcdir/emudos-linux.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/emudos.png"
    install -Dm644 "$srcdir/io.github.codingncaffeine.EmuDOS.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/io.github.codingncaffeine.EmuDOS.metainfo.xml"

    cat > "$pkgdir/usr/share/applications/io.github.codingncaffeine.EmuDOS.desktop" <<'EOF'
[Desktop Entry]
Name=EmuDOS
Comment=A beautiful frontend for your classic DOS games
Exec=emudos
Icon=emudos
Terminal=false
Type=Application
Categories=Game;Emulator;
EOF

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
