# Maintainer: Frédéric Bogaerts <fred@netpack.pt>
pkgname=xfb
# pacman compares the dot-separated segments as integers, not as decimals, so
# 3.14159 outranks 3.1416 (14159 > 1416) and every rounded release looks like a
# downgrade. The epoch overrides that comparison. It must never be removed or
# lowered: dropping it would make the next release look older than this one to
# every machine that installed it. Raise it only if the version ever has to go
# backwards again.
epoch=1
pkgver=3.1422
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
# The companion APK comes from the release rather than the tag: it is a build
# product of the Android toolchain, signed with a key that is not in the
# repository, so it is never committed. sha256 is the released file's own --
# see android/RELEASING.md, which prints it.
source=("git+https://github.com/netpack/XFB.git#tag=v${pkgver}"
        "xfb-companion-${pkgver}.apk::https://github.com/netpack/XFB/releases/download/v${pkgver}/xfb-companion.apk"
        "xfb-companion-${pkgver}.json::https://github.com/netpack/XFB/releases/download/v${pkgver}/xfb-companion.json")
sha256sums=('SKIP'
            'REPLACE_WITH_APK_SHA256'
            'REPLACE_WITH_SIDECAR_SHA256')

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
    
    # Install the phone app. XFB serves this to phones itself, and
    # /usr/share/xfb is the last path MobileSyncServer::companionApkPath()
    # tries. Both files or neither: without the sidecar the APK is offered as a
    # download but never recognised as an update.
    if [ -f "$srcdir/xfb-companion-${pkgver}.apk" ]; then
        install -Dm644 "$srcdir/xfb-companion-${pkgver}.apk" \
            "$pkgdir/usr/share/xfb/xfb-companion.apk"
        install -Dm644 "$srcdir/xfb-companion-${pkgver}.json" \
            "$pkgdir/usr/share/xfb/xfb-companion.json"
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
    echo "New in v3.1422:"
    echo "  - XFB encodes and streams to Icecast itself, song titles and all,"
    echo "    instead of driving butt through a sound card"
    echo "  - Programme the hour as a clock: timed slots, pinned or floating,"
    echo "    drawn as a clock face and editable as a list from the keyboard"
    echo "  - Auto Mode is a rotation now — artist separation, dayparts, date"
    echo "    windows and weighted categories, judged against what aired"
    echo "  - An as-run log of everything that went out, with the dated"
    echo "    airing certificate an advertiser asks for"
    echo "  - Voice tracking: talk over the join in the cue headphones and"
    echo "    XFB writes the ducking as a volume line you can still drag"
    echo "  - A cue output that is not the transmitter, for auditioning a"
    echo "    track, a spot or XFB's own announcements privately"
    echo "  - Loudness measured once with EBU R128 and corrected in the DSP"
    echo "    chain, with a true-peak limiter on the master"
    echo "  - A dead-air watchdog that puts fallback material on air, logs"
    echo "    the outage, and can be watched over by the backup machine"
    echo "  - An intro countdown that reaches zero on the vocal"
    echo "  - A public now-playing and request page, off until you turn it on"
    echo "  - Production computers: prepare the programme on an office XFB"
    echo "    and publish music, ads, jingles and playlists back to the studio"
    echo "  - Fixes: Opus imports keep their titles, the as-run log answers"
    echo "    the right rows when the clocks change, a volume line survives"
    echo "    the segue, and the phone companion keeps the tracks it has"
    echo "    synced from more than one station"
    echo ""
    echo "Can you share some ETH? 0x9700225FcD115230C9166BD68CEdc23e329D3CdF"
    echo "Thank you for installing XFB! Made with love & linux!"
}
