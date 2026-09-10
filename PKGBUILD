# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>
# Maintainer: Caroline Snyder <hirpeng@gmail.com>
pkgname=aqueous
pkgbase=aqueous
pkgver=0.7.0
pkgrel=1
pkgdesc="Aqueous single-process Wayland compositor"
arch=('x86_64' 'aarch64')
url="https://github.com/Seafoam-Labs/Aqueous"
license=('GPL3' 'MIT' 'custom:PX')
depends=('freetype2' 'wayland' 'wayland-protocols>=1.49' 'libxkbcommon' 'libinput'
         'pixman' 'libdrm' 'libevdev'
         'dms-shell' 'libdecor' 'grim' 'slurp' 'xorg-xwayland'
         'xdg-desktop-portal' 'pipewire-audio' 'wireplumber' 'libinih' 'wl-clipboard'
         'xdg-desktop-portal-gtk' 'libnotify' 'glib2' 'fontconfig'
         # uwsm manages the session lifecycle (env export, graphical-session.target,
         # clean teardown). The aqueous.desktop session entry execs `uwsm start`.
         'uwsm'
         'mesa' 'systemd-libs' 'seatd' 'libdisplay-info' 'libliftoff'
         'lcms2' 'vulkan-icd-loader' 'libxcb' 'xcb-util-errors' 'xcb-util-wm' 'xcb-util-renderutil')
makedepends=('python' 'shaderc' 'clang' 'lld' 'llvm'
             'git' 'curl' 'patch' 'scdoc' 'wayland-protocols>=1.49' 'pkgconf'
             'meson' 'ninja' 'glslang' 'vulkan-headers' 'hwdata' 'zig>=0.16')
# Helper integration checks exercise org.gnome.desktop.interface via gsettings.
checkdepends=('jq' 'python' 'ripgrep' 'qt6-declarative' 'gsettings-desktop-schemas')
optdepends=('greetd-dms-greeter-bin: recommended display manager / login greeter'
            'greetd: alternative minimal login manager for tuigreet'
            'ghostty: recommended terminal emulator'
            'nemo: recommended file manager'
            'firefox: web browser'
            'qt5ct: synchronize the Aqueous desktop font with Qt 5 applications'
            'qt6ct: synchronize the Aqueous desktop font with Qt 6 applications')
conflicts=('aqueous-git' 'aqueous-bin' 'aqueous-git-intel' 'aqueous-git-dms')
install=aqueous.install
backup=('etc/xdg/xdg-desktop-portal-aqueous/config'
        'etc/xdg/menus/aqueous-applications.menu')
source=(
    "aqueous::git+${url}.git#tag=v${pkgver}"
    "wlroots-0.20.2.tar.gz::https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.20.2/wlroots-0.20.2.tar.gz"
    "xdg-desktop-portal-wlr-0.8.4.tar.gz::https://github.com/emersion/xdg-desktop-portal-wlr/archive/refs/tags/v0.8.4.tar.gz"
)
sha256sums=('a8aabfbde5f71132a0c963f970322e66bb2505fa5d7e12e512265e1360cbf68e'
            '972c7ac44b17828f4702bfae7cd8347346a3fb5b2c1076cfa2c3fcedac5ec343'
            '3122966d46ab108f505525bcb2498f9121b446ee8438fbfceb73a7a1fa1ad400')

prepare() {
    patch --fuzz=0 -d "$srcdir/xdg-desktop-portal-wlr-0.8.4" -Np1 \
        -i "$srcdir/aqueous/packaging/portal/0001-rename-backend-for-aqueous.patch"
}

build() {
    # Standalone settings, including its embedded configuration backend.
    ZIG_GLOBAL_CACHE_DIR="$srcdir/aqueous-settings-zig-global" \
    ZIG_LOCAL_CACHE_DIR="$srcdir/aqueous-settings-zig-local" \
        zig build --build-file "$srcdir/aqueous/settingsApplication/build.zig" \
        -Dcpu=baseline -Doptimize=ReleaseSafe --prefix "$srcdir/aqueous-settings-dist"

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

    msg2 "Building bundled xdg-desktop-portal-aqueous 0.8.4..."
    sh "$srcdir/aqueous/packaging/portal/build-aqueous-portal.sh" \
        "$srcdir/xdg-desktop-portal-wlr-0.8.4" \
        "$srcdir/aqueous-portal-build" \
        "$srcdir/aqueous-portal-dist"
    msg2 "Building DMS portal chooser..."
    ZIG_GLOBAL_CACHE_DIR="$srcdir/aqueous-plugin-zig-global" \
    ZIG_LOCAL_CACHE_DIR="$srcdir/aqueous-portal-chooser-cache" \
        zig build --build-file "$srcdir/aqueous/packaging/portal/bridge/build.zig" \
        -Dcpu=baseline -Doptimize=ReleaseSafe --prefix "$srcdir/aqueous-portal-chooser-dist"

}

check() {
    ZIG_GLOBAL_CACHE_DIR="$srcdir/aqueous-settings-zig-global" \
    ZIG_LOCAL_CACHE_DIR="$srcdir/aqueous-settings-zig-local" \
        zig build --build-file "$srcdir/aqueous/settingsApplication/build.zig" test test-driver -Dmodel-only=true --prefix "$srcdir/aqueous-settings-tests"
    AQUEOUS_SETTINGS_BINARY="$srcdir/aqueous-settings-dist/bin/aqueous-settings" \
        "$srcdir/aqueous/settingsApplication/tests/test-packaging.sh"
    "$srcdir/aqueous/settingsApplication/tests/test-backend.sh" "$srcdir/aqueous-settings-tests/bin/aqueous-backend-test"

    python3 "$srcdir/aqueous/packaging/tests/test-dms-git-packaging.py"
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
    if [[ ! -x "$srcdir/aqueous-portal-dist/usr/lib/aqueous/xdg-desktop-portal-aqueous" ]]; then
        error "build output is missing required portal backend"
        return 1
    fi
    cmp "$srcdir/aqueous-dist/lib/aqueous/libwlroots-0.20.so" \
        "$srcdir/aqueous/compositor/.deps/wlroots-render-hook/lib/libwlroots-0.20.so"
    readelf -d "$srcdir/aqueous-dist/bin/aqueous" |
        grep -F '$ORIGIN/../lib/aqueous' >/dev/null
    if readelf -d "$srcdir/aqueous-dist/bin/aqueous" |
        grep -i 'scenefx' >/dev/null; then
        error "compositor still links SceneFX"
        return 1
    fi

    "$srcdir/aqueous/packaging/tests/test-portal-chooser.sh" \
        "$srcdir/aqueous-portal-chooser-dist/bin/aqueous-dms-portal-chooser"
    "$srcdir/aqueous/packaging/tests/test-portal-packaging.sh" \
        "$srcdir/aqueous-portal-dist/usr/lib/aqueous/xdg-desktop-portal-aqueous"
}

package() {
    AQUEOUS_SETTINGS_BINARY="$srcdir/aqueous-settings-dist/bin/aqueous-settings" \
        DESTDIR="$pkgdir" PREFIX=/usr "$srcdir/aqueous/settingsApplication/packaging/install.sh"

    # Install the compositor/window-manager and inspection/layout client.
    install -Dm755 "$srcdir/aqueous-dist/bin/aqueous" "$pkgdir/usr/bin/aqueous"
    install -Dm755 "$srcdir/aqueous-dist/bin/aqueousctl" "$pkgdir/usr/bin/aqueousctl"
    install -Dm755 "$srcdir/aqueous-dist/lib/aqueous/libwlroots-0.20.so" \
        "$pkgdir/usr/lib/aqueous/libwlroots-0.20.so"
    install -Dm755 "$srcdir/aqueous-portal-dist/usr/lib/aqueous/xdg-desktop-portal-aqueous" \
        "$pkgdir/usr/lib/aqueous/xdg-desktop-portal-aqueous"

    # Install compositor share data (man pages and protocol ABI metadata).
    if [ -d "$srcdir/aqueous-dist/share" ]; then
        install -d "$pkgdir/usr/share"
        cp -dr --no-preserve=ownership "$srcdir/aqueous-dist/share/"* "$pkgdir/usr/share/"
    fi

    # Install Aqueous packaging scripts and config
    install -Dm755 "$srcdir/aqueous/packaging/aqueous-init" "$pkgdir/usr/bin/aqueous-init"
    install -Dm755 "$srcdir/aqueous/packaging/aqueous-wm.sh" "$pkgdir/usr/bin/aqueous-wm"
    install -Dm644 "$srcdir/aqueous/aqueous.desktop" "$pkgdir/usr/share/wayland-sessions/aqueous.desktop"

    # uwsm environment file. uwsm's env preloader scans the XDG config
    # hierarchy (NOT /etc/uwsm/) for uwsm/env-aqueous (the -aqueous suffix
    # matches DesktopNames=Aqueous), sources it before launching the compositor
    # and exports the static toolkit/backend hints into the systemd --user /
    # D-Bus environment, so user-unit-launched apps inherit them too.
    install -Dm644 "$srcdir/aqueous/packaging/uwsm/env-aqueous" \
        "$pkgdir/etc/xdg/uwsm/env-aqueous"
    install -Dm644 "$srcdir/aqueous/packaging/menus/aqueous-applications.menu" \
        "$pkgdir/etc/xdg/menus/aqueous-applications.menu"

    # xdg-desktop-portal routing config. Pins ScreenCast/Screenshot to the
    # bundled Aqueous backend so screen sharing works out of the box and is
    # not silently won by a competing backend (cosmic/gtk).
    # Installed system-wide; the 'aqueous' filename stem is applied because the
    # session sets XDG_CURRENT_DESKTOP=Aqueous (see packaging/aqueous-init).
    AQUEOUS_PORTAL_CHOOSER_BINARY="$srcdir/aqueous-portal-chooser-dist/bin/aqueous-dms-portal-chooser" \
        DESTDIR="$pkgdir" sh "$srcdir/aqueous/packaging/portal/install-dms-chooser.sh"
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-portals.conf" \
        "$pkgdir/usr/share/xdg-desktop-portal/aqueous-portals.conf"
    install -Dm644 "$srcdir/aqueous/packaging/portal/aqueous.portal" \
        "$pkgdir/usr/share/xdg-desktop-portal/portals/aqueous.portal"
    install -Dm644 "$srcdir/aqueous/packaging/portal/org.freedesktop.impl.portal.desktop.aqueous.service" \
        "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.aqueous.service"
    install -Dm644 "$srcdir/aqueous/packaging/portal/xdg-desktop-portal-aqueous.service" \
        "$pkgdir/usr/lib/systemd/user/xdg-desktop-portal-aqueous.service"
    install -Dm644 "$srcdir/xdg-desktop-portal-wlr-0.8.4/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/xdg-desktop-portal-wlr/LICENSE"
    DESTDIR="$pkgdir" sh "$srcdir/aqueous/packaging/install-dms-wm-config.sh"
    install -Dm644 "$srcdir/aqueous/outputs.toml" "$pkgdir/etc/xdg/aqueous/outputs.toml"
    install -Dm644 "$srcdir/aqueous/outputs.toml" "$pkgdir/usr/share/aqueous/outputs.toml"

    # Session wrapper target. graphical-session.target is static
    # (RefuseManualStart) and xdg-desktop-portal.service has
    # Requisite=graphical-session.target, so the portal cannot start until the
    # target is active. aqueous-init starts this wrapper (which Requires/BindsTo
    # graphical-session.target) to activate it legitimately and tear it down on
    # logout — making the portal (and flameshot/screencast) work out of the box.
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-session.target" \
        "$pkgdir/usr/lib/systemd/user/aqueous-session.target"

    # DMS as a graphical-session user unit. The unit's XDG_CURRENT_DESKTOP
    # condition restricts it to Aqueous even though graphical-session.target is
    # shared by every desktop and compositor in the user's systemd manager.
    install -Dm644 "$srcdir/aqueous/packaging/aqueous-dms.service" \
        "$pkgdir/usr/lib/systemd/user/aqueous-dms.service"
    install -d "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants"
    ln -s ../aqueous-dms.service \
        "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants/aqueous-dms.service"

    # tmpfiles snippet: materialises per-user state/cache/config dirs at
    # login via systemd-tmpfiles --user.
    install -Dm644 "$srcdir/aqueous/packaging/aqueous.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/aqueous.conf"

    install -Dm644 "$srcdir/aqueous/packaging/udev/70-aqueous-uaccess.rules" \
        "$pkgdir/usr/lib/udev/rules.d/70-aqueous-uaccess.rules"

    # Default Ghostty config (seeded only for new profiles by aqueous-init).
    install -Dm644 "$srcdir/aqueous/packaging/ghostty/config.ghostty" \
        "$pkgdir/usr/share/aqueous/ghostty/config.ghostty"

    # Wallpapers available for the DMS desktop.
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
