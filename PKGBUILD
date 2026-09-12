# Maintainer: ChHsich <hsichingchang@gmail.com>
pkgname=note-gen
_pkgname=note-gen
pkgver=0.37.1
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
sha256sums=('d9f4a80a39b68b7f322186b24b41bd3864672edc21599071b160901b2d609435')

install=$pkgname.install

prepare() {
    cd "$pkgname-$pkgname-v$pkgver"
    # Set up build environment
    export npm_config_build_from_source=true
    export CARGO_HOME="$srcdir/.cargo"

    # Approve dependency build scripts: pnpm 10 blocks them silently,
    # pnpm 11 (strictDepBuilds) fails the install outright with
    # ERR_PNPM_IGNORED_BUILDS. Since 0.37.0 upstream ships its own
    # pnpm-workspace.yaml (monorepo, packages/*) defining the workspace
    # members that workspace:* deps resolve against — append our
    # approvals, never overwrite the file.
    touch pnpm-workspace.yaml
    grep -q '^onlyBuiltDependencies:' pnpm-workspace.yaml || cat >> pnpm-workspace.yaml <<'EOF'
onlyBuiltDependencies:
  - esbuild
  - sharp
  - unrs-resolver
  - "@parcel/watcher"
EOF
    grep -q '^allowBuilds:' pnpm-workspace.yaml || cat >> pnpm-workspace.yaml <<'EOF'
allowBuilds:
  esbuild: true
  sharp: true
  unrs-resolver: true
  "@parcel/watcher": true
EOF

    # pnpm 11 no longer reads the "pnpm" field from package.json, so
    # upstream's pnpm.overrides are ignored — which makes a frozen
    # install fail with ERR_PNPM_LOCKFILE_CONFIG_MISMATCH and a plain
    # install re-resolve open specifiers (e.g. @tauri-apps/api >=2.0.0
    # jumps to 2.11.x and the tauri CLI aborts on the crate/npm version
    # mismatch). Carry the overrides into pnpm-workspace.yaml, where
    # pnpm 11 does read them, so the lockfile config matches again.
    grep -q '^overrides:' pnpm-workspace.yaml || node -e '
const fs = require("fs");
const overrides = (JSON.parse(fs.readFileSync("package.json", "utf8")).pnpm || {}).overrides;
if (overrides) {
  const lines = ["overrides:"];
  for (const [k, v] of Object.entries(overrides)) lines.push(`  ${JSON.stringify(k)}: ${JSON.stringify(String(v))}`);
  fs.appendFileSync("pnpm-workspace.yaml", lines.join("\n") + "\n");
}'

    # Upstream's monorepo releases reference their own npm packages
    # published hours earlier; pnpm 11's default supply-chain policy
    # (minimumReleaseAge) rejects anything published within the last
    # 24h. The lockfile is frozen (integrity-pinned), so relax the age
    # policy for this build.
    grep -q '^minimumReleaseAge:' pnpm-workspace.yaml || \
        echo 'minimumReleaseAge: 0' >> pnpm-workspace.yaml

    # libspa-sys 0.8.0 pins bindgen 0.69, which cannot lay out
    # spa_pod_builder from pipewire >= 1.6 headers and emits an opaque
    # type, breaking the libspa 0.8.0 build. Vendor the crate with the
    # bindgen requirement bumped until upstream moves xcap (=0.6.0)
    # past pipewire-rs 0.8. If libspa-sys 0.8.0 is gone from the tree,
    # the patch is skipped (pointing [patch] at nothing breaks cargo).
    cd src-tauri
    cargo fetch || return 1
    local crate_src=""
    local reg
    for reg in "$CARGO_HOME"/registry/src/*/libspa-sys-0.8.0; do
        [ -d "$reg" ] && crate_src="$reg" && break
    done
    if [ -z "$crate_src" ]; then
        # cargo fetch downloads .crate archives without necessarily
        # extracting them to registry/src; extract the archive ourselves
        local cache
        for cache in "$CARGO_HOME"/registry/cache/*/libspa-sys-0.8.0.crate; do
            [ -f "$cache" ] || continue
            rm -rf vendor && mkdir -p vendor
            tar xf "$cache" -C vendor
            mv vendor/libspa-sys-0.8.0 vendor/libspa-sys
            crate_src="vendor/libspa-sys"
            break
        done
    fi
    if [ -n "$crate_src" ] && [ "$crate_src" != "vendor/libspa-sys" ]; then
        rm -rf vendor && mkdir -p vendor
        cp -r "$crate_src" vendor/libspa-sys
    fi
    if [ -n "$crate_src" ]; then
        rm -f vendor/libspa-sys/.cargo-checksum.json
        sed -i 's/version = "0.69"/version = "0.72"/' vendor/libspa-sys/Cargo.toml
        grep -q 'patch.crates-io' Cargo.toml || \
            printf '\n[patch.crates-io]\nlibspa-sys = { path = "vendor/libspa-sys" }\n' >> Cargo.toml
    fi
    cd ..
}

build() {
    cd "$pkgname-$pkgname-v$pkgver"
    export CARGO_HOME="$srcdir/.cargo"
    export npm_config_build_from_source=true

    # Build strictly following upstream tauri-action approach
    # 1. Install frontend dependencies. --frozen-lockfile installs the
    # locked tree as-is: plain install re-resolves open specifiers and
    # the newer @tauri-apps/* packages then fail tauri's npm/crate
    # version consistency check.
    pnpm install --frozen-lockfile

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