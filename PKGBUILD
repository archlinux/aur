# Maintainer: Bernardo P. G. <bernardopg@users.noreply.github.com>

pkgname=steam-game-idler-git
_pkgname=steam-game-idler
# pkgver is a placeholder — the real version is computed by pkgver() at build
# time from the upstream tauri.conf.json + the steam-game-idler submodule's
# commit history. The AUR publish workflow updates this line before pushing.
pkgver=5.0.19.r1742.g4277d0c3
pkgrel=1
# Release automation pins this to the GitHub release version. Normal AUR builds
# leave it empty and build the version declared by the checked-out source.
_release_version='5.0.19'
pkgdesc='Idle Steam games and farm trading cards with Linux support'
arch=('x86_64')
url='https://github.com/bernardopg/SGI'
license=('GPL-3.0-only')
depends=(
    'gtk3'
    'libayatana-appindicator'
    'openssl'
    'webkit2gtk-4.1'
)
optdepends=(
    'webkit2gtk-4.2: newer WebKitGTK support (Wayland improvements)'
    'xdg-desktop-portal: file picker/screenshot portal support (Flatpak/sandbox)'
    'libappindicator-gtk3: tray icon on non-Ubuntu desktops (KDE, GNOME, etc.)'
    'gstreamer: hardware video decode (VA-API/VDPAU)'
    'libnotify: desktop notifications'
)
makedepends=(
    'dotnet-sdk'
    'git'
    'nodejs'
    'pnpm'
    'rust'
    'xdg-utils'
)
provides=('steam-game-idler')
conflicts=('steam-game-idler')
options=('!lto' '!strip' '!debug')
source=('git+https://github.com/bernardopg/SGI.git#commit=2b20ca635b363d4392bea26c597640795df69b49')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/SGI"
    git submodule update --init --recursive

    local appver rev hash
    appver='5.0.19'
    rev=$(git -C steam-game-idler rev-list --count HEAD)
    hash=$(git -C steam-game-idler rev-parse --short HEAD)

    printf '%s.r%s.g%s' "$appver" "$rev" "$hash"
}

prepare() {
    cd "$srcdir/SGI"
    git submodule update --init --recursive

    cd steam-game-idler

    local release_version="$_release_version"
    if [[ -z "$release_version" ]]; then
        release_version=$(node -p "require('./package.json').version")
    fi
    node scripts/set-release-version.mjs "$release_version"
    node scripts/check-release-version.mjs "$release_version"

    # pnpm 10+ enforces strictDepBuilds: native deps with postinstall scripts
    # (sharp, esbuild, @heroui/shared-utils) must be explicitly approved or the
    # install aborts with ERR_PNPM_IGNORED_BUILDS. Older submodule pointers (pre-
    # 6524fa73) don't declare allowBuilds in pnpm-workspace.yaml, so we inject it
    # defensively. Idempotent: a no-op if already present.
    if ! grep -q '^allowBuilds:' pnpm-workspace.yaml; then
    cat >> pnpm-workspace.yaml <<'YAML'
allowBuilds:
  '@heroui/shared-utils': true
  esbuild: true
  sharp: true
YAML
    fi

    pnpm install --frozen-lockfile

    # AUR builds have no embedded Steam API key; remove the production panic so the app
    # starts normally. API features will fail gracefully until the user sets the key in
    # Settings or launches with KEY=<steam_web_api_key> in the environment.
    sed -i \
    's/panic!("No obfuscated API key available in production build");/\/\/ no embedded key — user configures via Settings/' \
    src-tauri/src/lib.rs
}

build() {
    cd "$srcdir/SGI/steam-utility-multiplataform"
    dotnet publish src/SteamUtility.Cli/SteamUtility.Cli.csproj \
    -c Release \
    -r linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    -p:DebugType=None \
    -p:DebugSymbols=false \
    -o "$srcdir/SGI/steam-game-idler/src-tauri/libs"

    cd "$srcdir/SGI/steam-game-idler"

    # pacman handles updates; disable Tauri updater artifact generation (requires a signing key)
    sed -i 's/"createUpdaterArtifacts": "[^"]*"/"createUpdaterArtifacts": false/' src-tauri/tauri.conf.json
    pnpm check:release-version

    export NEXT_TELEMETRY_DISABLED=1
    export TAURI_CI=1
    # fat LTO requires 10+ GB RAM; thin LTO is the standard choice for packaged builds
    export CARGO_PROFILE_RELEASE_LTO=thin
    # The package() step extracts the Debian bundle into the Arch package layout.
    # AppImage is built separately by the release workflow and is not consumed here.
    pnpm tauri build --bundles deb
}

check() {
    cd "$srcdir/SGI/steam-game-idler"
    # Basic smoke test: ensure binary exists and is executable
    [[ -x "src-tauri/target/release/Steam Game Idler" ]] || return 1
}

package() {
    cd "$srcdir/SGI/steam-game-idler"

    local deb
    deb=$(find src-tauri/target/release/bundle/deb -type f -name '*.deb' | head -n1)

    if [[ -z "$deb" ]]; then
        echo 'Tauri did not produce a .deb bundle' >&2
        return 1
    fi

    mkdir -p "$srcdir/deb-extract"
    bsdtar -xf "$deb" -C "$srcdir/deb-extract"
    bsdtar -xf "$srcdir/deb-extract"/data.tar.* -C "$pkgdir"

    # Debian maintainer scripts may generate this host-level cache. Arch owns
    # and refreshes it through hooks, so shipping it causes a pacman conflict.
    rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"

    # .pdb files embed absolute $srcdir paths; not needed at runtime
    find "$pkgdir" -name '*.pdb' -delete

    # Tauri's .deb names paths after productName ("Steam Game Idler"), which embeds
    # spaces into /usr/bin/ and /usr/lib/. Rename to a shell-friendly lowercase form
    # so the binary is tab-completable and follows Linux packaging conventions.
    local branded='Steam Game Idler'
    local lower='steam-game-idler'

    if [[ -d "$pkgdir/usr/lib/$branded" ]]; then
        mv "$pkgdir/usr/lib/$branded" "$pkgdir/usr/lib/$lower"
    fi

    # Two upstream Linux bugs make the app misbehave when the binary lives in
    # /usr/bin/ and resources in /usr/lib/<app>/:
    #
    #   1. is_portable() in src-tauri/src/utils.rs treats `<exe_dir>/.installed`
    #      as the install marker. With the binary at /usr/bin/, the marker is
    #      never found and is_portable() returns true → the app then tries to
    #      write its cache to /usr/bin/cache/ (read-only) and stores window
    #      state next to the binary.
    #   2. get_lib_path() resolves SteamUtility.Cli relative to the binary as
    #      `<exe_dir>/libs/SteamUtility.Cli`, which becomes
    #      /usr/bin/libs/SteamUtility.Cli — wrong location.
    #
    # Move the actual ELF into /usr/lib/<lower>/ alongside .installed and libs/,
    # and replace /usr/bin/<lower> with a relative symlink. std::env::current_exe()
    # on Linux reads /proc/self/exe, which resolves through the symlink to the
    # real path under /usr/lib/<lower>/. After this, both helpers find what they
    # expect:
    #   - is_portable() finds /usr/lib/<lower>/.installed  → returns false
    #   - get_lib_path() returns /usr/lib/<lower>/libs/SteamUtility.Cli
    if [[ -f "$pkgdir/usr/bin/$branded" ]]; then
        install -Dm755 "$pkgdir/usr/bin/$branded" "$pkgdir/usr/lib/$lower/$lower"
        rm -f "$pkgdir/usr/bin/$branded"
        ln -sf "../lib/$lower/$lower" "$pkgdir/usr/bin/$lower"
        elif [[ -f "$pkgdir/usr/bin/$lower" && ! -L "$pkgdir/usr/bin/$lower" ]]; then
        install -Dm755 "$pkgdir/usr/bin/$lower" "$pkgdir/usr/lib/$lower/$lower"
        rm -f "$pkgdir/usr/bin/$lower"
        ln -sf "../lib/$lower/$lower" "$pkgdir/usr/bin/$lower"
    fi

    # Tauri emits a 256x256@2 directory (macOS HiDPI convention); rename to standard 256x256
    # so gtk-update-icon-cache does not reject the hicolor theme
    local icon_hi="$pkgdir/usr/share/icons/hicolor"
    if [[ -d "$icon_hi/256x256@2" && ! -d "$icon_hi/256x256" ]]; then
        mv "$icon_hi/256x256@2" "$icon_hi/256x256"
    else
        rm -rf "$icon_hi/256x256@2"
    fi

    # gtk-update-icon-cache rejects icon basenames containing spaces.
    find "$icon_hi" -type f -name "$branded.png" -execdir mv "$branded.png" "$lower.png" \;

    # Rewrite the .desktop: rename the file, fix Icon, fix Exec to point at the new
    # binary path, and strip the literal double-quotes that tauri-bundler places
    # around StartupWMClass and Exec values — those quotes break WM_CLASS matching
    # on most desktops and prevent the launcher from grouping windows correctly.
    # The runtime WM_CLASS is the productName, so we keep "Steam Game Idler" as
    # the StartupWMClass value (without quotes).
    # Add MimeType for steam:// protocol and Steam app cache files.
    local desktop_old="$pkgdir/usr/share/applications/$branded.desktop"
    local desktop_new="$pkgdir/usr/share/applications/$lower.desktop"
    if [[ -f "$desktop_old" ]]; then
        mv "$desktop_old" "$desktop_new"
        sed -i \
        -e "s|^Icon=.*|Icon=$lower|" \
        -e "s|^Exec=.*|Exec=/usr/bin/$lower|" \
        -e "s|^StartupWMClass=.*|StartupWMClass=$branded|" \
        -e "/^MimeType=/d" \
        -e "/^Categories=/a MimeType=application/x-steam-app-cache-file;" \
        "$desktop_new"
    fi

    # Install AppStream metainfo.xml for software centers (GNOME Software, KDE Discover)
    install -Dm644 "$srcdir/SGI/packaging/aur/steam-game-idler.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/com.github.bernardopg.SteamGameIdler.metainfo.xml"

    # Install systemd user service for "start on boot" (not just login)
    install -Dm644 "$srcdir/SGI/packaging/aur/steam-game-idler.service" \
    "$pkgdir/usr/lib/systemd/user/steam-game-idler.service"

    # Install shell completions
    install -Dm644 "$srcdir/SGI/packaging/aur/steam-game-idler.bash" \
    "$pkgdir/usr/share/bash-completion/completions/steam-game-idler"
    install -Dm644 "$srcdir/SGI/packaging/aur/_steam-game-idler" \
    "$pkgdir/usr/share/zsh/site-functions/_steam-game-idler"
    install -Dm644 "$srcdir/SGI/packaging/aur/steam-game-idler.fish" \
    "$pkgdir/usr/share/fish/vendor_completions.d/steam-game-idler.fish"

    # Install man pages
    install -Dm644 "$srcdir/SGI/packaging/aur/steam-game-idler.1" \
    "$pkgdir/usr/share/man/man1/steam-game-idler.1"
    install -Dm644 "$srcdir/SGI/packaging/aur/SteamUtility.Cli.1" \
    "$pkgdir/usr/share/man/man1/SteamUtility.Cli.1"

    # Install symbolic icons for dark/light theme support
    install -Dm644 "$srcdir/SGI/packaging/aur/icons/scalable/steam-game-idler-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/steam-game-idler-symbolic.svg"
    install -Dm644 "$srcdir/SGI/packaging/aur/icons/scalable/steam-game-idler-symbolic-dark.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/steam-game-idler-symbolic-dark.svg"

    # Tauri ships /usr/lib/<app>/ with mode d--x--x--x on some build hosts (a known
    # tauri-bundler quirk that breaks `ls` for non-root users). Force directories to
    # 755 and regular files to a readable mode so the package is well-formed.
    if [[ -d "$pkgdir/usr/lib/$lower" ]]; then
        chmod 755 "$pkgdir/usr/lib/$lower"
        find "$pkgdir/usr/lib/$lower" -type d -exec chmod 755 {} +
        find "$pkgdir/usr/lib/$lower" -type f -exec chmod a+r {} +
        if [[ -x "$pkgdir/usr/lib/$lower/libs/SteamUtility.Cli" ]]; then
            chmod 755 "$pkgdir/usr/lib/$lower/libs/SteamUtility.Cli"
        fi
    fi
}
