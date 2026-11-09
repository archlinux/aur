# Maintainer: Ignacio Galmarino <igalmarino@gmail.com>
#
# Kept in pila's repository (packaging/aur/pila-git); the AUR repository is a
# copy of this file and its .SRCINFO (makepkg --printsrcinfo > .SRCINFO).

pkgname=pila-git
pkgver=0.4.1.r327.g5383344
pkgrel=1
pkgdesc='A stacking Wayland compositor built on Smithay'
arch=(x86_64 aarch64)
url='https://github.com/igalmarino/pila'
license=(GPL-3.0-or-later)
# The libraries pila links (readelf -d), EGL (loaded at runtime through
# libglvnd), Xwayland, which pila starts for X11 apps, and bash for
# pila-session and pila-report.
depends=(
    bash
    glibc
    libgcc
    libglvnd
    libinput
    libxkbcommon
    mesa
    seatd
    systemd-libs
    xorg-xwayland
)
makedepends=(cargo git pkgconf)
optdepends=(
    'kitty: the default terminal (or foot, alacritty, ...)'
    'xdg-desktop-portal-wlr: screen sharing'
    'grim: screenshots'
    'slurp: picking the screen to share, and screenshot regions'
    'xdg-desktop-portal-gtk: file chooser and other portals'
    'wl-clipboard: Mod+Shift+S, a region of the screen to the clipboard (wl-copy)'
    'swaylock: locking the session'
    'libnotify: notifications from pila, such as an invalid config (notify-send)'
    'xdg-utils: opening links and files from programs such as kitty (xdg-open)'
    'pciutils: the GPU and its driver in pila-report (lspci)'
)
provides=(pila)
conflicts=(pila)
backup=(
    etc/xdg/xdg-desktop-portal/pila-portals.conf
    etc/xdg/xdg-desktop-portal-wlr/pila
)
source=("pila::git+$url.git")
sha256sums=(SKIP)

pkgver() {
    cd pila
    printf '%s.r%s.g%s' \
        "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd pila
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd pila
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

# No check(): the tests start pila headless, which needs EGL and Xwayland and
# can fail in a VM, container or clean chroot where pila itself would run;
# CI runs them on every push to main, which is what this package builds.

package() {
    cd pila
    # The same files, paths and session entry as a hand install.
    PREFIX=/usr DESTDIR="$pkgdir" scripts/install --no-build
    install -Dm644 -t "$pkgdir/usr/share/doc/pila" README.md config.example.toml \
        docs/MANUAL.md docs/IPC.md
}
