# Maintainer: Hunter Grey <71165939+HunterGrey-cyber@users.noreply.github.com>
#
# eitri-bin -- the prebuilt release tarball's four binaries (shell, eitri-supervisor,
# eitri-tmux-shim, eitri-claude-handoff), plus a Claude Agent SDK sidecar built here, on the
# user's own machine, at install time (spec docs/superpowers/specs/2026-09-27-v1-dist-design.md
# sec 9). Building it is not redistribution by this project (I7); see the licence note below.
#
# pkgver/sha256sums are placeholders until packaging/aur/bump-bin.sh <release dir> fills them from
# a real release's RELEASE/SHA256SUMS. This checked-in copy will not build as-is.
#
# eitri-bin is deliberately never published to the AUR for a `-rc.N` prerelease version
# (the private review notes #3, plan
# docs/superpowers/plans/2026-09-27-v1-dist.md Task 14): mapping `-` -> `_` the way spec sec 3
# says (`0.2.0-rc.1` -> `0.2.0_rc.1`) sorts ABOVE the eventual final release under pacman's own
# version comparison --
#
#   $ vercmp 0.2.0_rc.1-1 0.2.0-1
#   1
#
# -- which would strand every `-rc.N` installer above the real `0.2.0` release with no upgrade
# path (pacman/AUR helpers only ever offer to upgrade to a *higher* version). bump-bin.sh refuses
# to print an AUR-ready commit for a prerelease version; a prerelease build of this PKGBUILD exists
# only for packaging/aur/test-in-container.sh (a local, test-only source= override, never pushed).

pkgname=eitri-bin
pkgver=0.2.1
pkgrel=1
# _realver: the release's own EITRI_VERSION, hyphenated (e.g. "0.2.0-rc.1"), as GitHub's release
# tag and every asset filename actually spell it. pkgver above is that same string with '-' -> '_'
# (spec docs/superpowers/specs/2026-09-27-v1-dist-design.md sec 3 -- makepkg's pkgver may not
# contain a hyphen at all), so the two diverge for any prerelease and only _realver is right to use
# in a download URL or an asset's on-disk name. bump-bin.sh sets both from the same RELEASE key.
_realver=0.2.1
pkgdesc="Your Neovim, with a readable Claude Code panel beside it (prebuilt binaries; builds its own sidecar on install)"
arch=('x86_64')
url="https://github.com/HunterGrey-cyber/eitri"
# D15 (spec sec 9, sec 17 Q3): this package's own MIT/Apache-2.0/LGPL-3.0-only/MPL-2.0 notices,
# plus Anthropic's Claude Agent SDK licence once build() has built the sidecar -- not open source,
# and not redistributed by this project (a user builds it for themselves); see the comment above
# and packaging/aur/eitri-git/PKGBUILD's own copy of this note.
license=('MIT' 'Apache-2.0' 'LGPL-3.0-only' 'MPL-2.0' 'LicenseRef-Anthropic-Claude-Agent-SDK')
depends=('gtk4' 'webkitgtk-6.0' 'glibc' 'gcc-libs')
# !strip: measured, not assumed -- makepkg's default post-package `strip`/`objcopy`/`gdb-add-index`
# pass corrupts the sidecar (a Node SEA executable, whose fuse/injection mechanism does not
# survive its ELF sections being restructured: "Loadable section \"\" outside of ELF segments",
# "Can't find string offset for section name '.note.100'" from binutils, then the packaged binary
# fails with "Exec format error"). Every other binary here is prebuilt and already stripped by
# release.sh, so disabling makepkg's own pass costs nothing on them either.
options=('!strip')
optdepends=(
	'neovim: the editor (any nvim >= 0.10 on PATH)'
	'claude-code: the Claude Code CLI the panel drives'
	'noto-fonts: the ⏵⏵ mode glyph'
	'neovide: eitri split'
)
makedepends=('curl' 'tar')
provides=('eitri')
conflicts=('eitri')

# _verdandi_source: the exact release asset name (varies with the pinned Verdandi revision --
# RELEASE's own VERDANDI_SOURCE key); bump-bin.sh rewrites only this line, so build()/package()
# below never need to know it.
_verdandi_source=verdandi-8e0f7e1-source.tar.gz
# _nodever: the Node the sidecar is built with -- RELEASE's own NODE_VERSION (packaging/pins.env's,
# copied into RELEASE at build time). bump-bin.sh rewrites this line and the third sha256sums entry
# together, from the same RELEASE, so the URL and its checksum never name two different Nodes.
_nodever=v22.23.2

source=(
	"eitri-${_realver}-x86_64-linux.tar.gz::https://github.com/HunterGrey-cyber/eitri/releases/download/v${_realver}/eitri-${_realver}-x86_64-linux.tar.gz"
	"${_verdandi_source}::https://github.com/HunterGrey-cyber/eitri/releases/download/v${_realver}/${_verdandi_source}"
	"node-${_nodever}-linux-x64.tar.xz::https://nodejs.org/dist/${_nodever}/node-${_nodever}-linux-x64.tar.xz"
)
# The first two are filled by bump-bin.sh from a real release's SHA256SUMS; the third is RELEASE's
# NODE_SHA256_linux_x64, which bump-bin.sh writes along with _nodever above, so a Node bump in
# packaging/pins.env reaches this PKGBUILD through the next release's RELEASE rather than through a
# second, hand-edited copy of the pin.
sha256sums=('f490bc7b3fb6fb98565306ef0568ae4fa2a4fd988dc3fa9ff5efb322f197cc08'
            'b0571203c2bcb663bb39596df97e527975d8cc073962f780f7d35215430bcf25'
            'd60acfe00a2932254bb0ad20e01b0d74397a0875595de719654b214f4b03f307')

# A binary-repository maintainer considering rebuilding this package: build() downloads and links
# Anthropic's Claude Agent SDK (not open source) into the sidecar this package installs. A user
# running `makepkg` here is building it for themselves, which is not redistribution by this
# project (I7); a binary repository publishing the resulting .pkg.tar.zst would be redistributing
# Anthropic's SDK, which its own licence does not permit. Please do not mirror this package as a
# built binary -- point people at the AUR entry instead.

build() {
	cd "$srcdir"
	# The only slow part here (npm's ~120 MB of the Agent SDK, then the TypeScript build and the single
	# binary: about a minute at 25 Mbit/s, network-bound), so the only line added.
	msg2 "Installing the Claude Agent SDK and building the sidecar (1-3 min)"
	sh "eitri-${_realver}-x86_64-linux/lib/eitri/eitri-setup" \
		--build-sidecar-into "$srcdir/sidecar" \
		--node "$srcdir/node-${_nodever}-linux-x64.tar.xz" \
		--verdandi-source "$srcdir/${_verdandi_source}"
}

package() {
	cd "$srcdir"
	local top="eitri-${_realver}-x86_64-linux"

	# lib/eitri/* (spec sec 9: "installs lib/neovibe/*, with RELEASE"), exactly the tarball's own
	# layout, plus the sidecar build() produced beside them.
	install -d "$pkgdir/usr/lib/eitri"
	install -m0644 "$top/lib/eitri/RELEASE" "$pkgdir/usr/lib/eitri/RELEASE"
	install -m0755 "$top/lib/eitri/shell" "$pkgdir/usr/lib/eitri/shell"
	install -m0755 "$top/lib/eitri/eitri-supervisor" "$pkgdir/usr/lib/eitri/eitri-supervisor"
	install -m0755 "$top/lib/eitri/eitri-tmux-shim" "$pkgdir/usr/lib/eitri/eitri-tmux-shim"
	install -m0755 "$top/lib/eitri/eitri-claude-handoff" "$pkgdir/usr/lib/eitri/eitri-claude-handoff"
	install -m0755 "$top/lib/eitri/eitri-setup" "$pkgdir/usr/lib/eitri/eitri-setup"
	install -m0755 "$srcdir/sidecar/verdandi-claude-sidecar" "$pkgdir/usr/lib/eitri/verdandi-claude-sidecar"
	install -m0644 "$srcdir/sidecar/verdandi-claude-sidecar.rev" "$pkgdir/usr/lib/eitri/verdandi-claude-sidecar.rev"

	install -Dm0755 "$top/bin/eitri" "$pkgdir/usr/bin/eitri"
	# The desktop entry is named by the application id (it replaced eitri.desktop, which an upgrade drops
	# by this package no longer listing it), and the icon is every file of the tarball's hicolor tree.
	install -Dm0644 "$top/share/applications/cn.huntergrey.eitri.desktop" \
		"$pkgdir/usr/share/applications/cn.huntergrey.eitri.desktop"
	# The panel's own entry (`eitri panel`), and the nvim plugin that adds :EitriPanel, which the tarball
	# lays out at share/eitri/eitri.nvim and the packages put at /usr/share/eitri/nvim/eitri.nvim.
	install -Dm0644 "$top/share/applications/cn.huntergrey.eitri.Panel.desktop" \
		"$pkgdir/usr/share/applications/cn.huntergrey.eitri.Panel.desktop"
	local _icon _plugin _ext
	while IFS= read -r _plugin; do
		install -Dm0644 "$top/share/eitri/eitri.nvim/$_plugin" "$pkgdir/usr/share/eitri/nvim/eitri.nvim/$_plugin"
	done < <(cd "$top/share/eitri/eitri.nvim" && find . -type f | sed 's#^\./##' | LC_ALL=C sort)
	# The GNOME Shell extension a companion panel on GNOME uses: an explicit list of the four files the shell loads,
	# never a find, so nothing else that ever lands beside them in the tarball is installed.
	for _ext in metadata.json extension.js direction.js policy.js; do
		install -Dm0644 "$top/share/gnome-shell/extensions/eitri@huntergrey.cn/$_ext" \
			"$pkgdir/usr/share/gnome-shell/extensions/eitri@huntergrey.cn/$_ext"
	done
	while IFS= read -r _icon; do
		install -Dm0644 "$top/share/icons/$_icon" "$pkgdir/usr/share/icons/$_icon"
	done < <(cd "$top/share/icons" && find hicolor -type f | LC_ALL=C sort)

	# D15: the tarball's own licences and SOURCE, plus the built SDK's LICENSE.md and Node's own
	# licence, which eitri-setup --build-sidecar-into saves beside the sidecar when present.
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m0644 "$top/share/licenses/eitri/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -m0644 "$top/share/licenses/eitri/THIRD-PARTY-LICENSES" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES"
	install -m0644 "$top/share/licenses/eitri/SOURCE" "$pkgdir/usr/share/licenses/$pkgname/SOURCE"
	if [ -f "$srcdir/sidecar/LICENSE.md" ]; then
		install -m0644 "$srcdir/sidecar/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	fi
	if [ -f "$srcdir/sidecar/NODE-LICENSE" ]; then
		install -m0644 "$srcdir/sidecar/NODE-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/NODE-LICENSE"
	fi
}
