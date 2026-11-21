# Maintainer: Ignacio Galmarino <igalmarino@gmail.com>
#
# Kept in Pila's repository (packaging/aur/pila-git); the AUR repository is a
# copy of this file and its .SRCINFO (makepkg --printsrcinfo > .SRCINFO).

pkgname=pila-git
pkgver=0.8.1.r750.gb593726
pkgrel=1
pkgdesc='A stacking Wayland compositor built on Smithay'
arch=(x86_64 aarch64)
url='https://github.com/igalmarino/pila'
license=(GPL-3.0-or-later)
# The libraries Pila links (readelf -d), EGL (loaded at runtime through
# libglvnd) and bash for pila-session and pila-report. Xwayland, which Pila
# starts for X11 apps, is optional: without it, there are none.
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
)
makedepends=(cargo git pkgconf)
# The desktop's tools (bar, launcher, notifications, lock, the keys' programs)
# are pila-desktop's (packaging/aur/pila-desktop): this is the compositor
# alone, and the defaults that aren't installed are skipped.
optdepends=(
    'pila-desktop: the bar, launcher, notifications, lock and keys of the default configuration'
    'xorg-xwayland: X11 apps (games, older programs)'
    'xdg-desktop-portal-wlr: screen sharing'
    'xdg-desktop-portal-gtk: file chooser and other portals'
    'xdg-utils: opening links and files from programs such as kitty (xdg-open)'
)
provides=(pila)
conflicts=(pila)
backup=(
    etc/xdg/xdg-desktop-portal/pila-portals.conf
    etc/xdg/xdg-desktop-portal-wlr/pila
)
# Not stripped: a crash is logged with a backtrace (`main::log_panics`), whose
# frames need the function names (about 9 MB of 26).
options=(!strip)
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
    # Cargo checks rust-version only after fetching the dependencies, and an
    # older one fails earlier on smithay's manifests with an unrelated error
    # ("feature `edition2024` is required"): say what's wrong here instead.
    local need have
    need="$(sed -n 's/^rust-version = "\(.*\)"/\1/p' Cargo.toml)"
    have="$(cargo --version | cut -d' ' -f2)"
    if [[ "$(printf '%s\n' "$need" "$have" | sort -V | head -n1)" != "$need" ]]; then
        error 'pila needs Rust %s or newer, found %s (with rustup: rustup update stable)' \
            "$need" "$have"
        return 1
    fi
    local target
    target="$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --locked --target "$target"
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
