# Maintainer: MadGoatHaz
#
# RamSleuth v2 — STABLE source AUR package (ramsleuth):
# `yay -S ramsleuth` / `makepkg -si` from packaging/ramsleuth/ is the
# community install path. It builds from the OFFICIAL TAGGED source
# (the git tag v$pkgver) — NOT the moving branch — so a release is a
# reproducible, auditable snapshot. This is the counterpart to
# ramsleuth-git (the bleeding-edge, branch-tracking dev package).
#
# Why a git-tag source (no release tarball, no sha256sums):
#   The AUR community package must build from source that EXISTS at
#   publish time. A release tarball only comes into existence AFTER the
#   tag is cut (chicken-and-egg). A git-tag source sidesteps this: the
#   tag is the source-of-truth pointer, makepkg clones the repo and
#   checks out that exact tag, and no sha256sums line is needed (git
#   sources are content-addressed by the tag, not checksummed). When the
#   next release is cut, only pkgver changes here.
#
# The "$pkgname::" prefix renames the cloned source dir to $srcdir/ramsleuth
# (the pkgname) — NOT the release-tarball layout RamSleuth-$pkgver. So
# build()/package() cd into "$srcdir/ramsleuth".
#
# Ships (identical surface to ramsleuth-git):
#   - 6 binaries -> /usr/bin: ramsleuth-daemon (the daemon-unit ExecStart),
#     ramsleuth-client, ramsleuth-tui, ramsleuth, ramsleuth-bench,
#     ramsleuth-telemetry (ramsleuth-protocol is lib-only — never installed)
#   - the frozen daemon unit systemd/ramsleuth.service -> /usr/lib/systemd/system/
#     (verbatim copy, never modified)
#   - the systemd preset -> /usr/lib/systemd/system-preset/ramsleuth.preset
#     (enables ramsleuth.service by default)
#   - the system group `ramsleuth` — THE ONE REAL INSTALL GAP: Group=ramsleuth
#     on the daemon unit fails to start without it (created by the .install hooks, idempotent)
#   - the shared pinned ryzen_smu DKMS helper -> /usr/bin/ramsleuth-install-ryzen-smu-dkms
#   - install.sh -> /usr/share/ramsleuth/install.sh (the self-contained transparency
#     artifact — AUR users can re-run/audit the full flow post-install)
#   - LICENSE -> /usr/share/licenses/ramsleuth/LICENSE (MIT compliance, AUR requirement)
#   - the application-menu entry -> /usr/share/applications/ramsleuth.desktop
#
# No-panic contract: installation never fails on the absence of
# the ryzen_smu module, AVX-512, or a display; after a bare install the
# daemon starts and serves N/A (DriverMissing) sections with exit 0.
#
# The C toolchain (cc/linker for the Rust build) comes from the makepkg
# base environment — AUR convention: base toolchain packages are not
# listed in makedepends. libxkbcommon is the only strict build-time link
# dep (xkbcommon-sys); the X11/Wayland/GL entries cover pkgconf probes
# plus the eframe 0.27 / winit dlopen + fallback runtime surface.

pkgname=ramsleuth
pkgver=2.1.1   # FIXED — taken from the git tag v$pkgver (no pkgver() — that belongs to ramsleuth-git)
pkgrel=1
pkgdesc="Pure-Rust RAM latency/bandwidth telemetry: privileged daemon + unprivileged CLI/TUI/GUI clients"
arch=(x86_64)
url="https://github.com/MadGoatHaz/RamSleuth"
license=(MIT)
# git-tag source: makepkg clones the repo and checks out the tag v$pkgver.
# The "$pkgname::" rename extracts to $srcdir/ramsleuth (see header note above).
source=("$pkgname::git+https://github.com/MadGoatHaz/RamSleuth.git#tag=v$pkgver")
install=ramsleuth.install
conflicts=('ramsleuth-bin')
makedepends=(rust cargo pkgconf libx11 libxkbcommon wayland wayland-protocols libxrandr libxi libxcursor libxinerama mesa)
depends=(libx11 libxkbcommon wayland libxrandr libxi libxcursor libxinerama mesa)

# No sha256sums: git-tag source, content-addressed by the tag (not checksummed).

build() {
    cd "$srcdir/ramsleuth"
    # --locked: build the committed pins verbatim (reproducible).
    cargo build --release --locked
}

package() {
    cd "$srcdir/ramsleuth"

    # (1) the 6 installable binaries
    for bin in ramsleuth-daemon ramsleuth-client ramsleuth-tui \
               ramsleuth ramsleuth-bench ramsleuth-telemetry; do
        install -Dm755 "target/release/$bin" "$pkgdir/usr/bin/$bin"
    done

    # (2) the frozen daemon unit — verbatim copy
    install -Dm644 "systemd/ramsleuth.service" \
        "$pkgdir/usr/lib/systemd/system/ramsleuth.service"

    # (3) the systemd preset — enables ramsleuth.service by default
    # (the single package-agnostic preset in the repo, shipped verbatim)
    install -Dm644 "packaging/ramsleuth-git/ramsleuth.preset" \
        "$pkgdir/usr/lib/systemd/system-preset/ramsleuth.preset"

    # (4) the ramsleuth-owned copy of the pinned ryzen_smu DKMS helper
    install -Dm755 "scripts/install-ryzen-smu-dkms.sh" \
        "$pkgdir/usr/bin/ramsleuth-install-ryzen-smu-dkms"

    # (5) the self-contained entrypoint — shipped for audit/re-run
    install -Dm755 "install.sh" "$pkgdir/usr/share/ramsleuth/install.sh"

    # (6) the MIT license — the AUR license-compliance install path
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ramsleuth/LICENSE"

    # (7) the application-menu entry — shared asset next to the preset
    install -Dm644 "packaging/ramsleuth-git/ramsleuth.desktop" \
        "$pkgdir/usr/share/applications/ramsleuth.desktop"

    # NOTE: the ramsleuth group is created on the TARGET system by the .install
    # pre_install/pre_upgrade hooks (package() runs in the build env, not the target).
}
