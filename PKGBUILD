# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=aqueous-git
pkgbase=aqueous
pkgver=0.1.0 # Will be updated by pkgver()
pkgrel=7
pkgdesc="Aqueous Wayland window manager bundled with RiverDelta"
arch=('x86_64' 'aarch64')
url="https://github.com/Seafoam-Labs/Aqueous"
license=('GPL3')
depends=('wayland' 'wayland-protocols' 'libxkbcommon' 'libinput'
         'pixman' 'libdrm' 'libevdev' 'wlr-randr'
         'noctalia-shell' 'libdecor' 'grim' 'slurp' 'xwayland-satellite'
         'xdg-desktop-portal-wlr' 'wlroots0.20' 'wl-clipboard'
         'xdg-desktop-portal-gtk' 'libnotify'
         # NativeAOT runtime link targets (BCL dlopens/dynlinks against these).
         'zlib' 'krb5' 'openssl' 'scenefx')
makedepends=('dotnet-sdk-10.0' 'clang' 'lld' 'llvm' 'zlib' 'krb5' 'openssl'
             'git' 'wayland-protocols' 'scenefx')
optdepends=('ly: tuigreeter'
            'greetd: minimal login manager for tuigreet'
            'tabby: recommended terminal emulator'
            'nemo: recommended file manager'
            'firefox: web browser'
            'wireplumber: volume/media key bindings (wpctl)')
provides=('aqueous' 'riverdelta')
conflicts=('aqueous' 'riverdelta')
install=aqueous.install
source=(
    "aqueous::git+${url}.git"
)
sha256sums=('SKIP')

_rid_map() {
    case "$CARCH" in
        x86_64)  echo "linux-x64" ;;
        aarch64) echo "linux-arm64" ;;
        *) return 1 ;;
    esac
}

pkgver() {
    cd "$srcdir/aqueous"
    local ver
    ver=$(git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
    if [[ -z "$ver" ]]; then
        ver="0.1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
    fi
    echo "$ver"
}

build() {
    # Verify zig is new enough (RiverDelta requires >= 0.16.0).
    # We enforce this here instead of via a pacman version constraint because
    # the repo `zig` package is currently 0.15.x and Zig 0.16 is only available
    # via `zig-master-bin` (AUR), which provides unversioned `zig`.
    if ! command -v zig >/dev/null 2>&1; then
        error "zig not found. Install zig-master-bin from the AUR (or another zig >= 0.16.0)."
        return 1
    fi
    local zig_ver zig_base
    zig_ver=$(zig version)
    # Strip any -dev.NNN+hash pre-release suffix so we compare the numeric base
    # version with sort -V (which has inconsistent semantics around bare `-`).
    zig_base="${zig_ver%%-*}"
    if ! printf '0.16.0\n%s\n' "$zig_base" | sort -V -C; then
        error "Zig >= 0.16.0 required, found $zig_ver. Install zig-master-bin from the AUR."
        return 1
    fi
    msg2 "Using zig $zig_ver"

    # Build Aqueous components (NativeAOT).
    #
    # Notes on the publish flags:
    #   * PublishAot=true is also set in each csproj; we pass it on the
    #     command line so an accidental csproj edit can't silently fall
    #     back to JIT in CI.
    #   * --self-contained true is redundant under AOT (AOT is implicitly
    #     self-contained) but harmless; kept to make the publish profile
    #     explicit.
    #   * PublishSingleFile is deliberately NOT passed -- it is
    #     incompatible with PublishAot.
    #   * StripSymbols + DebugType=none keep the shipped ELF small;
    #     pacman's check-strip hook is happy.
    #   * Per-binary IlcOptimizationPreference: WM = Speed (latency in
    #     the input/render path), OutputDaemon = Size (cold-start
    #     sidecar).
    local rid; rid=$(_rid_map)
    cd "$srcdir/aqueous"

    local common_args=(
        -c Release
        -r "$rid"
        --self-contained true
        -p:PublishAot=true
        -p:InvariantGlobalization=true
        -p:StripSymbols=true
        -p:DebugType=none
        -p:DebugSymbols=false
        --nologo
    )

    msg2 "AOT-publishing Aqueous WM"
    dotnet publish Aqueous/Aqueous.csproj \
        "${common_args[@]}" \
        -p:IlcOptimizationPreference=Speed \
        -o "$srcdir/publish/Aqueous"

    msg2 "AOT-publishing Aqueous OutputDaemon"
    dotnet publish Aqueous.OutputDaemon/Aqueous.OutputDaemon.csproj \
        "${common_args[@]}" \
        -p:IlcOptimizationPreference=Size \
        -o "$srcdir/publish/Aqueous.OutputDaemon"

    # Post-publish guard: fail fast if AOT silently fell back to a
    # managed launcher (which would produce a tiny ELF stub that loads
    # libcoreclr.so instead of a real native binary).
    local bin
    for bin in "$srcdir/publish/Aqueous/aqueous" \
               "$srcdir/publish/Aqueous.OutputDaemon/aqueous-outputd"; do
        [[ -x "$bin" ]] || { error "Missing AOT output: $bin"; return 1; }
        if ! file "$bin" | grep -q 'ELF .* executable'; then
            error "Not a native AOT binary: $bin"
            file "$bin"
            return 1
        fi
    done

    # Build RiverDelta (in-tree at compositor/)
    msg2 "Building RiverDelta..."
    cd "$srcdir/aqueous/compositor"
    # -Dllvm forces the LLVM backend + LLD linker. Zig 0.16.0's self-hosted
    # ELF linker can't handle R_X86_64_PC64 in .sframe emitted by gcc >= 16.
    zig build -Doptimize=ReleaseSafe -Dxwayland -Dllvm -Dscenefx=true \
        --prefix "$srcdir/river-dist" install
}

package() {
    # Install Aqueous binaries
    install -Dm755 "$srcdir/publish/Aqueous/aqueous" "$pkgdir/usr/bin/aqueous"
    install -Dm755 "$srcdir/publish/Aqueous.OutputDaemon/aqueous-outputd" "$pkgdir/usr/bin/aqueous-outputd"

    # Install RiverDelta binary as 'riverdelta' instead of 'river'
    install -Dm755 "$srcdir/river-dist/bin/riverdelta" "$pkgdir/usr/bin/riverdelta"

    # Install RiverDelta share data (man pages, etc.)
    if [ -d "$srcdir/river-dist/share" ]; then
        install -d "$pkgdir/usr/share"
        cp -dr --no-preserve=ownership "$srcdir/river-dist/share/"* "$pkgdir/usr/share/"
    fi

    # Install Aqueous packaging scripts and config
    install -Dm755 "$srcdir/aqueous/packaging/aqueous-init" "$pkgdir/usr/bin/aqueous-init"
    install -Dm755 "$srcdir/aqueous/packaging/aqueous-wm.sh" "$pkgdir/usr/bin/aqueous-wm"
    install -Dm644 "$srcdir/aqueous/aqueous.desktop" "$pkgdir/usr/share/wayland-sessions/aqueous.desktop"

    # xdg-desktop-portal routing config. Pins ScreenCast/Screenshot to the
    # wlroots backend (xdg-desktop-portal-wlr) so screen sharing works out of
    # the box and is not silently won by a competing backend (cosmic/gtk).
    # Installed system-wide; the 'aqueous' filename stem is applied because the
    # session sets XDG_CURRENT_DESKTOP=Aqueous (see packaging/aqueous-init).
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-portals.conf" \
        "$pkgdir/usr/share/xdg-desktop-portal/aqueous-portals.conf"
    install -Dm644 "$srcdir/aqueous/wm.toml" "$pkgdir/etc/xdg/aqueous/wm.toml"
    install -Dm644 "$srcdir/aqueous/wm.toml" "$pkgdir/usr/share/aqueous/wm.toml"

    # systemd user unit for the output daemon. Input config no longer
    # needs a sidecar: the Aqueous WM applies [input.*] from wm.toml
    # directly to the compositor via the river_libinput_config_v1
    # protocol.
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-outputd.service" \
        "$pkgdir/usr/lib/systemd/user/aqueous-outputd.service"

    # Session wrapper target. graphical-session.target is static
    # (RefuseManualStart) and xdg-desktop-portal.service has
    # Requisite=graphical-session.target, so the portal cannot start until the
    # target is active. aqueous-init starts this wrapper (which Requires/BindsTo
    # graphical-session.target) to activate it legitimately and tear it down on
    # logout — making the portal (and flameshot/screencast) work out of the box.
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-session.target" \
        "$pkgdir/usr/lib/systemd/user/aqueous-session.target"

    # tmpfiles snippet: materialises per-user state/cache/config dirs at
    # login via systemd-tmpfiles --user.
    install -Dm644 "$srcdir/aqueous/packaging/aqueous.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/aqueous.conf"

    # Quickshell/Noctalia bridge for the output daemon. Imported as
    #   import "file:///usr/share/aqueous/quickshell" as Aqueous
    install -Dm644 "$srcdir/aqueous/packaging/quickshell/OutputControl.qml" \
        "$pkgdir/usr/share/aqueous/quickshell/OutputControl.qml"

    # Default Noctalia config (seeded on first launch by aqueous-init when
    # the user has no ~/.config/noctalia/settings.json yet).
    install -Dm644 "$srcdir/aqueous/packaging/noctalia/settings.json" \
        "$pkgdir/usr/share/aqueous/noctalia/settings.json"

    # Default wallpapers referenced by the shipped Noctalia config.
    install -d "$pkgdir/usr/share/aqueous/wallpapers"
    install -m644 "$srcdir/aqueous/packaging/wallpapers/"*.avif \
        "$pkgdir/usr/share/aqueous/wallpapers/"

    # Documented greetd example (not auto-installed to /etc).
    install -Dm644 "$srcdir/aqueous/packaging/greetd/config.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/greetd-config.toml.example"

    # Docs / license.
    install -Dm644 "$srcdir/aqueous/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
    if [[ -f "$srcdir/aqueous/LICENSE" ]]; then
        install -Dm644 "$srcdir/aqueous/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    # In-tree compositor licenses (RiverDelta is multi-licensed; ship the
    # license texts alongside Aqueous's own license for attribution).
    if [[ -d "$srcdir/aqueous/compositor/LICENSES" ]]; then
        install -d "$pkgdir/usr/share/licenses/$pkgname/riverdelta"
        cp -dr --no-preserve=ownership \
            "$srcdir/aqueous/compositor/LICENSES/." \
            "$pkgdir/usr/share/licenses/$pkgname/riverdelta/"
    fi

    # Defense-in-depth: drop any stray AOT debug artefacts that
    # StripSymbols may have left next to the binaries.
    find "$pkgdir/usr/bin" -maxdepth 1 \( -name '*.dbg' -o -name '*.pdb' \) -delete 2>/dev/null || true
}
