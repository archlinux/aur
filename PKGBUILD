# Maintainer: vendiOS <layoguerrero@gmail.com>
pkgname=vendi-git
_pkgname=vendi
# vendiOS uses Minecraft-style snapshot versions: YYwWW<letter>
#   26w25a = 2026, ISO week 25, snapshot a   (preview, pre-v0.1.1)
# Bump this by hand each snapshot (a → b → c …); the letter resets to 'a' at
# the start of each ISO week (Monday). Stable releases will drop the snapshot
# scheme for plain semver (0.1.1, …).
#   26w24c: touchscreen (wl_touch), blur toggle, per-window opacity
#   26w25a: real output-scale rendering + wp_fractional_scale_v1, layer
#           re-arrange + wallpaper fix on live scale change, vendi display CLI,
#           both bars tint with the theme
pkgver=26w25a
pkgrel=1
pkgdesc="vendiOS preview snapshot — compositor, bar, lock, installer, CLI (pre-v0.1.1)"
arch=('x86_64')
url="https://github.com/VendavalSC/vendiOS"
license=('MIT')
depends=(
    'bash'
    'coreutils'
    'util-linux'
    'parted'
    'dosfstools'
    'e2fsprogs'
    'btrfs-progs'
    'arch-install-scripts'
    'limine'
    'efibootmgr'
    'reflector'
    'fastfetch'
    # vendiwm runtime dependencies
    'libxkbcommon'
    'libinput'
    'mesa'
    'seatd'
    'wayland'
    # vendibar runtime dependencies
    'gtk4'
    'gtk4-layer-shell'
)
makedepends=(
    'git'
    'rust'
    'cargo'
    # vendiwm build dependencies
    'pkgconf'
    'libxkbcommon'
    'libinput'
    'mesa'
    'seatd'
    'wayland'
    'systemd'           # for libudev
    # vendibar build dependencies
    'gtk4'
    'gtk4-layer-shell'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

# NB: no pkgver() — snapshot versions are set by hand above (Minecraft-style),
# not auto-derived from the git revision.

build() {
    cd "${_pkgname}/src"
    # Build the full vendi desktop: compositor, control plane, bar, launcher.
    cargo build --release --locked \
        -p vendiwm \
        -p vendi-ctl \
        -p vendi-demo \
        -p vendibar \
        -p vendi-menu
}

package() {
    cd "${_pkgname}"

    # Bash CLIs (installer / boot helpers / session launcher / dispatcher)
    install -Dm755 archiso/airootfs/usr/bin/vendi          "${pkgdir}/usr/bin/vendi"
    install -Dm755 archiso/airootfs/usr/bin/vendi-install  "${pkgdir}/usr/bin/vendi-install"
    install -Dm755 archiso/airootfs/usr/bin/vendi-boot     "${pkgdir}/usr/bin/vendi-boot"
    install -Dm755 archiso/airootfs/usr/bin/vendi-welcome  "${pkgdir}/usr/bin/vendi-welcome"
    install -Dm755 archiso/airootfs/usr/bin/vendi-session  "${pkgdir}/usr/bin/vendi-session"
    install -Dm755 archiso/airootfs/usr/bin/vendi-launcher "${pkgdir}/usr/bin/vendi-launcher"

    # Rust binaries (compositor + control plane + bar)
    install -Dm755 src/target/release/vendiwm     "${pkgdir}/usr/bin/vendiwm"
    install -Dm755 src/target/release/vendi-ctl   "${pkgdir}/usr/bin/vendi-ctl"
    install -Dm755 src/target/release/vendi-demo  "${pkgdir}/usr/bin/vendi-demo"
    install -Dm755 src/target/release/vendibar    "${pkgdir}/usr/bin/vendibar"
    install -Dm755 src/target/release/vendi-menu  "${pkgdir}/usr/bin/vendi-menu"

    # Bash libraries
    install -Dm644 archiso/airootfs/usr/lib/vendi/ui.sh     "${pkgdir}/usr/lib/vendi/ui.sh"
    install -Dm644 archiso/airootfs/usr/lib/vendi/disk.sh   "${pkgdir}/usr/lib/vendi/disk.sh"
    install -Dm644 archiso/airootfs/usr/lib/vendi/system.sh "${pkgdir}/usr/lib/vendi/system.sh"

    # Desktop configs + assets (system-wide). These are what make the bar,
    # lock, themes and portals actually work — without them the quickshell
    # bars report "could not find config directory". Shipping them here means
    # `yay -S vendi-git` updates the whole desktop, no reinstall needed.
    install -d "${pkgdir}/etc/xdg/quickshell" "${pkgdir}/usr/share"
    # vendibar-pro: canonical source is src/vendibar-pro (the airootfs copy is a
    # build-synced duplicate); install straight from the source to avoid drift.
    cp -a src/vendibar-pro "${pkgdir}/etc/xdg/quickshell/vendibar-pro"
    cp -a archiso/airootfs/etc/xdg/quickshell/vendilock "${pkgdir}/etc/xdg/quickshell/vendilock"
    cp -a archiso/airootfs/etc/xdg/waybar     "${pkgdir}/etc/xdg/waybar"
    [ -d archiso/airootfs/etc/xdg/xdg-desktop-portal-wlr ] && \
        cp -a archiso/airootfs/etc/xdg/xdg-desktop-portal-wlr "${pkgdir}/etc/xdg/xdg-desktop-portal-wlr"
    [ -d archiso/airootfs/etc/xdg-desktop-portal ] && \
        cp -a archiso/airootfs/etc/xdg-desktop-portal "${pkgdir}/etc/xdg-desktop-portal"
    [ -f archiso/airootfs/etc/xdg/mimeapps.list ] && \
        install -Dm644 archiso/airootfs/etc/xdg/mimeapps.list "${pkgdir}/etc/xdg/mimeapps.list"

    # branding + plymouth theme
    cp -a archiso/airootfs/usr/share/vendios "${pkgdir}/usr/share/vendios"
    [ -d archiso/airootfs/usr/share/plymouth/themes/vendios ] && {
        install -d "${pkgdir}/usr/share/plymouth/themes"
        cp -a archiso/airootfs/usr/share/plymouth/themes/vendios \
            "${pkgdir}/usr/share/plymouth/themes/vendios"
    }
}
