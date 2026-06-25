# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for EmuDOS — repackages the official GitHub release tarball.
# Submit by pushing this (plus the generated .SRCINFO) to
#   ssh://aur@aur.archlinux.org/emudos-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=emudos-bin
pkgver=0.5.0
pkgrel=1
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

package() {
    install -dm755 "$pkgdir/usr/lib/emudos" "$pkgdir/usr/bin" \
                   "$pkgdir/usr/share/applications" \
                   "$pkgdir/usr/share/icons/hicolor/512x512/apps" \
                   "$pkgdir/usr/share/metainfo"
    # Install only the release-tarball payload into the app dir — NOT the AUR build's extra downloaded
    # sources (icon/metainfo/LICENSE), which are placed under /usr/share below.
    for item in EmuDOS *.so Assets README.txt; do
        [ -e "$srcdir/$item" ] && cp -a "$srcdir/$item" "$pkgdir/usr/lib/emudos/"
    done
    install -Dm644 "$srcdir/NOTICES.txt" "$pkgdir/usr/share/doc/$pkgname/NOTICES.txt"

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
