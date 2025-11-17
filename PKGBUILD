# Maintainer: ChHsich <hsichingchang@gmail.com>
pkgname=note-gen
_pkgname=note-gen
pkgver=0.22.3
pkgrel=1
pkgdesc="A cross-platform Markdown note-taking application with AI integration (X11/Wayland compatible)"
arch=('x86_64')
url="https://github.com/codexu/note-gen"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'librsvg' 'libvips' 'libxcb' 'libxrandr' 'dbus' 'pipewire' 'wayland' 'libglvnd' 'glib2' 'mesa' 'sqlite')
makedepends=('rust' 'nodejs' 'npm' 'pnpm' 'pkgconf' 'clang')
checkdepends=('patchelf')
provides=('note-gen')
conflicts=('note-gen-bin')
options=('!strip' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/note-gen-v$pkgver.tar.gz")
sha256sums=('da83028d89338b8b3695a24d62aad1a27ab2dbc6528bb488891e5159223102a5')

install=$pkgname.install

prepare() {
    cd "$pkgname-$pkgname-v$pkgver"
    # Set up build environment
    export npm_config_build_from_source=true
    export CARGO_HOME="$srcdir/.cargo"
}

build() {
    cd "$pkgname-$pkgname-v$pkgver"
    export CARGO_HOME="$srcdir/.cargo"
    export npm_config_build_from_source=true

    # Build strictly following upstream tauri-action approach
    # 1. Install frontend dependencies
    pnpm install

    # 2. Build Tauri application (tauri will handle beforeBuildCommand automatically)
    pnpm tauri build --no-bundle
}

package() {
    cd "$pkgname-$pkgname-v$pkgver/src-tauri"
    export CARGO_HOME="$srcdir/.cargo"

    # Install binary file (renamed to note-gen-real)
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname-real"

    # Create professional wrapper script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname-wrapper" << 'WRAPPER_EOF'
#!/usr/bin/env bash
# NoteGen wrapper script for Linux X11 compatibility
# Automatically detects graphics session environment and applies GBM fix when needed
# Usage: DEBUG=1 note-gen-wrapper [args...]

# Logging function
log() {
    local message="$*"
    if [ "$DEBUG" = "1" ]; then
        echo "$message" >&2
    fi
    logger -t note-gen-wrapper "$message"
}

# Check if GBM fix should be enabled
should_enable_gbm_fix() {
    # Wayland environment (via session type detection)
    [ "$XDG_SESSION_TYPE" = "wayland" ] && { log "Wayland session detected, no GBM fix needed"; return 1; }

    # Wayland environment (via environment variable detection)
    [ -n "$WAYLAND_DISPLAY" ] && { log "Wayland display detected, no GBM fix needed"; return 1; }
    [ -n "$WAYLAND_SOCKET" ] && { log "Wayland socket detected, no GBM fix needed"; return 1; }

    # X11 environment with display
    [ -n "$DISPLAY" ] && { log "X11 environment detected, applying GBM fix"; return 0; }

    # Headless/SSH environment
    log "No graphics environment detected, no modification needed"
    return 1
}

# Define package name
_pkgname="note-gen"

# Check if executable exists
check_executable() {
    local exec_path="/usr/bin/$_pkgname-real"
    if [ ! -x "$exec_path" ]; then
        logger -p err -t note-gen-wrapper "Executable not found: $exec_path"
        if [ "$DEBUG" = "1" ]; then
            echo "Error: Executable not found: $exec_path" >&2
        fi
        exit 127
    fi
}

# Main logic
log "NoteGen wrapper starting with arguments: $*"

# Detect and set environment variables
if should_enable_gbm_fix; then
    export WEBKIT_DISABLE_DMABUF_RENDERER=1
    log "Applied WEBKIT_DISABLE_DMABUF_RENDERER=1 for X11 compatibility"
fi

# Verify executable
check_executable

# Execute original program with all arguments
log "Executing: $_pkgname-real $*"
exec "$_pkgname-real" "$@"
WRAPPER_EOF

    # Create compatibility symlink
    ln -sf "$_pkgname-wrapper" "$pkgdir/usr/bin/$_pkgname"

    # Install icons - based on actual source code structure
    cd ..

    # Install existing icon sizes (according to actual source files)
    for size in 32x32 64x64 128x128; do
        if [ -f "src-tauri/icons/$size.png" ]; then
            install -Dm644 "src-tauri/icons/$size.png" "$pkgdir/usr/share/icons/hicolor/${size}/apps/$_pkgname.png"
        fi
    done

    # Install HiDPI icons (according to actual source files)
    if [ -f "src-tauri/icons/128x128@2x.png" ]; then
        install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/128x128@2x/apps/$_pkgname.png"
    fi

    # Create desktop entry and fallback icon (using actually existing files)
    if [ -f "public/app-icon.png" ]; then
        install -Dm644 "public/app-icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    elif [ -f "src-tauri/icons/128x128.png" ]; then
        install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    fi
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << EOF
[Desktop Entry]
Name=NoteGen
Comment=A cross-platform Markdown note-taking application with AI integration
Exec=$_pkgname-wrapper %U
Icon=$_pkgname
Type=Application
Categories=Office;Utility;TextEditor;
StartupNotify=true
EOF

  }