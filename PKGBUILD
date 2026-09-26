# Maintainer: MadGoatHaz
#
# ryzen-smu-dkms — an optional provisioning extra for RamSleuth's live
# AMD SMU subtimings (the ryzen_smu kernel module). NOT a hard
# dependency: without it RamSleuth degrades gracefully (AMD section
# reads N/A (DriverMissing), exit 0, no panic).
#
# Design — thin provisioning package: package() installs (1) the DKMS
# configuration (packaging/ryzen-smu-dkms/dkms.conf), (2) the
# operator-run install helper (scripts/install-ryzen-smu-dkms.sh, as
# /usr/bin/ryzen-smu-dkms-install — the D-18.4 name distinct from
# ramsleuth's /usr/bin/ramsleuth-install-ryzen-smu-dkms; the name
# distinctness avoids a file conflict on that ONE binary only — the
# packages as a whole cannot coinstall, see the conflict note below),
# (3) the VENDED
# pinned ryzen_smu source (packaging/ryzen-smu-dkms/vendor/: the 6
# files frozen at upstream commit d298366 + SUMS.sha256 + NOTICE.md)
# to /usr/share/ryzen-smu-dkms/vendor/ — the exact installed path the
# C21-08 helper resolves (the offline build path, zero network), and
# (4) a short README.
#
# SAFETY: no kernel-module build in the build chroot — a `dkms
# build`/`dkms install` there would fail (no matching custom-kernel
# headers, e.g. 7.2.3-1-cachyos-custom) and be wrong (it builds
# against the chroot kernel, not the target's). The actual dkms
# build/install runs on the TARGET via the bundled helper:
#
#     sudo ryzen-smu-dkms-install
#
# AUTOINSTALL=yes in the bundled dkms.conf: DKMS auto-rebuilds the
# module on kernel updates. The ramsleuth systemd unit never loads the
# module. source: the RamSleuth repo (sibling of ramsleuth).
#
# Mutual conflict: the main packages (ramsleuth, ramsleuth-bin) now
# BUNDLE this same vendored source to /usr/share/ryzen-smu-dkms/vendor/
# (their package() step 13 — the in-app offline one-click needs no
# separate extra), so the vendor tree is shared file surface and this
# extra cannot coinstall with either: conflicts=('ramsleuth'
# 'ramsleuth-bin'), mutual (the main packages list this package too).
#
# License: the package content is the MIT helper + the GPL-2.0 vendored
# module source (a separate work — vendor/NOTICE.md); license= lists
# both. `git` is NOT a package dep: the vendored path needs no clone;
# the helper's pinned git-clone fetch remains only as the manual
# fallback (RYZEN_SMU_FORCE_REMOTE=1).

pkgname=ryzen-smu-dkms
pkgver=1.0
pkgrel=2
pkgdesc="Provisioning tools for the optional ryzen_smu DKMS module (RamSleuth live AMD subtimings)"
arch=(x86_64)
url="https://github.com/MadGoatHaz/RamSleuth"
license=(MIT GPL-2.0-only)
depends=(dkms)
makedepends=()
# The main packages bundle the same vendored source to
# /usr/share/ryzen-smu-dkms/vendor/ (their package() step 13 — the in-app
# offline one-click needs no separate extra), so this extra cannot
# coinstall with either; the conflict is mutual (the main packages list
# this package too).
conflicts=('ramsleuth' 'ramsleuth-bin')

# The installed files come from the RamSleuth repo tree (P5-03 dkms.conf, P5-04 helper,
# C21-07 vendor/).
# Integrity pin: the v2.4.6 release commit (immutable; current makepkg
# requires VCS sources to resolve to a commit — the #tag= fragment in
# source= is a human-readable label only). The package keeps its own 1.0
# pkgver (not the ramsleuth workspace version), so the tag is literal, not
# v$pkgver; bump the pin (and the literal tag) with each ramsleuth release
# wave. Before this first AUR submission the source tracked the moving
# v2-development branch (the pre-v2.4.5 integrity-gap class, closed for the
# siblings in the v2.4.5 re-cut).
_gitcommit=445acada45c385d8f777021e7dc1758ad5ec5695
source=("ramsleuth::git+https://github.com/MadGoatHaz/RamSleuth.git#tag=v2.4.6")

package() {
  # 1) DKMS config (sourced by DKMS on the target; not at build time).
  install -Dm644 "$srcdir/ramsleuth/packaging/ryzen-smu-dkms/dkms.conf" \
    "$pkgdir/usr/share/ryzen-smu-dkms/dkms.conf"

  # 2) Operator-run helper: verifies kernel headers, resolves the
  #    source (the vendored tree first, the pinned git clone as
  #    fallback), builds+installs the module on the TARGET kernel
  #    (sudo).
  install -Dm755 "$srcdir/ramsleuth/scripts/install-ryzen-smu-dkms.sh" \
    "$pkgdir/usr/bin/ryzen-smu-dkms-install"

  # 3) The vendored pinned ryzen_smu source (C21-07 — frozen,
  #    byte-identical to upstream at d298366; GPL-2.0 separate work,
  #    see vendor/NOTICE.md) -> /usr/share/ryzen-smu-dkms/vendor/
  #    (the exact path the C21-08 helper verifies with SUMS.sha256
  #    before any build).
  local v
  for v in LICENSE Makefile dkms.conf drv.c smu.c smu.h; do
    install -Dm644 "$srcdir/ramsleuth/packaging/ryzen-smu-dkms/vendor/ryzen-smu/$v" \
      "$pkgdir/usr/share/ryzen-smu-dkms/vendor/ryzen-smu/$v"
  done
  install -Dm644 "$srcdir/ramsleuth/packaging/ryzen-smu-dkms/vendor/SUMS.sha256" \
    "$pkgdir/usr/share/ryzen-smu-dkms/vendor/SUMS.sha256"
  install -Dm644 "$srcdir/ramsleuth/packaging/ryzen-smu-dkms/vendor/NOTICE.md" \
    "$pkgdir/usr/share/ryzen-smu-dkms/vendor/NOTICE.md"

  # 4) Short README.
  install -Dm644 /dev/null "$pkgdir/usr/share/doc/ryzen-smu-dkms/README.txt"
  cat >> "$pkgdir/usr/share/doc/ryzen-smu-dkms/README.txt" <<'EOF'
ryzen-smu-dkms (optional RamSleuth extra)
==========================================

OPTIONAL recommended extra for live AMD SMU subtimings. Without it,
RamSleuth works: the AMD section reads "N/A (DriverMissing)", exit 0,
no panic.

Build and install the module for this system's current kernel:

    sudo ryzen-smu-dkms-install

(the helper verifies the matching kernel headers; if missing it
reports where to get them and does not guess).

OFFLINE build, no network: this package ships the pinned upstream
source (the vendored ryzen-smu at commit d298366 — GPL-2.0, a
separate work; see vendor/NOTICE.md), and the helper verifies every
file against vendor/SUMS.sha256 before building. The pinned
git-clone fetch remains only as the manual fallback
(RYZEN_SMU_FORCE_REMOTE=1).

Thin provisioning package: the module is never built in the AUR
build chroot (wrong kernel, no matching headers) — all dkms
add/build/install work happens on the target, via the helper.

AUTOINSTALL=yes in the bundled dkms.conf auto-rebuilds the module on
kernel updates. The ramsleuth systemd unit never loads the module.
EOF
}
