# Maintainer: MadGoatHaz
#
# RamSleuth v2 — STABLE source AUR package (ramsleuth):
# `yay -S ramsleuth` / `makepkg -si` from packaging/ramsleuth/ is the
# community install path. It builds from the OFFICIAL TAGGED source
# (the git tag v$pkgver) — NOT the moving branch — so a release is a
# reproducible, auditable snapshot. This is the counterpart to
# ramsleuth-bin (the prebuilt binary package).
#
# Why a git source (no release tarball):
#   The AUR community package must build from source that EXISTS at
#   publish time. A release tarball only comes into existence AFTER the
#   tag is cut (chicken-and-egg). A git source sidesteps this. The source
#   is pinned to the IMMUTABLE v$pkgver release commit via the standard
#   VCS `#commit=` fragment (a bare `#tag=`/`#branch=` fragment is a
#   moving ref), with sha256sums the content-addressed checksum of the
#   pinned commit's `git archive` tarball — the form makepkg 7.x
#   generates for tag/commit-pinned git sources (makepkg -g); makepkg
#   7.x requires a *sums array entry per source and ignores any
#   non-standard pin variables.
#   When the next release is cut, update pkgver and the #commit= pin here.
#
# The "$pkgname::" prefix renames the cloned source dir to $srcdir/ramsleuth
# (the pkgname) — NOT the release-tarball layout RamSleuth-$pkgver. So
# build()/package() cd into "$srcdir/ramsleuth".
#
# Ships:
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
#   - the shared pinned ramsleuth_intel DKMS helper -> /usr/bin/ramsleuth-install-intel-dkms
#     (GUARDED: absent in pre-Intel tags, so a build against an older tag — e.g.
#     the current v2.2.1 source — skips it cleanly; the no-panic contract)
#   - install.sh -> /usr/share/ramsleuth/install.sh (the self-contained transparency
#     artifact — AUR users can re-run/audit the full flow post-install)
#   - LICENSE -> /usr/share/licenses/ramsleuth/LICENSE (MIT compliance, AUR requirement)
#   - the application-menu entry -> /usr/share/applications/RamSleuth.desktop
#   - the one-click setup helper scripts/ramsleuth-setup.sh -> /usr/bin/ramsleuth-setup
#     (the pkexec-able root helper; polkit is Arch base — no new runtime dep; plan C21-01)
#   - the shared polkit policy packaging/polkit/90-ramsleuth-setup.policy ->
#     /usr/share/polkit-1/actions/90-ramsleuth-setup.policy (the org.freedesktop.
#     ramsleuth.setup action; plan C21-02)
#   - the hicolor icon tree assets/icons/hicolor/<size>/apps/ramsleuth.png
#     (the 8 sizes 16/24/32/48/64/128/256/512) -> /usr/share/icons/hicolor/
#     <size>/apps/ AND <size>x<size>/apps/ (dual bare+NxN: freedesktop
#     index.theme files that declare only the NxN dirs make KIconLoader skip
#     the bare dirs; C21-42) + the 48px legacy /usr/share/pixmaps/ramsleuth.png
#     fallback (the Icon=ramsleuth resolution; plan C21-25, C21-42)
#   - the in-repo ramsleuth_intel DKMS module source tree kernel/ramsleuth-intel/
#     (GPL-2.0-only — a separate work from the MIT RamSleuth code) ->
#     /usr/share/ramsleuth-intel-dkms/src/ (the path the Intel helper resolves as its
#     installed copy; GUARDED: absent in pre-Intel tags)
#   - the vendored ryzen_smu DKMS module source tree packaging/ryzen-smu-dkms/
#     vendor/ (the 6 module files frozen at upstream d298366, GPL-2.0-only —
#     a separate work; + vendor/SUMS.sha256 + vendor/NOTICE.md) ->
#     /usr/share/ryzen-smu-dkms/vendor/ (the path the AMD helper (step 4)
#     resolves as its offline vendored source — every file SUMS-verified
#     before a build, zero network; GUARDED: absent in pre-vendor tags)
#   - the repo's ryzen_smu DKMS config packaging/ryzen-smu-dkms/dkms.conf
#     (DEST_MODULE_LOCATION=/extra — matches the helper's depmod override;
#     the vendored copy's /kernel/drivers/ryzen_smu is the last-resort
#     fallback only) -> /usr/share/ryzen-smu-dkms/dkms.conf (the helper's
#     installed-location resolution; GUARDED: absent in pre-dkms.conf tags)
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
pkgver=2.4.11   # FIXED — taken from the git tag v$pkgver (no pkgver())
pkgrel=1
pkgdesc="Pure-Rust RAM latency/bandwidth telemetry: privileged daemon + unprivileged CLI/TUI/GUI clients"
arch=(x86_64)
url="https://github.com/MadGoatHaz/RamSleuth"
license=(MIT GPL-2.0-only)
# git-commit source: makepkg clones the repo and checks out the pinned
# immutable v$pkgver release commit via the #commit= fragment.
# The "$pkgname::" rename extracts to $srcdir/ramsleuth (see header note above).
source=("$pkgname::git+https://github.com/MadGoatHaz/RamSleuth.git#commit=5b5f6b880248e2b5bcfe71146dc530a44736d768")
# Content-addressed VCS pin: the sha256 of `git archive --format tar
# <commit>` for the immutable #commit= ref above — exactly what makepkg
# 7.x generates for tag/commit-pinned git sources (makepkg -g) and what
# its integrity gate verifies (a *sums entry per source; '-' fails the
# gate on 7.x, and SKIP passes only as a no-op — not the form 7.x
# generates for #commit fragments).
sha256sums=('944450685f548517ccab2f79e3c3717273167d1947c9a25f6e841dbce8ccd896')
install=ramsleuth.install
# The in-repo ramsleuth_intel DKMS source ships bundled (package() step (12))
# and would file-conflict with the standalone ramsleuth-intel-dkms extra, so the
# two cannot coinstall (pacman refuses; the user picks one). The vendored
# ryzen_smu source ships bundled too (package() step (13)) and would
# file-conflict with the standalone ryzen-smu-dkms extra, so the two cannot
# coinstall either (the conflict is mutual: ryzen-smu-dkms lists both main
# packages).
conflicts=('ramsleuth-bin' 'ramsleuth-intel-dkms' 'ryzen-smu-dkms')
makedepends=(rust cargo pkgconf libx11 libxkbcommon wayland wayland-protocols libxrandr libxi libxcursor libxinerama mesa)
depends=(libx11 libxkbcommon wayland libxrandr libxi libxcursor libxinerama mesa)

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
    install -Dm644 "packaging/shared/ramsleuth.preset" \
        "$pkgdir/usr/lib/systemd/system-preset/ramsleuth.preset"

    # (4) the ramsleuth-owned copy of the pinned ryzen_smu DKMS helper
    install -Dm755 "scripts/install-ryzen-smu-dkms.sh" \
        "$pkgdir/usr/bin/ramsleuth-install-ryzen-smu-dkms"

    # (5) the ramsleuth-owned copy of the pinned ramsleuth_intel DKMS helper,
    # mirroring (4). GUARDED: the git-tag source (v$pkgver) may predate the
    # Intel helper (it lands in the v2.3.0 tree, INTEL-06), so a build against
    # an older tag skips it cleanly — the no-panic contract: the install must
    # not fail on its absence.
    if [ -f "scripts/install-intel-dkms.sh" ]; then
        install -Dm755 "scripts/install-intel-dkms.sh" \
            "$pkgdir/usr/bin/ramsleuth-install-intel-dkms"
    fi

    # (6) the self-contained entrypoint — shipped for audit/re-run
    install -Dm755 "install.sh" "$pkgdir/usr/share/ramsleuth/install.sh"

    # (7) the MIT license — the AUR license-compliance install path
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ramsleuth/LICENSE"

    # (8) the application-menu entry — shared asset next to the preset.
    # The FILENAME matches the GUI's Wayland app_id ("RamSleuth" — eframe/winit
    # 0.29 sets app_id = window title), so KWin's app_id -> desktop-file match
    # resolves the taskbar icon (C21-45).
    install -Dm644 "packaging/shared/RamSleuth.desktop" \
        "$pkgdir/usr/share/applications/RamSleuth.desktop"

    # (9) the one-click setup helper — the pkexec-able root helper (plan C21-01);
    # pkexec/polkit are Arch base, so no new runtime dep (plan §6)
    install -Dm755 "scripts/ramsleuth-setup.sh" "$pkgdir/usr/bin/ramsleuth-setup"

    # (10) the shared polkit policy — the org.freedesktop.ramsleuth.setup action
    # (plan C21-02)
    install -Dm644 "packaging/polkit/90-ramsleuth-setup.policy" \
        "$pkgdir/usr/share/polkit-1/actions/90-ramsleuth-setup.policy"

    # (11) the hicolor icon tree — the 8 sizes, installed to BOTH the bare
    # <size>/apps/ and the <size>x<size>/apps/ hicolor dirs (freedesktop
    # index.theme files that declare only the NxN dirs make KIconLoader skip
    # the bare dirs; a bare-only install shows a missing-icon placeholder in
    # the menu, C21-42) + the 48px legacy /usr/share/pixmaps/ramsleuth.png
    # fallback (the Icon=ramsleuth resolution; plan C21-25, C21-42). Every
    # icon is ALSO installed under the name RamSleuth.png (bare + NxN +
    # pixmaps) — KWin's direct icon-name fallback when the Wayland app_id
    # "RamSleuth" is used verbatim as the icon name (C21-45).
    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "assets/icons/hicolor/$size/apps/ramsleuth.png" \
            "$pkgdir/usr/share/icons/hicolor/$size/apps/ramsleuth.png"
        install -Dm644 "assets/icons/hicolor/$size/apps/ramsleuth.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ramsleuth.png"
        # The app_id-named fallback (C21-45)
        install -Dm644 "assets/icons/hicolor/$size/apps/ramsleuth.png" \
            "$pkgdir/usr/share/icons/hicolor/$size/apps/RamSleuth.png"
        install -Dm644 "assets/icons/hicolor/$size/apps/ramsleuth.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/RamSleuth.png"
    done
    install -Dm644 "assets/icons/hicolor/48/apps/ramsleuth.png" \
        "$pkgdir/usr/share/pixmaps/ramsleuth.png"
    install -Dm644 "assets/icons/hicolor/48/apps/ramsleuth.png" \
        "$pkgdir/usr/share/pixmaps/RamSleuth.png"

    # (12) The in-repo ramsleuth_intel DKMS module source tree ->
    # /usr/share/ramsleuth-intel-dkms/src/ — the exact path the Intel helper
    # (step 5) resolves as its installed copy (no network, no upstream pin:
    # the module lives in this repo, unlike the AMD vendored ryzen_smu).
    # The 4 files: dkms.conf, Makefile, ramsleuth_intel.c, README.md.
    # GUARDED with an existence test: a build against a pre-Intel git tag
    # (no kernel/ramsleuth-intel/) skips it cleanly — the no-panic contract;
    # the per-file guard covers 'Makefile if present'.
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
    # work on a clean source-package install without the extra). The git-tag
    # source carries packaging/ryzen-smu-dkms/vendor/ (the 6 module files
    # frozen at upstream d298366 + SUMS.sha256 + NOTICE.md) from the vendor
    # landing on v2-development; GUARDED with an existence test: a build
    # against a pre-vendor tag (no packaging/ryzen-smu-dkms/vendor/) skips it
    # cleanly — the no-panic contract; the per-file guards cover each file
    # present in the tag tree.
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

    # (14) The repo's ryzen_smu DKMS config -> /usr/share/ryzen-smu-dkms/dkms.conf
    # — the helper's dual-location resolution (repo-relative first, this
    # installed path second on a packaged run). DEST_MODULE_LOCATION=/extra
    # matches the helper's depmod override (the vendored copy's
    # /kernel/drivers/ryzen_smu is the last-resort fallback only — a
    # pre-fix install resolving to it works only via the depmod.d priority
    # fallback). GUARDED like (13): a build against a pre-dkms.conf tag
    # skips it cleanly — the no-panic contract.
    if [ -f "packaging/ryzen-smu-dkms/dkms.conf" ]; then
        install -Dm644 "packaging/ryzen-smu-dkms/dkms.conf" \
            "$pkgdir/usr/share/ryzen-smu-dkms/dkms.conf"
    fi

    # NOTE: the ramsleuth group is created on the TARGET system by the .install
    # pre_install/pre_upgrade hooks (package() runs in the build env, not the target).
}
