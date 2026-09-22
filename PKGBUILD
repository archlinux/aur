# Maintainer: MadGoatHaz
#
# RamSleuth v2 — PRECOMPILED binary AUR package (ramsleuth-bin):
# `yay -S ramsleuth-bin` / `makepkg -si` from packaging/ramsleuth-bin/ is
# the no-build install path. It DOWNLOADS the prebuilt binary tarball from
# the official GitHub Release (cut by the release workflow when the v$pkgver
# tag is cut) and installs it as-is — NO build, NO makedepends. This is the
# counterpart to ramsleuth (the stable SOURCE package that builds from the
# git tag) and ramsleuth-git (the bleeding-edge, branch-tracking dev package).
#
# The release asset (contract, fixed by the release workflow):
#   https://github.com/MadGoatHaz/RamSleuth/releases/download/v$pkgver/ramsleuth-$pkgver-x86_64.tar.zst
# with top-level dir ramsleuth-$pkgver/ containing:
#   bin/                          — the 6 release binaries
#   systemd/ramsleuth.service     — the frozen daemon unit
#   systemd/ramsleuth.preset      — the system-preset (enables the service)
#   scripts/install-ryzen-smu-dkms.sh — the shared pinned DKMS helper
#   install.sh                    — the self-contained transparency entrypoint
#   LICENSE                       — MIT (AUR license-compliance install path)
#   RamSleuth.desktop             — the application-menu entry (the filename
#                                   matches the GUI's Wayland app_id, C21-45)
#   ramsleuth-setup.sh            — the one-click setup helper (top-level; C21-17,
#                                   lands with the v2.2.0 re-cut)
#   90-ramsleuth-setup.policy     — the shared polkit policy (top-level; C21-17,
#                                   lands with the v2.2.0 re-cut)
#   icons/                        — the hicolor icon tree (8 sizes, installed
#                                   bare + NxN; top-level; C21-27, lands
#                                   with the v2.2.0 re-cut; C21-42)
#
# sha256sums pins that exact asset. AUR requires a real sha256 (no SKIP):
# the pin below is the real sha256 of the published v2.2.0 release tarball,
# finalized in C21-24b (it replaced the all-zeros fail-loud placeholder; the
# v2.1.1 pin, finalized in C20-06, is replaced by this bump). The three new
# top-level entries (ramsleuth-setup.sh, 90-ramsleuth-setup.policy,
# icons/) are in the v2.2.0 tarball by the C21-17/C21-27 contract;
# package() installs them
# only when present (the guard — an old-tarball build skips them cleanly).
#
# Mutual conflict: ramsleuth (source) and ramsleuth-bin (precompiled)
# install the identical file surface, so the user picks exactly one.
# conflicts=('ramsleuth') here; the source side's conflicts=('ramsleuth-bin')
# is added separately in C19-05b (avoids a packaging/ramsleuth/ file race).
#
# No-panic contract: installation never fails on the absence of the
# ryzen_smu module, AVX-512, or a display; after a bare install the
# daemon starts and serves N/A (DriverMissing) sections with exit 0.

pkgname=ramsleuth-bin
pkgver=2.2.1   # FIXED — the tarball is downloaded from the GitHub Release for this exact version
pkgrel=1
pkgdesc="Pure-Rust RAM latency/bandwidth telemetry: privileged daemon + unprivileged CLI/TUI/GUI clients (precompiled binary)"
arch=(x86_64)
url="https://github.com/MadGoatHaz/RamSleuth"
license=(MIT)
source=("https://github.com/MadGoatHaz/RamSleuth/releases/download/v$pkgver/ramsleuth-$pkgver-x86_64.tar.zst")
# Finalized in C21-24b: the real sha256 of the published v2.2.0 release
# asset, independently verified by download + sha256sum (the all-zeros
# fail-loud placeholder is gone — the pin is the asset hash itself).
#
sha256sums=('3b7449639d46ffd78b2fa0b149fec225326889c80bdf4044d19321201eb0746c')
install=ramsleuth-bin.install
conflicts=('ramsleuth')
depends=(libx11 libxkbcommon wayland libxrandr libxi libxcursor libxinerama mesa)

# No build(): the 6 binaries are prebuilt and pinned by sha256sums.
# No makedepends: nothing is compiled on the user's machine.

package() {
    cd "$srcdir/ramsleuth-$pkgver"

    # (1) the 6 prebuilt binaries (built by the release workflow)
    for bin in ramsleuth-daemon ramsleuth-client ramsleuth-tui \
               ramsleuth ramsleuth-bench ramsleuth-telemetry; do
        install -Dm755 "bin/$bin" "$pkgdir/usr/bin/$bin"
    done

    # (2) the frozen daemon unit — verbatim copy
    install -Dm644 "systemd/ramsleuth.service" \
        "$pkgdir/usr/lib/systemd/system/ramsleuth.service"

    # (3) the systemd preset — enables ramsleuth.service by default
    # (the single package-agnostic preset, shipped verbatim)
    install -Dm644 "systemd/ramsleuth.preset" \
        "$pkgdir/usr/lib/systemd/system-preset/ramsleuth.preset"

    # (4) the shared pinned ryzen_smu DKMS helper
    install -Dm755 "scripts/install-ryzen-smu-dkms.sh" \
        "$pkgdir/usr/bin/ramsleuth-install-ryzen-smu-dkms"

    # (5) the self-contained entrypoint — shipped for audit/re-run
    install -Dm755 "install.sh" "$pkgdir/usr/share/ramsleuth/install.sh"

    # (6) the MIT license — the AUR license-compliance install path
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ramsleuth-bin/LICENSE"

    # (7) the application-menu entry — at the tarball top level (staged as
    # RamSleuth.desktop by the release workflow; the filename matches the
    # GUI's Wayland app_id "RamSleuth" so KWin's app_id -> desktop-file match
    # resolves the taskbar icon, C21-45)
    install -Dm644 "RamSleuth.desktop" \
        "$pkgdir/usr/share/applications/RamSleuth.desktop"

    # (8) the one-click setup helper -> /usr/bin/ramsleuth-setup (0755), at the
    # tarball top level (the C21-17 contract: scripts/ramsleuth-setup.sh staged
    # as ramsleuth-setup.sh). GUARDED: the pre-C21-24 v2.1.1 tarball
    # predates this member (the v2.2.0 re-cut carries it), so a build against
    # the old tarball skips it cleanly — the no-panic contract: the install must
    # not fail on its absence.
    if [ -f "ramsleuth-setup.sh" ]; then
        install -Dm755 "ramsleuth-setup.sh" "$pkgdir/usr/bin/ramsleuth-setup"
    fi

    # (9) the shared polkit policy -> /usr/share/polkit-1/actions/90-ramsleuth-
    # setup.policy (0644), at the tarball top level (the C21-17 contract:
    # packaging/polkit/90-ramsleuth-setup.policy). GUARDED exactly as (8) for
    # the same old-tarball reason.
    if [ -f "90-ramsleuth-setup.policy" ]; then
        install -Dm644 "90-ramsleuth-setup.policy" \
            "$pkgdir/usr/share/polkit-1/actions/90-ramsleuth-setup.policy"
    fi

    # (10) the hicolor icon tree — the 8 sizes, installed to BOTH the bare
    # <size>/apps/ and the <size>x<size>/apps/ hicolor dirs (freedesktop
    # index.theme files that declare only the NxN dirs make KIconLoader skip
    # the bare dirs; a bare-only install shows a missing-icon placeholder in
    # the menu, C21-42) + the 48px legacy /usr/share/pixmaps/ramsleuth.png
    # fallback (the Icon=ramsleuth resolution; plan C21-25, C21-42), at the
    # tarball top level (the C21-27 contract: icons/ staged
    # preserving the hicolor layout). Every icon is ALSO installed under the
    # name RamSleuth.png (bare + NxN + pixmaps) — KWin's direct icon-name
    # fallback when the Wayland app_id "RamSleuth" is used verbatim as the
    # icon name (C21-45).
    # GUARDED exactly as (8)/(9) for the same old-tarball reason: the
    # pre-C21-24 v2.1.1 tarball predates this member (the v2.2.0 re-cut
    # carries it), so a build against the old tarball skips it
    # cleanly — the no-panic contract: the install must not fail on its
    # absence.
    for size in 16 24 32 48 64 128 256 512; do
        if [ -f "icons/hicolor/$size/apps/ramsleuth.png" ]; then
            install -Dm644 "icons/hicolor/$size/apps/ramsleuth.png" \
                "$pkgdir/usr/share/icons/hicolor/$size/apps/ramsleuth.png"
            install -Dm644 "icons/hicolor/$size/apps/ramsleuth.png" \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ramsleuth.png"
            # The app_id-named fallback (C21-45)
            install -Dm644 "icons/hicolor/$size/apps/ramsleuth.png" \
                "$pkgdir/usr/share/icons/hicolor/$size/apps/RamSleuth.png"
            install -Dm644 "icons/hicolor/$size/apps/ramsleuth.png" \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/RamSleuth.png"
        fi
    done
    if [ -f "icons/hicolor/48/apps/ramsleuth.png" ]; then
        install -Dm644 "icons/hicolor/48/apps/ramsleuth.png" \
            "$pkgdir/usr/share/pixmaps/ramsleuth.png"
        install -Dm644 "icons/hicolor/48/apps/ramsleuth.png" \
            "$pkgdir/usr/share/pixmaps/RamSleuth.png"
    fi

    # NOTE: the ramsleuth group is created on the TARGET system by the .install
    # pre_install/pre_upgrade hooks (package() runs in the build env, not the target).
}
