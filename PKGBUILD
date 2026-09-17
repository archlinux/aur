# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Jesse Osiecki <jesse@jjo.ninja>
#
# This is a -git PKGBUILD: it builds paruguard from the tip of the git repo.
# When you cut tagged releases, copy this to a `paruguard` PKGBUILD with a
# fixed `source=("...::git+URL#tag=v$pkgver")` and drop the pkgver() function.

pkgname=paruguard-git
_pkgname=paruguard
pkgver=1.1.0.r0.ga0a796d
pkgrel=1
pkgdesc="Zero-trust AUR installer: hardened, auditable wrapper around paru/pacman"
arch=('any')
url="https://github.com/jesse-osiecki/paruguard"
license=('GPL-3.0-or-later')

# Runtime tools paruguard asserts at startup (PLAN.md §9.2). paru and
# ks-aur-scanner live in the AUR; an AUR helper resolves them.
depends=(
	'bash'
	'pacman'
	'devtools'        # makechrootpkg, arch-nspawn, mkarchroot, repo-add
	'paru'            # AUR: the helper paruguard orchestrates (never forks)
	'ks-aur-scanner'  # AUR: provides the `aur-scan` static-analysis gate
	'jq'
	'curl'
	'git'
	'libarchive'      # bsdtar
	'util-linux'      # unshare
	'sudo'
	'bubblewrap'      # bwrap (advisory --replay-hook sandbox)
	'expac'
)
optdepends=(
	'flatpak: fold `flatpak update` into full upgrades'
	'bpf: eBPF rootkit-map IOC self-check (bpftool)'
	'bat: nicer PKGBUILD/.install diff rendering in the gate'
)
# git is already in depends (runtime), so it's available at build too — no
# separate makedepends needed for cloning the -git source.
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')  # nothing to strip; pure Bash

source=("$_pkgname::git+https://github.com/jesse-osiecki/paruguard.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	# Branch on git describe's real exit status: a piped `... | sed` would
	# swallow the "no tags" failure (sed exits 0 on empty input), leaving an
	# empty pkgver. Tag form when tags exist; else 0.r<commits>.<shorthash>.
	local desc
	if desc=$(git describe --long --tags 2>/dev/null) && [[ -n "$desc" ]]; then
		printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

build() {
	cd "$srcdir/$_pkgname"
	make build
}

check() {
	cd "$srcdir/$_pkgname"
	# fast, non-privileged tier only; the live tier needs a real chroot + sudo
	# and is exercised via testrig/ (a VM), not during package build.
	make test
}

package() {
	cd "$srcdir/$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
