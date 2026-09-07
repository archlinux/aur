# Maintainer: codingncaffeine <codingncaffeine@users.noreply.github.com>
# AUR binary package for Emutastic — repackages the official GitHub release tarball.
# Submit by pushing this (plus the generated .SRCINFO) to ssh://aur@aur.archlinux.org/emutastic-bin.git
#   makepkg --printsrcinfo > .SRCINFO
pkgname=emutastic-bin
pkgver=0.9.3
pkgrel=2
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
sha256sums=('3b7e9651fec007171c240892196db11e22a12151fbdc22b2c2efb0ba986a6470'
            'SKIP'
            'SKIP')
# The release tarball unpacks flat (top-level "./"), which would mix the publish
# payload with the two loose sources above. Stage it in its own directory instead so
# package() can copy the payload wholesale rather than by an allow-list of names.
noextract=("Emutastic-$pkgver-linux-x64.tar.gz")

prepare() {
    rm -rf "$srcdir/publish"
    mkdir -p "$srcdir/publish"
    bsdtar -xf "$srcdir/Emutastic-$pkgver-linux-x64.tar.gz" -C "$srcdir/publish"
}

package() {
    install -dm755 "$pkgdir/usr/lib/emutastic" "$pkgdir/usr/bin" \
                   "$pkgdir/usr/share/applications" \
                   "$pkgdir/usr/share/icons/hicolor/512x512/apps"

    # Copy the entire publish output. Do NOT narrow this to a list of names: the app
    # is a self-contained .NET publish whose payload is the apphost, ~218 managed
    # assemblies, the native .so set, and the runtimeconfig/deps JSON — omitting any
    # of it yields a package that installs cleanly and then dies at launch.
    cp -a "$srcdir/publish/." "$pkgdir/usr/lib/emutastic/"

    # Guard the above. 0.8.0-0.9.3-1 shipped without a single managed assembly and
    # nothing in the build or install path noticed; only launching the app did.
    local _dlls
    _dlls=$(find "$pkgdir/usr/lib/emutastic" -maxdepth 1 -name '*.dll' | wc -l)
    if [[ ! -f "$pkgdir/usr/lib/emutastic/Emutastic.dll" ]]; then
        echo "==> ERROR: Emutastic.dll is missing from the package payload." >&2
        return 1
    fi
    if (( _dlls < 150 )); then
        echo "==> ERROR: only $_dlls managed assemblies packaged (expected ~218)." >&2
        return 1
    fi
    for _f in Emutastic Emutastic.runtimeconfig.json Emutastic.deps.json libcoreclr.so libhostfxr.so; do
        if [[ ! -f "$pkgdir/usr/lib/emutastic/$_f" ]]; then
            echo "==> ERROR: $_f is missing from the package payload." >&2
            return 1
        fi
    done

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
