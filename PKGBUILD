# Maintainer: MadGoat <ghazlett@gmail.com>
#
# PREBUILT-BINARY companion to the source package `scx-manager`
# (the source PKGBUILD is RETAINED — this is an addition, not a
# replacement). Installs a precompiled x86_64 Release build produced
# by the release-bin workflow (.github/workflows/release-bin.yml):
# archlinux:base-devel container, GCC + GNU ld + Unix Makefiles,
# Release + -ffat-lto-objects — byte-parity with the documented AUR
# source build (packaging/scx-manager/PKGBUILD:28-37). No build step,
# no makedepends, no CPM/cargo network fetches in the user's chroot.
#
# DEPENDENCY AUTHORITY: names mirror the source PKGBUILD's depends=
# (qt6-base polkit scx-tools). The >= floors below are the build
# environment's actuals from the first release-bin run's audit
# section (run 34546612569, 2026-09-11: qt6-base 6.11.2-3, polkit
# 127-3, scx-tools 1.1.3-1) — re-captured from each release's audit
# (the standing per-release re-capture, plans/PLAN.md §7).
#
# FILE COLLISION CONTRACT: this package installs the SAME file set as
# `scx-manager` and `scx-manager-git` (usr/bin/scx-manager,
# libscxctl-ui.so.1*, headers + cmake config, desktop file, icon,
# LICENSE). Mutual `conflicts=` make coexistence impossible; pacman
# performs the switch in a single transaction in either direction.
# `provides=` is deliberately ABSENT: none of the three packages
# provides a sibling's name (no cachyos rebrand contract exists for
# this project — the source PKGBUILD has no provides= either), so
# `pacman -S <sibling>` remains a working one-command switch in both
# directions.
#
# There is no install hook (the source package ships none) and no
# optdepends: every feature is in the prebuilt binary (the Rust
# scx_loader/zbus bridge is statically linked into the app).

pkgname=scx-manager-bin
pkgver=1.15.12
pkgrel=1
pkgdesc="Prebuilt x86_64 binary of scx-manager (Qt6 GUI manager for sched-ext (SCX) schedulers) — installs without building"
arch=(x86_64)
url="https://github.com/MadGoatHaz/scx-manager"
license=(GPL-3.0-or-later)
# Same file set as the source + git packages: symmetric conflicts make
# coexistence impossible, and `pacman -S <sibling>` is a one-command
# switch in either direction (see FILE COLLISION CONTRACT in the header).
conflicts=(scx-manager scx-manager-git)
# Floors = the release-bin build environment's actuals, captured by
# the "Build audit" section appended to the v1.15.12 release notes
# (run 34546612569, 2026-09-11: qt6-base 6.11.2-3, polkit 127-3,
# scx-tools 1.1.3-1; glibc 2.44, GCC 16.2.1, cmake 4.4.3, rustc
# 1.98.1 — archlinux:base-devel container). Names are final (mirror
# the source depends=).
# QUOTED entries — an unquoted >= is a bash redirection syntax error.
depends=("qt6-base>=6.11.2" "polkit>=127" "scx-tools>=1.1.3")
# -bin model: package() installs a prebuilt, checksum-pinned tarball
# from GitHub Releases — there is NO compile step, so no makedepends
# (no cmake, no cargo, no CPM network fetches in the user's chroot).
makedepends=()

# Prebuilt Release tarball from the trusted upstream (the same GitHub
# account that hosts the source archives). Naming contract of
# release-bin.yml: scx-manager-<ver>-x86_64.tar.zst with a `usr/`
# root, so a plain extraction into $pkgdir yields the FHS tree.
source=("https://github.com/MadGoatHaz/scx-manager/releases/download/v${pkgver}/scx-manager-${pkgver}-x86_64.tar.zst")

# Verified via the standing double-fetch discipline (fetch twice, cmp
# byte-identical, sha256sum both + the released SHA256SUMS) after the
# first release-bin run — plans/PLAN.md §5.3-5.4.
# v1.15.12: a73a26d0… (run 34546612569, 2026-09-11; 2,492,271 bytes;
# released SHA256SUMS lists the identical hash).
sha256sums=("a73a26d0975e4e5bf9056b59c6656f0b7f2b4fd69508dfe3528f4edb863e9f95")

package() {
  # The tarball's root is `usr/`, so a plain extraction into $pkgdir
  # yields the full FHS layout (binary, libscxctl-ui.so.1*, headers,
  # cmake config, desktop file, icon, LICENSE — provenance:
  # CMakeLists.txt:202-238 + packaging/scx-manager/PKGBUILD:39-45).
  # No compilation.
  tar --zstd -xf "${srcdir}/scx-manager-${pkgver}-x86_64.tar.zst" -C "$pkgdir"
}
