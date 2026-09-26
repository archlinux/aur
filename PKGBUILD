# Maintainer: MadGoatHaz
#
# RamSleuth v2 — PRECOMPILED binary AUR package (ramsleuth-bin):
# `yay -S ramsleuth-bin` / `makepkg -si` from packaging/ramsleuth-bin/ is
# the no-build install path. It DOWNLOADS the prebuilt binary tarball from
# the official GitHub Release (cut by the release workflow when the v$pkgver
# tag is cut) and installs it as-is — NO build, NO makedepends. This is the
# counterpart to ramsleuth (the stable SOURCE package that builds from the
# git tag).
#
# The release asset (contract, fixed by the release workflow):
#   https://github.com/MadGoatHaz/RamSleuth/releases/download/v$pkgver/ramsleuth-$pkgver-x86_64.tar.zst
# with top-level dir ramsleuth-$pkgver/ containing:
#   bin/                          — the 6 release binaries
#   systemd/ramsleuth.service     — the frozen daemon unit
#   systemd/ramsleuth.preset      — the system-preset (enables the service)
#   scripts/install-ryzen-smu-dkms.sh — the shared pinned DKMS helper
#   scripts/install-intel-dkms.sh — the Intel DKMS helper (staged like the
#                                   AMD one; present in the v2.4.6 tarball
#                                   per the INTEL-14 contract; GUARDED in
#                                   package(), step (11))
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
#   kernel/ramsleuth-intel/       — the in-repo ramsleuth_intel DKMS module
#                                   source tree (GPL-2.0-only; in the v2.4.6
#                                   tarball — no re-cut needed; package()
#                                   step (12) ships it to
#                                   /usr/share/ramsleuth-intel-dkms/src/)
#   packaging/ryzen-smu-dkms/     — the vendored ryzen_smu DKMS module
#   vendor/ryzen-smu/             source tree (the 6 module files frozen at
#                                 upstream d298366, GPL-2.0-only — a separate
#                                 work; + vendor/SUMS.sha256 + vendor/
#                                 NOTICE.md). Lands in the v2.4.6 re-cut (the
#                                 sha256sums pin below re-pins to the new
#                                 asset, per the standing policy); the
#                                 published v2.4.5 tarball predates it.
#                                 package() step (13) ships it to
#                                 /usr/share/ryzen-smu-dkms/vendor/ — the
#                                 installed path the AMD helper (step 4)
#                                 resolves as its offline vendored source
#                                 (C21-08/09: SUMS-verified, zero network)
#
# sha256sums pins that exact asset. AUR requires a real sha256 (no SKIP):
# the pin below is the real sha256 of the published v2.4.6 release tarball,
# re-cut to the v2.4.6 asset (the v2.4.5 pin, re-cut at the v2.4.5 release,
# is replaced by this re-cut; it replaced the v2.2.1 pin, finalized in
# C21-24b; that replaced the v2.1.1 pin, finalized in C20-06). The three new
# top-level entries (ramsleuth-setup.sh, 90-ramsleuth-setup.policy,
# icons/) are in the v2.4.6 tarball by the C21-17/C21-27 contract;
# package() installs them
# only when present (the guard — an old-tarball build skips them cleanly).
# The Intel helper is present in the v2.4.6 tarball (added by the 2.3.0
# re-cut per the INTEL-14 contract), so package() installs it from the
# current tarball; it is still guarded with an existence test for a build
# against a pre-2.3.0 tarball (the no-panic contract).
#
# Mutual conflict: ramsleuth (source) and ramsleuth-bin (precompiled)
# install the identical file surface, so the user picks exactly one.
# conflicts=('ramsleuth') here; the source side's conflicts=('ramsleuth-bin')
# is added separately in C19-05b (avoids a packaging/ramsleuth/ file race).
# The vendored ryzen_smu source is ALSO bundled by both main packages
# (package() step (13)) and would file-conflict with the standalone
# ryzen-smu-dkms extra, so the extra cannot coinstall with either:
# conflicts=('ryzen-smu-dkms') here, mutual (the extra lists both).
#
# No-panic contract: installation never fails on the absence of the
# ryzen_smu module, AVX-512, or a display; after a bare install the
# daemon starts and serves N/A (DriverMissing) sections with exit 0.

pkgname=ramsleuth-bin
pkgver=2.4.6   # FIXED — the tarball is downloaded from the GitHub Release for this exact version
pkgrel=1
pkgdesc="Pure-Rust RAM latency/bandwidth telemetry: privileged daemon + unprivileged CLI/TUI/GUI clients (precompiled binary)"
arch=(x86_64)
url="https://github.com/MadGoatHaz/RamSleuth"
license=(MIT GPL-2.0-only)
source=("https://github.com/MadGoatHaz/RamSleuth/releases/download/v$pkgver/ramsleuth-$pkgver-x86_64.tar.zst")
# Re-cut to v2.4.6: the real sha256 of the published v2.4.6 release asset,
# independently verified by download + sha256sum (sidecar match; the pin is
# the asset hash itself; the v2.4.5 placeholder pin is replaced — that
# asset predates the bundled ryzen_smu vendor tree).
#
sha256sums=('ef062e0b0d673030e1aec346c30313ba6f0a0474ce34fc0c0b26784fc34b2818')
install=ramsleuth-bin.install
# The in-repo ramsleuth_intel DKMS source ships bundled (package() step (12))
# and would file-conflict with the standalone ramsleuth-intel-dkms extra, so the
# two cannot coinstall (pacman refuses; the user picks one). The vendored
# ryzen_smu source ships bundled too (package() step (13)) and would
# file-conflict with the standalone ryzen-smu-dkms extra, so the two cannot
# coinstall either (the conflict is mutual: ryzen-smu-dkms lists both main
# packages).
conflicts=('ramsleuth' 'ramsleuth-intel-dkms' 'ryzen-smu-dkms')
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

    # (11) the Intel DKMS helper -> /usr/bin/ramsleuth-install-intel-dkms (0755),
    # staged in the tarball like the AMD helper in (4) (scripts/). Present in
    # the v2.4.6 tarball (the sha256-pinned asset; added by the 2.3.0 re-cut
    # per the INTEL-14 contract). Still GUARDED with an existence test: a
    # build against a pre-2.3.0 tarball skips it with a note rather than
    # failing — the no-panic contract (the reverse of the (8)/(9)/(10)
    # old-tarball case).
    if [ -f "scripts/install-intel-dkms.sh" ]; then
        install -Dm755 "scripts/install-intel-dkms.sh" \
            "$pkgdir/usr/bin/ramsleuth-install-intel-dkms"
    else
        echo "NOTE: release tarball lacks scripts/install-intel-dkms.sh (pre-2.3.0 re-cut); skipping the Intel DKMS helper install"
    fi

    # (12) The in-repo ramsleuth_intel DKMS module source tree ->
    # /usr/share/ramsleuth-intel-dkms/src/ — the exact path the Intel helper
    # (step 11) resolves as its installed copy (no network, no upstream pin:
    # the module lives in this repo, unlike the AMD vendored ryzen_smu).
    # The v2.4.6 release tarball carries kernel/ramsleuth-intel/ (the 4 files
    # dkms.conf/Makefile/ramsleuth_intel.c/README.md). GUARDED with an existence
    # test: a build against an older tarball without the tree skips it cleanly —
    # the no-panic contract; the per-file guard covers 'Makefile if present'.
    if [ -d "kernel/ramsleuth-intel" ]; then
        local f
        for f in dkms.conf Makefile ramsleuth_intel.c README.md; do
            if [ -f "kernel/ramsleuth-intel/$f" ]; then
                install -Dm644 "kernel/ramsleuth-intel/$f" \
                    "$pkgdir/usr/share/ramsleuth-intel-dkms/src/$f"
            fi
        done
    fi

    # (13) The vendored ryzen_smu DKMS module source tree ->
    # /usr/share/ryzen-smu-dkms/vendor/ryzen-smu/ — the exact installed path the
    # AMD helper (step 4) resolves as its offline vendored source (C21-08/09:
    # vendor-first, every file verified against the sibling vendor/SUMS.sha256
    # before any build — zero network; this is what makes the in-app one-click
    # work on a clean ramsleuth-bin install without the extra). The release
    # tarball carries packaging/ryzen-smu-dkms/vendor/ (the 6 module files
    # frozen at upstream d298366 + SUMS.sha256 + NOTICE.md) by the release
    # workflow contract; it lands in the v2.4.6 re-cut (the sha256sums pin
    # above re-pins to the new asset). GUARDED with an existence test: a
    # build against the published v2.4.5 tarball (pre-re-cut, no vendor tree)
    # skips it cleanly — the no-panic contract; the per-file guards cover
    # each file present in the tarball.
    if [ -d "packaging/ryzen-smu-dkms/vendor/ryzen-smu" ]; then
        local f
        for f in LICENSE Makefile dkms.conf drv.c smu.c smu.h; do
            if [ -f "packaging/ryzen-smu-dkms/vendor/ryzen-smu/$f" ]; then
                install -Dm644 "packaging/ryzen-smu-dkms/vendor/ryzen-smu/$f" \
                    "$pkgdir/usr/share/ryzen-smu-dkms/vendor/ryzen-smu/$f"
            fi
        done
        if [ -f "packaging/ryzen-smu-dkms/vendor/SUMS.sha256" ]; then
            install -Dm644 "packaging/ryzen-smu-dkms/vendor/SUMS.sha256" \
                "$pkgdir/usr/share/ryzen-smu-dkms/vendor/SUMS.sha256"
        fi
        if [ -f "packaging/ryzen-smu-dkms/vendor/NOTICE.md" ]; then
            install -Dm644 "packaging/ryzen-smu-dkms/vendor/NOTICE.md" \
                "$pkgdir/usr/share/ryzen-smu-dkms/vendor/NOTICE.md"
        fi
    fi

    # NOTE: the ramsleuth group is created on the TARGET system by the .install
    # pre_install/pre_upgrade hooks (package() runs in the build env, not the target).
}
