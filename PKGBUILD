# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for Emutastic — repackages the official GitHub release tarball.
# Submit by pushing this (plus the generated .SRCINFO) to ssh://aur@aur.archlinux.org/emutastic-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=emutastic-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Beautiful retro game library and emulation frontend (libretro)"
arch=('x86_64')
url="https://github.com/codingncaffeine/Emutastic-For-Linux"
license=('GPL-3.0-only')
provides=('emutastic')
conflicts=('emutastic')
# libvlc = snap video previews (degrades gracefully without); ffmpeg = recording;
# sdl3 = gamepads + audio. The publish is otherwise self-contained (.NET bundled).
# vlc-plugin-ffmpeg: snap previews need the avcodec plugin — Arch splits it out of the
# base plugins, and without it LibVLC h264 decode (every snap video) is unavailable.
depends=('libvlc' 'vlc-plugins-base' 'vlc-plugin-ffmpeg' 'ffmpeg' 'sdl3' 'fontconfig')
optdepends=('vlc-plugins-video-output: hardware-accelerated snap previews on some setups')
options=('!strip')   # self-contained .NET bundle — stripping breaks it
# The icon ships INSIDE the .dll as an Avalonia resource (not loose in the publish
# tarball), so fetch it from the repo at the tag — same as LICENSE. %20 = the space
# in the "banners and icons" path.
source=("$url/releases/download/v$pkgver/Emutastic-$pkgver-linux-x64.tar.gz"
        "$url/raw/v$pkgver/LICENSE"
        "emutastic-logo.png::$url/raw/v$pkgver/src/Emutastic/Assets/banners%20and%20icons/emutastic-logo.png")
sha256sums=('f908687ae6eae74c132b9ccf94accdc4b57f034e12160eafc201a4c6a20fa4c0'
            'SKIP'
            'SKIP')

package() {
    install -dm755 "$pkgdir/usr/lib/emutastic" "$pkgdir/usr/bin" \
                   "$pkgdir/usr/share/applications" \
                   "$pkgdir/usr/share/icons/hicolor/512x512/apps" \
                   "$pkgdir/usr/share/metainfo"
    cp -a "$srcdir"/{Emutastic,*.so,Assets,README.txt} "$pkgdir/usr/lib/emutastic/" 2>/dev/null || \
        cp -a "$srcdir"/. "$pkgdir/usr/lib/emutastic/"

    cat > "$pkgdir/usr/bin/emutastic" <<'EOF'
#!/bin/sh
exec /usr/lib/emutastic/Emutastic "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/emutastic"

    install -Dm644 "$srcdir/emutastic-logo.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/emutastic.png"

    cat > "$pkgdir/usr/share/applications/emutastic.desktop" <<'EOF'
[Desktop Entry]
Name=Emutastic
Comment=Retro game library and emulation frontend
Exec=emutastic
Icon=emutastic
Terminal=false
Type=Application
Categories=Game;Emulator;
EOF

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
