# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=aqueous
pkgbase=aqueous
pkgver=0.4.4
pkgrel=3
pkgdesc="Aqueous single-process Wayland compositor"
arch=('x86_64' 'aarch64')
url="https://github.com/Seafoam-Labs/Aqueous"
license=('GPL3')
depends=('wayland' 'wayland-protocols' 'libxkbcommon' 'libinput'
         'pixman' 'libdrm' 'libevdev'
         'noctalia' 'libdecor' 'grim' 'slurp' 'xorg-xwayland'
         'xdg-desktop-portal-wlr' 'wl-clipboard'
         'xdg-desktop-portal-gtk' 'libnotify'
         # uwsm manages the session lifecycle (env export, graphical-session.target,
         # clean teardown). The aqueous.desktop session entry execs `uwsm start`.
         'uwsm'
         'mesa' 'systemd-libs' 'seatd' 'libdisplay-info' 'libliftoff'
         'lcms2' 'vulkan-icd-loader' 'libxcb' 'xcb-util-errors' 'xcb-util-wm' 'xcb-util-renderutil')
makedepends=('clang' 'lld' 'llvm'
             'git' 'curl' 'patch' 'scdoc' 'wayland-protocols' 'pkgconf'
             'meson' 'ninja' 'glslang' 'vulkan-headers' 'hwdata' 'zig>=0.16')
optdepends=('noctalia-greeter: recommended display manager / login greeter'
            'greetd: alternative minimal login manager for tuigreet'
            'ghostty: recommended terminal emulator'
            'nemo: recommended file manager'
            'firefox: web browser'
            'wireplumber: volume/media key bindings (wpctl)')
conflicts=('aqueous-git' 'aqueous-bin')
install=aqueous.install
source=(
    "aqueous::git+${url}.git#tag=v${pkgver}"
    "wlroots-0.20.2.tar.gz::https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.20.2/wlroots-0.20.2.tar.gz"
)
sha256sums=('c813d6020eb29bc59b67987529f5c2b54e02aa4be005b749c1f5eadf203c24b1'
            '972c7ac44b17828f4702bfae7cd8347346a3fb5b2c1076cfa2c3fcedac5ec343')

build() {
    # Verify zig is new enough (the Aqueous compositor requires >= 0.16.0).
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

    cd "$srcdir/aqueous"

    # Build the Aqueous compositor/policy executable and inspection client.
    msg2 "Building Aqueous compositor..."
    cd "$srcdir/aqueous/compositor"
    # -Dllvm forces the LLVM backend + LLD linker. Zig 0.16.0's self-hosted
    # ELF linker can't handle R_X86_64_PC64 in .sframe emitted by gcc >= 16.
    # Keep the manuals deterministic in clean chroots. In-tree builds make
    # them optional when scdoc is absent, but packages must always document
    # both installed executables, including aqueousctl.
    AQUEOUS_WLROOTS_CACHE_DIR="$srcdir" \
        scripts/build-wlroots-render-hook.sh
    PKG_CONFIG_PATH="$PWD/.deps/wlroots-render-hook/lib/pkgconfig" \
    zig build -Dcpu=baseline -Doptimize=ReleaseSafe -Dxwayland -Dllvm \
        -Dman-pages=true \
        --prefix "$srcdir/aqueous-dist" install
}

check() {
    # aqueousctl and its protocol/manual are one feature: reject a partial
    # install tree before package() copies it into the package image.
    local required=(
        bin/aqueous
        bin/aqueousctl
        lib/aqueous/libwlroots-0.20.so
        share/man/man1/aqueousctl.1
        share/aqueous-protocols/stable/aqueous-window-info-v1.xml
    )
    local path
    for path in "${required[@]}"; do
        if [[ ! -e "$srcdir/aqueous-dist/$path" ]]; then
            error "build output is missing required file: $path"
            return 1
        fi
    done
    cmp "$srcdir/aqueous-dist/lib/aqueous/libwlroots-0.20.so" \
        "$srcdir/aqueous/compositor/.deps/wlroots-render-hook/lib/libwlroots-0.20.so"
    readelf -d "$srcdir/aqueous-dist/bin/aqueous" |
        grep -F '$ORIGIN/../lib/aqueous' >/dev/null
    if readelf -d "$srcdir/aqueous-dist/bin/aqueous" |
        grep -i 'scenefx' >/dev/null; then
        error "compositor still links SceneFX"
        return 1
    fi
}

package() {
    # Install the compositor/window-manager and read-only inspection client.
    install -Dm755 "$srcdir/aqueous-dist/bin/aqueous" "$pkgdir/usr/bin/aqueous"
    install -Dm755 "$srcdir/aqueous-dist/bin/aqueousctl" "$pkgdir/usr/bin/aqueousctl"
    install -Dm755 "$srcdir/aqueous-dist/lib/aqueous/libwlroots-0.20.so" \
        "$pkgdir/usr/lib/aqueous/libwlroots-0.20.so"

    # Install compositor share data (man pages and protocol ABI metadata).
    if [ -d "$srcdir/aqueous-dist/share" ]; then
        install -d "$pkgdir/usr/share"
        cp -dr --no-preserve=ownership "$srcdir/aqueous-dist/share/"* "$pkgdir/usr/share/"
    fi

    # Install Aqueous packaging scripts and config
    install -Dm755 "$srcdir/aqueous/packaging/aqueous-init" "$pkgdir/usr/bin/aqueous-init"
    install -Dm755 "$srcdir/aqueous/packaging/aqueous-wm.sh" "$pkgdir/usr/bin/aqueous-wm"
    install -Dm644 "$srcdir/aqueous/aqueous.desktop" "$pkgdir/usr/share/wayland-sessions/aqueous.desktop"

    # uwsm environment file. uwsm sources /etc/uwsm/env-aqueous (the -aqueous
    # suffix matches DesktopNames=Aqueous) before launching the compositor and
    # exports the static toolkit/backend hints into the systemd --user / D-Bus
    # environment, so user-unit-launched apps inherit them too.
    install -Dm644 "$srcdir/aqueous/packaging/uwsm/env-aqueous" \
        "$pkgdir/etc/uwsm/env-aqueous"

    # xdg-desktop-portal routing config. Pins ScreenCast/Screenshot to the
    # wlroots backend (xdg-desktop-portal-wlr) so screen sharing works out of
    # the box and is not silently won by a competing backend (cosmic/gtk).
    # Installed system-wide; the 'aqueous' filename stem is applied because the
    # session sets XDG_CURRENT_DESKTOP=Aqueous (see packaging/aqueous-init).
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-portals.conf" \
        "$pkgdir/usr/share/xdg-desktop-portal/aqueous-portals.conf"
    install -Dm644 "$srcdir/aqueous/wm.toml" "$pkgdir/etc/xdg/aqueous/wm.toml"
    install -Dm644 "$srcdir/aqueous/wm.toml" "$pkgdir/usr/share/aqueous/wm.toml"

    # Session wrapper target. graphical-session.target is static
    # (RefuseManualStart) and xdg-desktop-portal.service has
    # Requisite=graphical-session.target, so the portal cannot start until the
    # target is active. aqueous-init starts this wrapper (which Requires/BindsTo
    # graphical-session.target) to activate it legitimately and tear it down on
    # logout — making the portal (and flameshot/screencast) work out of the box.
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-session.target" \
        "$pkgdir/usr/lib/systemd/user/aqueous-session.target"

    # Noctalia shell as a graphical-session.target user unit. This brings the
    # SNI tray watcher (org.kde.StatusNotifierWatcher) up BEFORE
    # xdg-desktop-autostart.target, so tray apps autostarted by uwsm register
    # against a live watcher and their icons populate on first login. The
    # symlink in graphical-session.target.wants pulls it in on every session
    # with zero per-user action (mirrors how the rest of the session is wired).
    # Replaces the old [[exec]] noctalia block in wm.toml (which lost the
    # startup race because it launched the bar after Aqueous had already
    # started, post xdg-desktop-autostart.target).
    install -Dm644 "$srcdir/aqueous/packaging/noctalia.service" \
        "$pkgdir/usr/lib/systemd/user/noctalia.service"
    install -d "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants"
    ln -s ../noctalia.service \
        "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants/noctalia.service"

    # tmpfiles snippet: materialises per-user state/cache/config dirs at
    # login via systemd-tmpfiles --user.
    install -Dm644 "$srcdir/aqueous/packaging/aqueous.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/aqueous.conf"

    install -Dm644 "$srcdir/aqueous/packaging/udev/70-aqueous-uaccess.rules" \
        "$pkgdir/usr/lib/udev/rules.d/70-aqueous-uaccess.rules"

    # Default Noctalia (v5) config (seeded on first launch by aqueous-init when
    # the user has no ~/.config/noctalia/config.toml yet).
    install -Dm644 "$srcdir/aqueous/packaging/noctalia/config.toml" \
        "$pkgdir/usr/share/aqueous/noctalia/config.toml"

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

    # In-tree compositor licenses (the River-derived source is multi-licensed; ship the
    # license texts alongside Aqueous's own license for attribution).
    if [[ -d "$srcdir/aqueous/compositor/LICENSES" ]]; then
        install -d "$pkgdir/usr/share/licenses/$pkgname/compositor"
        cp -dr --no-preserve=ownership \
            "$srcdir/aqueous/compositor/LICENSES/." \
            "$pkgdir/usr/share/licenses/$pkgname/compositor/"
    fi

}
