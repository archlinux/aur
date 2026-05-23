# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=aqueous-git
pkgbase=aqueous
pkgver=0.1.0.r101.g6d62a7e # Will be updated by pkgver()
pkgrel=1
pkgdesc="Aqueous Wayland window manager bundled with aqueous-compositor"
arch=('x86_64' 'aarch64')
url="https://github.com/Seafoam-Labs/Aqueous"
license=('GPL3')
depends=('wayland' 'wayland-protocols' 'libxkbcommon' 'libinput'
         'pixman' 'libdrm' 'libevdev' 'wlr-randr'
         'noctalia-shell' 'libdecor' 'grim' 'xwayland-satellite'
         'xdg-desktop-portal-wlr' 'wlroots0.20')
makedepends=('dotnet-sdk-10.0' 'clang' 'zlib' 'krb5' 'git' 'wayland-protocols')
optdepends=('Ly: login manager'
            'greetd: minimal login manager for tuigreet'
            'aqueous-greetd-config: opinionated greetd+tuigreet preset for Aqueous'
            'ghostty: recommended terminal emulator'
            'nemo: recommended file manager'
            'firefox: web browser')
provides=('aqueous' 'aqueous-compositor' 'riverdelta')
conflicts=('aqueous' 'aqueous-compositor' 'riverdelta')
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
    # Verify zig is new enough (aqueous-compositor requires >= 0.16.0).
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
    for proj in Aqueous/Aqueous.csproj Aqueous.OutputDaemon/Aqueous.OutputDaemon.csproj; do
        local name; name=$(basename "$proj" .csproj)
        dotnet publish "$proj" -c Release -r "$rid" --self-contained true /p:PublishAot=true -o "$srcdir/publish/$name"
    done

    # Build aqueous-compositor (in-tree at compositor/)
    msg2 "Building aqueous-compositor..."
    cd "$srcdir/aqueous/compositor"
    # -Dllvm forces the LLVM backend + LLD linker. Zig 0.16.0's self-hosted
    # ELF linker can't handle R_X86_64_PC64 in .sframe emitted by gcc >= 16.
    zig build -Doptimize=ReleaseSafe -Dxwayland -Dllvm --prefix "$srcdir/river-dist" install
}

package() {
    # Install Aqueous binaries
    install -Dm755 "$srcdir/publish/Aqueous/aqueous" "$pkgdir/usr/bin/aqueous"
    install -Dm755 "$srcdir/publish/Aqueous.OutputDaemon/aqueous-outputd" "$pkgdir/usr/bin/aqueous-outputd"

    # Install aqueous-compositor binary.
    install -Dm755 "$srcdir/river-dist/bin/aqueous-compositor" "$pkgdir/usr/bin/aqueous-compositor"
    # Legacy `riverdelta` symlink for one release of back-compat.
    ln -sf aqueous-compositor "$pkgdir/usr/bin/riverdelta"

    # Install aqueous-compositor share data (man pages, etc.)
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

    # systemd user unit for the output daemon. Input config no longer
    # needs a sidecar: the Aqueous WM applies [input.*] from wm.toml
    # directly to the compositor via the river_libinput_config_v1
    # protocol.
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-outputd.service" \
        "$pkgdir/usr/lib/systemd/user/aqueous-outputd.service"

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

    # In-tree compositor licenses (aqueous-compositor is a RiverDelta fork and
    # is multi-licensed; ship the license texts alongside Aqueous's own
    # license for attribution).
    if [[ -d "$srcdir/aqueous/compositor/LICENSES" ]]; then
        install -d "$pkgdir/usr/share/licenses/$pkgname/aqueous-compositor"
        cp -dr --no-preserve=ownership \
            "$srcdir/aqueous/compositor/LICENSES/." \
            "$pkgdir/usr/share/licenses/$pkgname/aqueous-compositor/"
    fi
}
