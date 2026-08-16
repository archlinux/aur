# Maintainer: Frédéric Bogaerts <fred@netpack.pt>
pkgname=xfb
# pacman compares the dot-separated segments as integers, not as decimals, so
# 3.14159 outranks 3.1416 (14159 > 1416) and every rounded release looks like a
# downgrade. The epoch overrides that comparison. It must never be removed or
# lowered: dropping it would make the next release look older than this one to
# every machine that installed it. Raise it only if the version ever has to go
# backwards again.
epoch=1
pkgver=3.1419
pkgrel=1
pkgdesc="Open-source Radio Automation with comprehensive accessibility support"
arch=('x86_64' 'aarch64')
url="https://github.com/netpack/XFB"
license=('GPL3')
depends=(
    'qt6-base'
    'qt6-multimedia'
    'qt6-webengine'
    'qt6-declarative'
    'at-spi2-core'
    'speech-dispatcher'
    'alsa-lib'
    'libpulse'
    'sqlite'
    'curl'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'perl-image-exiftool'
    'ffmpeg'
)
makedepends=(
    'cmake'
    'git'
    'pkg-config'
)
install=xfb.install
optdepends=(
    'orca: Screen reader support for visually impaired users'
    'brltty: Braille display support'
    'espeak-ng: Text-to-speech synthesis'
    'audacity: Advanced audio editing'
    'mediainfo: Track metadata lookups'
    'mplayer: Media player'
    'soundconverter: Audio converter'
    'yt-dlp: Download media from online sources'
    'lame: MP3 encoding'
    'sox: Audio processing'
    'flac: FLAC audio support'
    'vorbis-tools: OGG Vorbis support'
    'mp3gain: MP3 volume normalization'
    'normalize: Audio normalization'
    'wavpack: WavPack audio support'
    'opus-tools: Opus audio support'
    'mediainfo: Media file information'
)
source=("git+https://github.com/netpack/XFB.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/XFB"
    
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCPACK_GENERATOR="" \
        -DBUILD_TESTING=OFF
    
    cmake --build build
}

package() {
    cd "$srcdir/XFB"
    
    # Create necessary directories
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/etc/xfb"
    install -d "$pkgdir/usr/share/xfb"
    install -d "$pkgdir/usr/share/xfb/bin"
    install -d "$pkgdir/usr/share/xfb/config"
    install -d "$pkgdir/usr/share/xfb/scripts"
    install -d "$pkgdir/usr/share/xfb/jingles"
    install -d "$pkgdir/usr/share/xfb/music"
    install -d "$pkgdir/usr/share/xfb/playlists"
    install -d "$pkgdir/usr/share/xfb/recordings"
    install -d "$pkgdir/usr/share/xfb/tmp"
    install -d "$pkgdir/usr/share/xfb/ftp"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/pixmaps"
    
    # Install the main executable
    install -Dm755 "build/bin/XFB" "$pkgdir/usr/share/xfb/bin/XFB"
    
    # Create symbolic link in /usr/bin
    ln -s "/usr/share/xfb/bin/XFB" "$pkgdir/usr/bin/XFB"
    
    # Install desktop file
    install -Dm644 "XFB.desktop" "$pkgdir/usr/share/applications/XFB.desktop"
    
    # Install icons. The hicolor set (preferred by modern desktops) and the
    # pixmaps fallback both come from XFB.iconset / the SVG source, whose
    # backgrounds are transparent (the root xfb_icon.png was flattened onto
    # white in tags up to v3.14159; the iconset is also the crisper source).
    install -Dm644 "XFB.iconset/icon_16x16.png"    "$pkgdir/usr/share/icons/hicolor/16x16/apps/xfb_icon.png"
    install -Dm644 "XFB.iconset/icon_32x32.png"    "$pkgdir/usr/share/icons/hicolor/32x32/apps/xfb_icon.png"
    install -Dm644 "XFB.iconset/icon_32x32@2x.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/xfb_icon.png"
    install -Dm644 "XFB.iconset/icon_128x128.png"  "$pkgdir/usr/share/icons/hicolor/128x128/apps/xfb_icon.png"
    install -Dm644 "XFB.iconset/icon_256x256.png"  "$pkgdir/usr/share/icons/hicolor/256x256/apps/xfb_icon.png"
    install -Dm644 "XFB.iconset/icon_512x512.png"  "$pkgdir/usr/share/icons/hicolor/512x512/apps/xfb_icon.png"
    install -Dm644 "xfb_icon.svg"                  "$pkgdir/usr/share/icons/hicolor/scalable/apps/xfb_icon.svg"
    install -Dm644 "XFB.iconset/icon_128x128.png"  "$pkgdir/usr/share/pixmaps/xfb_icon.png"
    
    # Install config files
    if [ -d "config" ]; then
        install -m644 config/* "$pkgdir/usr/share/xfb/config/" 2>/dev/null || true
        # Copy config to /etc/xfb if xfb.conf exists
        if [ -f "config/xfb.conf" ]; then
            install -m644 "config/xfb.conf" "$pkgdir/etc/xfb/"
        fi
    fi
    
    # Install the server-sync script templates (executable: legacy call
    # sites exec the extensionless ones directly)
    if [ -d "scripts" ]; then
        install -m755 scripts/serverFtpCmds* "$pkgdir/usr/share/xfb/scripts/" 2>/dev/null || true
    fi
    
    # Install additional directories
    if [ -d "ftp" ]; then
        cp -r ftp/* "$pkgdir/usr/share/xfb/ftp/" 2>/dev/null || true
    fi
    if [ -d "jingles" ]; then
        cp -r jingles/* "$pkgdir/usr/share/xfb/jingles/" 2>/dev/null || true
    fi
    if [ -d "music" ]; then
        cp -r music/* "$pkgdir/usr/share/xfb/music/" 2>/dev/null || true
    fi
    if [ -d "playlists" ]; then
        cp -r playlists/* "$pkgdir/usr/share/xfb/playlists/" 2>/dev/null || true
    fi
    
    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install accessibility documentation
    if [ -d "docs/accessibility" ]; then
        cp -r "docs/accessibility" "$pkgdir/usr/share/doc/$pkgname/"
    fi
    
    # Set correct permissions on database if it exists
    if [ -f "$pkgdir/usr/share/xfb/config/adb.db" ]; then
        chmod +x "$pkgdir/usr/share/xfb/config/adb.db"
    fi
    
    echo "Installation of XFB completed successfully!"
    echo "The configuration file is: /etc/xfb/xfb.conf"
    echo "The shared folders are under: /usr/share/xfb"
    echo "You may want to install yt-dlp for downloading media"
    echo ""
    echo "New in v3.1419:"
    echo "  - Spotify and Apple Music links can be downloaded: XFB reads the"
    echo "    track list and fetches each song, single tracks or whole albums"
    echo "    and playlists"
    echo "  - A YouTube Mix link no longer drags in a thousand unrelated"
    echo "    tracks; XFB says it is a radio and offers just the one track"
    echo "  - A long playlist is never half-downloaded in silence: when a"
    echo "    source hands back a short list, XFB says so and what is missing"
    echo "  - Auto Mode with an empty playlist now puts a track up when you"
    echo "    press Play, instead of doing nothing"
    echo "  - Options: no more clipped or overlapping rows, and Spotify"
    echo "    credentials can be entered for playlists over 100 tracks"
    echo "  - The log no longer fills with braille-monitor chatter, and logs"
    echo "    older than two weeks are cleaned up"
    echo "  - About reports the version actually running; assorted typos"
    echo "    fixed, with Portuguese and French fully translated"
    echo ""
    echo "Can you share some ETH? 0x9700225FcD115230C9166BD68CEdc23e329D3CdF"
    echo "Thank you for installing XFB! Made with love & linux!"
}
