# Maintainer: MadGoat <ghazlett@gmail.com>
#
# Distro-agnostic (generic Arch) STABLE packaging for kernel-manager.
#
# This package builds a FIXED, checksummed source snapshot (a single commit)
# rather than tracking a moving branch. See PKGBUILD-git for the rolling
# variant that tracks `main` (per D7).
#
# --------------------------------------------------------------------------
# VERSIONING
#   pkgver mirrors the version of the pinned source tree. The pre-rebrand
#   tags (incl. v1.19.0) package the WRONG (CachyOS-branded) content and are
#   not used.
#
#   The stable source below is pinned to the v1.30.1 release: the
#   version-bump commit fed562c9a (`release: bump version to 1.30.1`) is the
#   TAG TARGET (the annotated tag v1.30.1 sits on it) and the `_commit` this
#   package fetches. Because `_commit` points at the version-bump commit
#   (not at this re-pin), the archived source is a stable, non-circular
#   snapshot. The v1.30.1 cycle: UI polish — the kernel-info header unified
#   into a single 4×4 grid (the Release hero spanning columns 1–2, Compiler
#   and Arch anchored to columns 3–4) and the compact build-date format
#   (`Mon DD, YYYY HH:MM`, the SMP/PREEMPT prefix dropped).
#
#   RELEASE PROCEDURE (v1.30.x and later):
#     1. Bump the CMake VERSION — the version-bump commit is the tag target.
#     2. Re-pin THIS file to that commit: bump `pkgver`, set `_commit` to
#        the version-bump commit's full SHA, and refresh `sha256sums` from
#        a REAL double-fetched GitHub archive (two independent fetches
#        verified byte-identical before the sum is recorded).
#     3. Cut the annotated tag on the version-bump commit.
#     4. Publish the GitHub release with
#        `gh --repo MadGoatHaz/kernel-manager` (ALWAYS pass --repo — from
#        this directory `gh` infers the upstream CachyOS/kernel-manager and
#        404s / runs against the wrong repo).
#   Each subsequent cut (v1.30.2 and later) follows exactly this procedure
#   and re-pins this file to the new version-bump commit.
#
# --------------------------------------------------------------------------
# DEPENDENCIES  (verified against `ldd` on the built binary + the CMake build)
#   depends (runtime):
#     qt6-base    -> libQt6Widgets/Gui/Core/Concurrent/DBus .so.6
#     pacman      -> libalpm.so.16
#     glib2       -> libglib-2.0.so.0
#     polkit      -> pkexec, used by /usr/lib/kernel-manager/rootshell.sh for
#                    the privilege-escalation path (auth_admin polkit action)
#
#   optdepends:
#     scx-manager -> optional sched-ext (BPF) scheduler management. The default
#                    build has WITH_SCX_MANAGER=OFF (find_package(scxctl-ui
#                    QUIET) not found -> feature compiled out, schedext button
#                    hidden). Installing scx-manager and rebuilding with
#                    -DWITH_SCX_MANAGER=ON (auto-enabled when its scxctl-ui
#                    CMake config is present) lights the feature up; the
#                    binary then additionally links libscxctl-ui.so.1.
#
#   makedepends (build time only):
#     cmake make gcc -> toolchain (C++23, Release, LTO). The build uses the
#                       default compiler (GCC), NOT clang/libc++ -- so
#                       llvm/libc++ are intentionally absent.
#     git          -> CPM fetches fmt/frozen/Corrosion from GitHub at configure
#     rust         -> cargo, for the Corrosion/cxx Rust crate (config-option-lib)
#     qt6-tools    -> lrelease, generates the .qm translations (embedded into
#                     the binary via km_locale.qrc -- NOT installed separately)
#     pkgconf      -> pkg-config, resolves libalpm.pc + glib-2.0.pc
#     python       -> Python3, runs src/mkoptions.py code generation
#     pacman glib2 -> headers/.pc for the build (same package is also a runtime
#                     dep; on Arch one package provides both)
#     polkit-qt6   -> PolkitQt6-1 CMake config for find_package(PolkitQt6-1).
#                     Build-time only: the polkit-qt6 library is NOT linked into
#                     the binary (verified via ldd), so it is not a runtime dep.
#
#   scx-manager is intentionally NOT a (make)dep: the default build is
#   WITH_SCX_MANAGER=OFF and needs no scxctl-ui headers/config (WU-5).
#
#   fmt + frozen are CPM-vendored (fetched at configure time) -- build-only,
#   not runtime deps.
#
# --------------------------------------------------------------------------
# CONFLICTS / PROVIDES
#   This is the rebrand of the former `cachyos-kernel-manager` package. The
#   conflict + provide make it drop-in replace the CachyOS package cleanly.

pkgname=kernel-manager
pkgver=1.30.1
pkgrel=1
pkgdesc="Qt6 GUI for kernel configuration, compilation, and sched-ext (BPF) scheduler management"
arch=(x86_64)
url="https://github.com/MadGoatHaz/kernel-manager"
license=(GPL-3.0-or-later)

conflicts=(cachyos-kernel-manager)
provides=(cachyos-kernel-manager)

depends=(qt6-base pacman glib2 polkit)
optdepends=("scx-manager: sched-ext (BPF) scheduler management")
makedepends=(cmake make gcc git rust qt6-tools pkgconf python pacman glib2 polkit-qt6)

# Defensive polkit reload so the shipped policy is picked up on (re)install.
install=kernel-manager.install

# Pinned v1.30.1 release commit (the version-bump commit, one before the
# v1.30.1 tag — see the VERSIONING note above).
_commit=fed562c9a04cc84efb83abaf1f75bd7eba1fe840
source=("https://github.com/MadGoatHaz/kernel-manager/archive/${_commit}.tar.gz")
sha256sums=("f0a3396ae91e3e029057a37b51b4aa239f830ae1af166a59b9c4f7fd9e9f1bf5")

# GitHub archive top dir for a commit is `<repo>-<full-sha>`.
_srcdir="kernel-manager-${_commit}"

build() {
  # Fat LTO objects so makepkg can strip the LTO-built binary/static archives;
  # see https://archlinux.org/todo/lto-fat-objects/ (this project enables LTO
  # for Release builds in CMakeLists).
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"

  cd "$srcdir/$_srcdir"
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$_srcdir"
  # Stages every artifact under $pkgdir/usr/...:
  #   binary            -> usr/bin/kernel-manager
  #   terminal-helper   -> usr/lib/kernel-manager/terminal-helper
  #   rootshell.sh      -> usr/lib/kernel-manager/rootshell.sh
  #   polkit policy     -> usr/share/polkit-1/actions/org.archlinux.kernel-manager.pkexec.policy
  #   desktop           -> usr/share/applications/org.archlinux.KernelManager.desktop
  #   10 icons          -> usr/share/icons/hicolor/<size>/apps/org.archlinux.KernelManager.png
  #
  # The helper + policy destinations are ABSOLUTE in CMakeLists
  # (KM_HELPER_DIR=/usr/lib/kernel-manager, POLKITQT-1_POLICY_FILES_INSTALL_DIR=
  # /usr/share/polkit-1/actions), so a bare `cmake --install --prefix` alone
  # would skip them. DESTDIR correctly prepends the staging dir to every
  # destination (relative AND absolute). The .qm translations are embedded into
  # the binary via km_locale.qrc and are NOT installed as separate files.
  DESTDIR="$pkgdir" cmake --install build --prefix /usr

  # Ship the project license (matches the sibling `scx-manager` package).
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
