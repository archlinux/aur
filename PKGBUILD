# Maintainer: MadGoat <ghazlett@gmail.com>
#
# PREBUILT-BINARY companion to the source package `kernel-manager`
# (the source PKGBUILD is RETAINED — this is an addition, not a
# replacement). Installs a precompiled x86_64 Release build produced by
# the release-bin workflow (.github/workflows/release-bin.yml):
# archlinux:base-devel container, GCC + GNU ld + Unix Makefiles, fat
# LTO, WITH_SCX_MANAGER=OFF. No build step, no makedepends, no CPM
# network fetches in the user's chroot.
#
# DEPENDENCY AUTHORITY: the ldd-verified breakdown in the source
# PKGBUILD:40-78. Runtime depends = the source list (PKGBUILD:95)
# plus >= floors captured from the build environment at each release
# (re-captured per release from the CI audit artifact — plan Step 7).
#
# FILE COLLISION CONTRACT: this package installs the SAME file set as
# `kernel-manager` and `kernel-manager-git` (binary, usr/lib/kernel-manager
# helpers, polkit policy, desktop file, 10 icons, LICENSE). Mutual
# `conflicts=` make coexistence impossible; pacman performs the switch
# in a single transaction in either direction. `provides=` keeps ONLY
# the cachyos-kernel-manager rebrand contract (source PKGBUILD:92-93)
# and deliberately does NOT provide `kernel-manager`, so that
# `pacman -S kernel-manager` remains a working one-command switch from
# this package to the source build (and this package's conflicts make
# `pacman -S kernel-manager-bin` the reverse switch).
#
# scx-manager optdepends (source PKGBUILD:96) is deliberately OMITTED:
# this build is WITH_SCX_MANAGER=OFF (feature compiled out,
# CMakeLists.txt:71-78) and a prebuilt user cannot re-enable it —
# sched-ext management requires the source package.

pkgname=kernel-manager-bin
pkgver=1.30.1
pkgrel=1
pkgdesc="Prebuilt x86_64 binary of kernel-manager (Qt6 GUI for kernel configuration, compilation, and sched-ext (BPF) scheduler management) — installs without building"
arch=(x86_64)
url="https://github.com/MadGoatHaz/kernel-manager"
license=(GPL-3.0-or-later)

# Same file set as the source + git packages: symmetric conflicts make
# coexistence impossible, and `pacman -S <sibling>` is a one-command
# switch in either direction (see FILE COLLISION CONTRACT in the header).
# `provides=` keeps ONLY the cachyos-kernel-manager rebrand contract
# (source PKGBUILD:92-93); it deliberately does NOT provide `kernel-manager`
# so that `pacman -S kernel-manager` stays a working one-command switch
# from this package to the source build.
conflicts=(kernel-manager kernel-manager-git cachyos-kernel-manager)
provides=(cachyos-kernel-manager)

# Mirrors source PKGBUILD:95 (names) + build-environment floors.
# Initial values = the 2026-09-10 archlinux:base-devel capture;
# re-captured from the release-bin CI audit artifact at each release
# (plan §3 Step 7 item 3).
depends=("qt6-base>=6.11.2" "pacman>=7.1.0" "glib2>=2.88.3" "polkit>=127")

# -bin model: package() installs a prebuilt, checksum-pinned tarball
# from GitHub Releases — there is NO compile step, so no makedepends
# (no cmake, no cargo, no CPM network fetches in the user's chroot).
makedepends=()

# Shared polkit reload hook — byte-identical file to the source package.
install=kernel-manager.install

# Prebuilt Release tarball from the trusted upstream (the same GitHub
# account that hosts the source archives). Naming contract of
# release-bin.yml: kernel-manager-<ver>-x86_64.tar.zst with a `usr/`
# root, so a plain extraction into $pkgdir yields the FHS tree.
source=("https://github.com/MadGoatHaz/kernel-manager/releases/download/v${pkgver}/kernel-manager-${pkgver}-x86_64.tar.zst")

# Pinned via the project's standing double-fetch discipline (source
# PKGBUILD:27-30; Work/Docs/AUR_PACKAGING.md:9) after the v1.30.1
# workflow_dispatch backfill build (run 34516661858, 2026-09-10) uploaded
# the release assets (plan §3 Step 7 item 3: fetch twice, cmp byte-identical,
# record). Re-pin per release (plan §3 Step 7 item 3) after each backfill
# build publishes a new asset.
sha256sums=("39ebaad131e281f631fa84d82dd23b9ea3c26a973b8825d56974c0cd9c6fa840")

package() {
  # The tarball's root is `usr/`, so a plain extraction into $pkgdir
  # yields the full FHS layout (binary, usr/lib/kernel-manager helpers,
  # polkit policy, desktop file, 10 icons, LICENSE — provenance:
  # CMakeLists.txt:205-286 + source PKGBUILD:125-144). No compilation.
  tar --zstd -xf "${srcdir}/kernel-manager-${pkgver}-x86_64.tar.zst" -C "$pkgdir"
}
