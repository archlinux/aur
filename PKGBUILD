# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=aqueous-git
pkgbase=aqueous
pkgver=0.0.1.r34.gd7773b2 # Will be updated by pkgver()
pkgrel=1
pkgdesc="Aqueous Wayland window manager bundled with RiverDelta"
arch=('x86_64' 'aarch64')
url="https://github.com/Seafoam-Labs/Aqueous"
license=('GPL3')
depends=('wayland' 'wayland-protocols' 'libxkbcommon' 'libinput'
         'pixman' 'libdrm' 'libevdev' 'wlr-randr'
         'noctalia-shell' 'libdecor' 'grim' 'xwayland-satellite'
         'xdg-desktop-portal-wlr' 'swaylock' 'swayidle')
makedepends=('dotnet-sdk-10.0' 'clang' 'zlib' 'krb5' 'git' 'wayland-protocols')
optdepends=('tuigreet: TUI greeter for greetd (recommended login path)'
            'greetd: minimal login manager for tuigreet'
            'aqueous-greetd-config: opinionated greetd+tuigreet preset for Aqueous'
            'ghostty: recommended terminal emulator'
            'nemo: recommended file manager'
            'firefox: web browser')
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

    # Build Aqueous components
    local rid; rid=$(_rid_map)
    cd "$srcdir/aqueous"
    for proj in Aqueous/Aqueous.csproj Aqueous.InputDaemon/Aqueous.InputDaemon.csproj Aqueous.OutputDaemon/Aqueous.OutputDaemon.csproj; do
        local name; name=$(basename "$proj" .csproj)
        dotnet publish "$proj" -c Release -r "$rid" --self-contained true /p:PublishAot=true -o "$srcdir/publish/$name"
    done

    # Build RiverDelta (in-tree at compositor/)
    msg2 "Building RiverDelta..."
    cd "$srcdir/aqueous/compositor"
    # -Dllvm forces the LLVM backend + LLD linker. Zig 0.16.0's self-hosted
    # ELF linker can't handle R_X86_64_PC64 in .sframe emitted by gcc >= 16.
    zig build -Doptimize=ReleaseSafe -Dxwayland -Dllvm --prefix "$srcdir/river-dist" install
}

package() {
    # Install Aqueous binaries
    install -Dm755 "$srcdir/publish/Aqueous/aqueous" "$pkgdir/usr/bin/aqueous"
    install -Dm755 "$srcdir/publish/Aqueous.InputDaemon/aqueous-inputd" "$pkgdir/usr/bin/aqueous-inputd"
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
    install -Dm644 "$srcdir/aqueous/wm.toml" "$pkgdir/etc/xdg/aqueous/wm.toml"
    install -Dm644 "$srcdir/aqueous/wm.toml" "$pkgdir/usr/share/aqueous/wm.toml"

    # systemd user units for the input daemon (optional; launcher falls
    # back to spawning the daemon directly if the unit is inactive).
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-inputd.service" \
        "$pkgdir/usr/lib/systemd/user/aqueous-inputd.service"
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-inputd.socket" \
        "$pkgdir/usr/lib/systemd/user/aqueous-inputd.socket"
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-outputd.service" \
        "$pkgdir/usr/lib/systemd/user/aqueous-outputd.service"

    # udev rule: tag /dev/input/event* with uaccess so the active local
    # session user gets an ACL on input devices automatically. This makes
    # aqueous-inputd work out of the box without adding users to the
    # 'input' group (matches niri's approach).
    install -Dm644 "$srcdir/aqueous/packaging/udev/70-aqueous-uaccess.rules" \
        "$pkgdir/usr/lib/udev/rules.d/70-aqueous-uaccess.rules"

    # Quickshell/Noctalia bridge for the output daemon. Imported as
    #   import "file:///usr/share/aqueous/quickshell" as Aqueous
    install -Dm644 "$srcdir/aqueous/packaging/quickshell/OutputControl.qml" \
        "$pkgdir/usr/share/aqueous/quickshell/OutputControl.qml"

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
}
