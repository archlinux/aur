# Maintainer: MadGoatHaz
#
# ramsleuth-intel-dkms — an optional provisioning extra for RamSleuth's live
# Intel IMC subtimings (the ramsleuth_intel kernel module). NOT a hard
# dependency: without it RamSleuth degrades gracefully (Intel section reads
# N/A (DriverMissing), exit 0, no panic; the /dev/mem fallback remains
# available where unblocked).
#
# Design — thin provisioning package mirroring ryzen-smu-dkms: package()
# installs (1) the DKMS configuration (kernel/ramsleuth-intel/dkms.conf, to
# /usr/share/ramsleuth-intel-dkms/dkms.conf), (2) the operator-run install
# helper (scripts/install-intel-dkms.sh, as /usr/bin/ramsleuth-intel-dkms-install
# — the D-18.4-style name distinct from ramsleuth's /usr/bin/ramsleuth-install-
# intel-dkms, so the packages coexist without a pacman file conflict), (3) the
# in-repo module source tree (kernel/ramsleuth-intel/) verbatim to
# /usr/share/ramsleuth-intel-dkms/src/ — the exact installed path the
# INTEL-06 helper resolves (no network, no upstream pin: the module lives in
# this repo, unlike the AMD vendored ryzen_smu), and (4) a short README.
#
# SOURCE — the commit-pinned RamSleuth repo (sibling pattern, like the AMD
# extra): pkgver is the FIXED ramsleuth workspace version (2.4.6 today;
# bumped with the INTEL-20 release). Current makepkg requires VCS sources
# to resolve to an immutable commit, so the source pins to the v$pkgver
# release commit via _gitcommit below; the #tag= fragment is a label only
# (no sha256sums: the _gitcommit pin IS the integrity check). Pre-v2.3.0
# the release tags predated the kernel/ramsleuth-intel/ tree, which is why
# this package once tracked the moving v2-development branch; every tag
# since v2.3.0 carries the module, so a release-commit pin is safe.
#
# SAFETY: no kernel-module build in the build chroot — a `dkms
# build`/`dkms install` there would fail (no matching kernel headers) and be
# wrong (it builds against the chroot kernel, not the target's). The actual
# dkms add/build/install runs on the TARGET via the bundled helper:
#
#     sudo ramsleuth-intel-dkms-install
#
# AUTOINSTALL=yes in the bundled dkms.conf: DKMS auto-rebuilds the module on
# kernel updates. The ramsleuth systemd unit never loads the module.
#
# Intel-only by design: on a non-Intel host the module builds fine, modprobe
# leaves it idle (no kobject), and the helper exits 0 with a clear note.
#
# License: the package content is the GPL-2.0 module source (SPDX
# GPL-2.0 — a separate work from the MIT RamSleuth code, built only by DKMS
# on the target) + the MIT helper; license= lists GPL-2.0-only per the
# INTEL-07 spec. `git` is NOT a package dep: the source resolves from the
# installed /usr/share copy (no clone on the target path).

pkgname=ramsleuth-intel-dkms
pkgver=2.4.6   # FIXED — the ramsleuth workspace version (no pkgver())
pkgrel=1
pkgdesc="Provisioning tools for the optional ramsleuth_intel DKMS module (RamSleuth live Intel IMC subtimings)"
arch=(x86_64)
url="https://github.com/MadGoatHaz/RamSleuth"
license=(GPL-2.0-only)
# Only dkms (same as the AMD extra): the matching kernel build tree is the
# TARGET's concern — the helper verifies /lib/modules/$(uname -r)/build and
# stops with candidate packages when it is missing (never guessed here).
depends=(dkms)
makedepends=()
# The main packages (ramsleuth / ramsleuth-bin) bundle the same in-repo
# kernel/ramsleuth-intel/ source tree -> /usr/share/ramsleuth-intel-dkms/src/,
# so this standalone extra cannot coexist with either (pacman file conflict;
# the user picks one).
conflicts=('ramsleuth' 'ramsleuth-bin')

# The installed files come from the RamSleuth repo tree (INTEL-05 module,
# INTEL-06 helper). The "$pkgname"-style rename extracts to $srcdir/ramsleuth
# (sibling pattern, like the AMD extra).
# Integrity pin: the v$pkgver release commit (immutable; current makepkg
# requires VCS sources to resolve to a commit — the #tag= fragment in
# source= is a human-readable label only).
_gitcommit=445acada45c385d8f777021e7dc1758ad5ec5695
source=("ramsleuth::git+https://github.com/MadGoatHaz/RamSleuth.git#tag=v$pkgver")

package() {
  # 1) DKMS config (sourced by DKMS on the target; not at build time).
  #    Carries PACKAGE_VERSION="@VERSION@"; the helper seds it to the
  #    workspace version before `dkms add` (AMD pattern).
  install -Dm644 "$srcdir/ramsleuth/kernel/ramsleuth-intel/dkms.conf" \
    "$pkgdir/usr/share/ramsleuth-intel-dkms/dkms.conf"

  # 2) Operator-run helper: verifies kernel headers, resolves the source
  #    (the in-repo tree first, this installed copy second), builds+installs
  #    the module on the TARGET kernel (sudo), vendor-aware non-Intel-safe.
  install -Dm755 "$srcdir/ramsleuth/scripts/install-intel-dkms.sh" \
    "$pkgdir/usr/bin/ramsleuth-intel-dkms-install"

  # 3) The in-repo module source tree (GPL-2.0, verbatim — the four files
  #    the helper stages into /usr/src/ramsleuth_intel-<version>/:
  #    dkms.conf, Makefile, ramsleuth_intel.c, README.md) ->
  #    /usr/share/ramsleuth-intel-dkms/src/ (the exact path the helper's
  #    installed-copy resolution checks).
  local f
  for f in dkms.conf Makefile ramsleuth_intel.c README.md; do
    install -Dm644 "$srcdir/ramsleuth/kernel/ramsleuth-intel/$f" \
      "$pkgdir/usr/share/ramsleuth-intel-dkms/src/$f"
  done

  # 4) Short README.
  install -Dm644 /dev/null "$pkgdir/usr/share/doc/ramsleuth-intel-dkms/README.txt"
  cat >> "$pkgdir/usr/share/doc/ramsleuth-intel-dkms/README.txt" <<'EOF'
ramsleuth-intel-dkms (optional RamSleuth extra)
================================================

OPTIONAL recommended extra for live Intel IMC subtimings. Without it,
RamSleuth works: the Intel section reads "N/A (DriverMissing)", exit 0,
no panic (the /dev/mem fallback remains available where unblocked).

Build and install the module for this system's current kernel:

    sudo ramsleuth-intel-dkms-install

(the helper verifies the matching kernel headers; if missing it lists
candidate packages and stops — it does not guess).

The module source is the in-repo kernel/ramsleuth-intel/ tree (GPL-2.0 —
a separate work from the MIT RamSleuth code, built only by DKMS on the
target). No network, no upstream pin: this package ships it verbatim.

Thin provisioning package: the module is never built in the AUR build
chroot (wrong kernel, no matching headers) — all dkms add/build/install
work happens on the target, via the helper.

Intel-only: on a non-Intel host the module builds fine but the load
leaves it idle (no kobject); the helper exits 0 with a clear note and
the app uses the /dev/mem fallback.

AUTOINSTALL=yes in the bundled dkms.conf auto-rebuilds the module on
kernel updates. The ramsleuth systemd unit never loads the module.
EOF
}
