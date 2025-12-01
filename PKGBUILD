# Maintainer: Frédéric Bogaerts <fred@netpack.pt>
pkgname=xfb
pkgver=2.0.0
pkgrel=7
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
)
makedepends=(
    'cmake'
    'git'
    'pkg-config'
)
optdepends=(
    'orca: Screen reader support for visually impaired users'
    'brltty: Braille display support'
    'espeak-ng: Text-to-speech synthesis'
    'audacity: Advanced audio editing'
    'mplayer: Media player'
    'soundconverter: Audio converter'
    'yt-dlp: Download media from online sources'
    'ffmpeg: Audio format conversion'
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
source=("git+https://github.com/netpack/XFB.git#tag=v2.0.0.5")
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
    
    # Install icon
    install -Dm644 "xfb_icon.png" "$pkgdir/usr/share/pixmaps/xfb_icon.png"
    
    # Install config files
    if [ -d "config" ]; then
        install -m644 config/* "$pkgdir/usr/share/xfb/config/" 2>/dev/null || true
        # Copy config to /etc/xfb if xfb.conf exists
        if [ -f "config/xfb.conf" ]; then
            install -m644 "config/xfb.conf" "$pkgdir/etc/xfb/"
        fi
    fi
    
    # Install scripts
    if [ -d "scripts" ]; then
        install -m644 scripts/* "$pkgdir/usr/share/xfb/scripts/" 2>/dev/null || true
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
    echo "New in v2.0.0:"
    echo "  - Full ORCA screen reader integration"
    echo "  - Complete keyboard navigation"
    echo "  - Audio feedback system"
    echo "  - Braille display support"
    echo ""
    echo "Can you share some ETH? 0x9700225FcD115230C9166BD68CEdc23e329D3CdF"
    echo "Thank you for installing XFB! Made with love & linux!"
}
