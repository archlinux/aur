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
#
# sha256sums pins that exact asset. The v2.1.0 release is published (C19-08);
# the sha256 below is the real hash of the release tarball, captured from
# the published release .sha256 asset (finalized in C19-08b). AUR requires a real
# sha256 (no SKIP).
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
pkgver=2.1.0   # FIXED — the tarball is downloaded from the GitHub Release for this exact version
pkgrel=1
pkgdesc="Pure-Rust RAM latency/bandwidth telemetry: privileged daemon + unprivileged CLI/TUI/GUI clients (precompiled binary)"
arch=(x86_64)
url="https://github.com/MadGoatHaz/RamSleuth"
license=(MIT)
source=("https://github.com/MadGoatHaz/RamSleuth/releases/download/v$pkgver/ramsleuth-$pkgver-x86_64.tar.zst")
# sha256 of the published v2.1.0 release tarball (captured from the release .sha256 asset; finalized in C19-08b).
sha256sums=('d8db88fa4cafbb6e995713bdbd7dd7278043d558778d9d011f310c6fa3388b39')
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

    # NOTE: the ramsleuth group is created on the TARGET system by the .install
    # pre_install/pre_upgrade hooks (package() runs in the build env, not the target).
}
