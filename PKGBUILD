# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=aqueous-git
pkgbase=aqueous
pkgver=0.0.1.r4.gf159bda
pkgrel=4
pkgdesc="Aqueous Wayland window manager (River-based) with Noctalia bar"
arch=('x86_64' 'aarch64')
url="https://github.com/Seafoam-Labs/Aqueous"
license=('GPL3')
depends=('wayland' 'wayland-protocols' 'libxkbcommon' 'libinput'
         'pixman' 'libdrm' 'libevdev' 'river' 'wlr-randr'
         'noctalia-shell' 'libdecor' 'grim')
optdepends=('tuigreet: TUI greeter for greetd (recommended login path)'
            'greetd: minimal login manager for tuigreet'
            'aqueous-greetd-config: opinionated greetd+tuigreet preset for Aqueous'
            'ghostty: recommended terminal emulator'
            'nemo: recommended file manager'
            'firefox: web browser')
makedepends=('dotnet-sdk-10.0' 'clang' 'zlib' 'krb5' 'git')
provides=('aqueous')
conflicts=('aqueous')
install=aqueous.install
source=("aqueous::git+${url}.git")
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
    local rid; rid=$(_rid_map)
    cd "$srcdir/aqueous"
    for proj in Aqueous/Aqueous.csproj Aqueous.InputDaemon/Aqueous.InputDaemon.csproj Aqueous.OutputDaemon/Aqueous.OutputDaemon.csproj; do
        local name; name=$(basename "$proj" .csproj)
        dotnet publish "$proj" \
            -c Release \
            -r "$rid" \
            --self-contained true \
            /p:PublishAot=true \
            -o "$srcdir/publish/$name"
    done
}

package() {
    # AOT publish output is a single self-contained ELF per project; install
    # the binaries directly to /usr/bin.
    install -Dm755 "$srcdir/publish/Aqueous/aqueous" \
        "$pkgdir/usr/bin/aqueous"
    install -Dm755 "$srcdir/publish/Aqueous.InputDaemon/aqueous-inputd" \
        "$pkgdir/usr/bin/aqueous-inputd"
    install -Dm755 "$srcdir/publish/Aqueous.OutputDaemon/aqueous-outputd" \
        "$pkgdir/usr/bin/aqueous-outputd"

    # River `-c` init wrapper: applies persisted output config before
    # Aqueous draws its first frame, then forks the output daemon.
    install -Dm755 "$srcdir/aqueous/packaging/aqueous-init" \
        "$pkgdir/usr/bin/aqueous-init"

    # Session launcher.
    install -Dm755 "$srcdir/aqueous/packaging/aqueous-wm.sh" \
        "$pkgdir/usr/bin/aqueous-wm"

    # Wayland session entry (DM/greeter picks this up).
    install -Dm644 "$srcdir/aqueous/aqueous.desktop" \
        "$pkgdir/usr/share/wayland-sessions/aqueous.desktop"

    # Default config — system-wide. The launcher seeds the user copy on
    # first login if ~/.config/aqueous/wm.toml is absent.
    install -Dm644 "$srcdir/aqueous/wm.toml" \
        "$pkgdir/etc/xdg/aqueous/wm.toml"
    install -Dm644 "$srcdir/aqueous/wm.toml" \
        "$pkgdir/usr/share/aqueous/wm.toml"

    # systemd user units for the input daemon (optional; launcher falls
    # back to spawning the daemon directly if the unit is inactive).
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-inputd.service" \
        "$pkgdir/usr/lib/systemd/user/aqueous-inputd.service"
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-inputd.socket" \
        "$pkgdir/usr/lib/systemd/user/aqueous-inputd.socket"
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-outputd.service" \
        "$pkgdir/usr/lib/systemd/user/aqueous-outputd.service"

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
}
