# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Jesse Osiecki <jesse@jjo.ninja>
#
# Stable release PKGBUILD for the `paruguard` AUR package: builds a fixed
# tagged release from its GitHub tarball (verified checksum). The companion
# `paruguard-git` package (root PKGBUILD) tracks main instead. `pkgver` and
# `sha256sums` here are updated per release by scripts/release.sh.

pkgname=paruguard
pkgver=1.1.0
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
conflicts=('paruguard-git')
options=('!strip')  # nothing to strip; pure Bash

source=("$pkgname-$pkgver.tar.gz::https://github.com/jesse-osiecki/paruguard/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('34354cf968623c3841ef2f7122bb5e598905dcee150b45f4921cf798cf994d3f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	# fast, non-privileged tier only; the live tier needs a real chroot + sudo
	# and is exercised via testrig/ (a VM), not during package build.
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
