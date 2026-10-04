# Maintainer: Hunter Grey <71165939+HunterGrey-cyber@users.noreply.github.com>
#
# eitri-git -- built from source: the public Eitri repo, its neovide fork submodule and the
# public Verdandi repo (for the sidecar's source), plus Node for the Node SEA build. See
# packaging/aur/eitri-bin/PKGBUILD's own header for the licence note this package repeats below
# (D15, spec docs/superpowers/specs/2026-09-27-v1-dist-design.md sec 9).

pkgname=eitri-git
pkgver=0.2.0.17.g37b10ae
pkgrel=1
pkgdesc="Your Neovim, with a readable Claude Code panel beside it (built from source)"
arch=('x86_64')
url="https://github.com/HunterGrey-cyber/eitri"
license=('MIT' 'Apache-2.0' 'LGPL-3.0-only' 'MPL-2.0' 'LicenseRef-Anthropic-Claude-Agent-SDK')
depends=('gtk4' 'webkitgtk-6.0' 'glibc' 'gcc-libs')
# !strip: see packaging/aur/eitri-bin/PKGBUILD's own comment -- the same sidecar build (a Node
# SEA executable, from the same packaging/install.sh --build-sidecar-into recipe) is produced here
# too, and makepkg's default strip pass corrupts it. Measured on eitri-bin's build in
# packaging/aur/test-in-container.sh, where the stripped sidecar failed with "Exec format error";
# this package inherits the option rather than having been measured without it.
# !lto: makepkg's default lto option adds -flto=auto to CFLAGS, so the cc crate compiles the
# vendored Lua (mlua's `vendored` feature, lua-src) into GCC LTO bytecode objects -- and rustc links
# x86_64-unknown-linux-gnu through lld, which cannot read GCC's LTO sections. Measured in
# packaging/aur/test-in-container.sh: with lto on, liblua5.4.a's objects carry only .gnu.lto_*
# sections and linking `shell` fails with "ld.lld: error: undefined symbol: lua_gettop" (and every
# other lua_* the mlua crate calls). Rust's own code is unaffected; this only turns off makepkg's
# C-side LTO flags.
options=('!strip' '!lto')
optdepends=(
	'neovim: the editor (any nvim >= 0.10 on PATH)'
	'claude-code: the Claude Code CLI the panel drives'
	'noto-fonts: the ⏵⏵ mode glyph'
)
# Arch's Rust package guideline (fetch the crate registry in prepare(), build --frozen in
# build()); clang/pkgconf for skia-bindings/gtk4-rs's build scripts; protobuf for
# claude-runtime-protocol's build.rs (CLAUDE.md: "a system protoc ... is a hard build-time
# prerequisite for agent"); nodejs/npm build agent-ui/web (shell/build.rs) and the sidecar
# (apps/claude-sidecar), so build() still reaches the npm registry (spec
# docs/superpowers/specs/2026-09-27-v1-dist-design.md sec 9, "AUR norms this bends"). curl fetches
# the pinned Skia archive in prepare(): pacman itself depends on curl, so every makepkg host already
# has it, but the one download tool prepare() calls by name is listed, as eitri-bin lists it.
makedepends=('git' 'cargo' 'clang' 'pkgconf' 'protobuf' 'nodejs' 'npm' 'curl')
provides=('eitri')
conflicts=('eitri')
source=(
	"${pkgname}::git+https://github.com/HunterGrey-cyber/eitri.git"
	"neovide::git+https://github.com/HunterGrey-cyber/neovide.git#branch=neovibe-integration"
	"verdandi::git+https://github.com/HunterGrey-cyber/verdandi.git"
	"node-v22.23.2-linux-x64.tar.xz::https://nodejs.org/dist/v22.23.2/node-v22.23.2-linux-x64.tar.xz"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'd60acfe00a2932254bb0ad20e01b0d74397a0875595de719654b214f4b03f307')

# pkgver(): git describe --long --tags, ARM-safe against a prerelease tag such as v0.2.0-rc.1
# (the private review notes #2). The naive "insert .r before the
# first hyphen" sed spec sec 3 first wrote breaks on exactly that tag -- `v0.2.0-rc.1-0-g1234567`
# becomes `0.2.0.rrc.1.0-g1234567` (a double "r" from misplacing .r, and an un-substituted trailing
# hyphen makepkg's own pkgver linter rejects outright: "pkgver is not allowed to contain colons,
# forward slashes, hyphens or whitespace"), which is exactly the tag this repo carries for the
# whole 0.2.0-rc.N window. A global substitution has no such blind spot and needs no case split:
#   v0.2.0-rc.1-0-g1234567 -> 0.2.0.rc.1.0.g1234567   (verified against makepkg's check_pkgver)
#   v0.2.0-0-g1234567      -> 0.2.0.0.g1234567         (verified against makepkg's check_pkgver)
pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v//; s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"

	# Wire the neovide submodule to the local clone makepkg already fetched as a separate source=
	# entry, rather than fetching it a second time over the network (spec sec 9).
	git submodule init
	git config submodule.neovide.url "$srcdir/neovide"
	git -c protocol.file.allow=always submodule update

	# The Verdandi revision this build's sidecar must match: agent/Cargo.toml's own pin, asserted
	# 40 hex (spec sec 9's own words) -- the public repo always carries the full commit (never the
	# private tree's 7-hex abbreviation), so this is a sanity check on the published tree, not a
	# format conversion.
	_at_line=$(grep -E '^claude-runtime-protocol[[:space:]]*=' agent/Cargo.toml | head -n1)
	if [ -z "$_at_line" ]; then
		printf '==> ERROR: %s\n' "agent/Cargo.toml has no claude-runtime-protocol dependency: not the Eitri tree this PKGBUILD expects" >&2
		return 1
	fi
	_verdandi_rev=$(printf '%s\n' "$_at_line" | sed -n 's/.*rev[[:space:]]*=[[:space:]]*"\([^"]*\)".*/\1/p')
	if ! printf '%s' "$_verdandi_rev" | grep -Eqx '[0-9a-f]{40}'; then
		printf '==> ERROR: %s\n' "agent/Cargo.toml pins Verdandi at \"$_verdandi_rev\", which is not 40 hex: the public repo is expected to carry the full commit" >&2
		return 1
	fi

	cd "$srcdir/verdandi"
	git checkout --quiet "$_verdandi_rev"

	# "fails with 'this PKGBUILD needs a Node bump' if that rev's buildBinary.mjs pins a Node other
	# than the one in source=" (spec sec 9).
	_node_pin=$(sed -n "s/^const NODE_VERSION = '\\(v[0-9.]*\\)';.*/\\1/p" apps/claude-sidecar/scripts/buildBinary.mjs)
	if [ -z "$_node_pin" ]; then
		printf '==> ERROR: %s\n' "could not read NODE_VERSION out of Verdandi $_verdandi_rev's apps/claude-sidecar/scripts/buildBinary.mjs: the sidecar build recipe may have moved" >&2
		return 1
	fi
	if [ "$_node_pin" != "v22.23.2" ]; then
		printf '==> ERROR: %s\n' "this PKGBUILD needs a Node bump: Verdandi $_verdandi_rev's buildBinary.mjs pins $_node_pin, not the v22.23.2 in this PKGBUILD's source=" >&2
		return 1
	fi

	# git archive the checked-out Verdandi source (same shape as a real release's
	# verdandi-<rev7>-source.tar.gz), and a matching RELEASE for --build-sidecar-into to check its
	# inputs against (packaging/install.sh's own resolve_setup_release/parse_release; same fields
	# packaging/install.sh's synthesize_release_from_checkout writes, spec sec 6.2 D11's "the
	# owner's dev loop" mechanism, computed here directly since build() drives cargo itself rather
	# than going through --from-source's own per-user install flow).
	git archive --format=tar.gz -o "$srcdir/verdandi-source.tar.gz" HEAD
	_verdandi_sha=$(sha256sum "$srcdir/verdandi-source.tar.gz" | cut -d' ' -f1)
	_verdandi_rev7=${_verdandi_rev:0:7}

	cd "$srcdir/$pkgname"
	_eitri_version=$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)
	_eitri_commit=$(git rev-parse HEAD)
	_fork_commit=$(git -C neovide rev-parse HEAD)
	_pins=packaging/pins.env
	_node_version=$(sed -n 's/^NODE_VERSION=//p' "$_pins")
	_node_x64=$(sed -n 's/^NODE_SHA256_linux_x64=//p' "$_pins")
	_node_arm64=$(sed -n 's/^NODE_SHA256_linux_arm64=//p' "$_pins")
	_nvim_version=$(sed -n 's/^NVIM_VERSION=//p' "$_pins")
	_nvim_sha=$(sed -n 's/^NVIM_SHA256_linux_x86_64=//p' "$_pins")
	{
		printf 'EITRI_VERSION=%s\n' "$_eitri_version"
		printf 'EITRI_COMMIT=%s\n' "$_eitri_commit"
		printf 'NEOVIDE_FORK_COMMIT=%s\n' "$_fork_commit"
		printf 'VERDANDI_REV=%s\n' "$_verdandi_rev"
		printf 'VERDANDI_SOURCE=verdandi-%s-source.tar.gz\n' "$_verdandi_rev7"
		printf 'VERDANDI_SOURCE_SHA256=%s\n' "$_verdandi_sha"
		printf 'NODE_VERSION=%s\n' "$_node_version"
		printf 'NODE_SHA256_linux_x64=%s\n' "$_node_x64"
		printf 'NODE_SHA256_linux_arm64=%s\n' "$_node_arm64"
		printf 'NVIM_VERSION=%s\n' "$_nvim_version"
		printf 'NVIM_SHA256_linux_x86_64=%s\n' "$_nvim_sha"
	} >"$srcdir/release-for-sidecar.env"

	export CARGO_HOME="$srcdir/cargo"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

	# The Skia archive skia-bindings links against, named and hashed in this tree's own
	# packaging/pins.env (spec sec 9).
	_skia_url=$(sed -n 's/^SKIA_BINARIES_URL_UPSTREAM=//p' "$_pins")
	_skia_sha=$(sed -n 's/^SKIA_BINARIES_SHA256=//p' "$_pins")
	_skia_name=${_skia_url##*/}
	curl -fsSL -o "$srcdir/$_skia_name" "$_skia_url"
	printf '%s  %s\n' "$_skia_sha" "$srcdir/$_skia_name" | sha256sum -c -
}

build() {
	cd "$srcdir/$pkgname"
	export CARGO_HOME="$srcdir/cargo"
	_skia_url=$(sed -n 's/^SKIA_BINARIES_URL_UPSTREAM=//p' packaging/pins.env)
	_skia_name=${_skia_url##*/}
	SKIA_BINARIES_URL="file://$srcdir/$_skia_name" \
		cargo build --frozen --release -p shell -p agent -p supervisor --bins

	# The sidecar, from the Verdandi clone prepare() checked out and archived -- the same
	# --build-sidecar-into entry point eitri-bin's build() uses (spec sec 9: "the sidecar recipe
	# exists once"). Its slow part (npm's ~120 MB of the Agent SDK, then the TypeScript build and the
	# single binary) says nothing about how long it takes, so this one line does, as in eitri-bin.
	msg2 "Installing the Claude Agent SDK and building the sidecar (1-3 min)"
	sh packaging/install.sh \
		--build-sidecar-into "$srcdir/sidecar" \
		--node "$srcdir/node-v22.23.2-linux-x64.tar.xz" \
		--verdandi-source "$srcdir/verdandi-source.tar.gz" \
		--release-file "$srcdir/release-for-sidecar.env"
}

package() {
	cd "$srcdir/$pkgname"

	install -d "$pkgdir/usr/lib/eitri"
	install -m0755 "target/release/shell" "$pkgdir/usr/lib/eitri/shell"
	install -m0755 "target/release/eitri-supervisor" "$pkgdir/usr/lib/eitri/eitri-supervisor"
	install -m0755 "target/release/eitri-tmux-shim" "$pkgdir/usr/lib/eitri/eitri-tmux-shim"
	install -m0755 "target/release/eitri-claude-handoff" "$pkgdir/usr/lib/eitri/eitri-claude-handoff"
	install -m0755 "packaging/install.sh" "$pkgdir/usr/lib/eitri/eitri-setup"
	install -m0644 "$srcdir/release-for-sidecar.env" "$pkgdir/usr/lib/eitri/RELEASE"
	install -m0755 "$srcdir/sidecar/verdandi-claude-sidecar" "$pkgdir/usr/lib/eitri/verdandi-claude-sidecar"
	install -m0644 "$srcdir/sidecar/verdandi-claude-sidecar.rev" "$pkgdir/usr/lib/eitri/verdandi-claude-sidecar.rev"

	install -Dm0755 "packaging/eitri.launcher.sh" "$pkgdir/usr/bin/eitri"
	# The desktop entry is named by the application id (it replaced eitri.desktop, which an upgrade drops
	# by this package no longer listing it), and the icon is every file of packaging/icons/hicolor.
	install -Dm0644 "packaging/cn.huntergrey.eitri.desktop" \
		"$pkgdir/usr/share/applications/cn.huntergrey.eitri.desktop"
	local _icon
	while IFS= read -r _icon; do
		install -Dm0644 "packaging/icons/$_icon" "$pkgdir/usr/share/icons/$_icon"
	done < <(cd packaging/icons && find hicolor -type f | LC_ALL=C sort)

	# D15: this tree's own LICENSE, plus the built SDK's and Node's licences. No
	# THIRD-PARTY-LICENSES/SOURCE is written here at all -- unlike packaging/install.sh's own
	# from_source_stage, which writes both as an explanatory placeholder file
	# (packaging/install.sh:2097-2109), this locally-built, non-conveyed AUR package omits the
	# generated third-party attribution outright rather than shipping a placeholder saying so.
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# The icon is the Eitri logo, which LICENSE's MIT does not cover: its CC BY 4.0 notice (and the credit
	# for the colours) travels with it.
	install -m0644 "packaging/icons/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-icon"
	if [ -f "$srcdir/sidecar/LICENSE.md" ]; then
		install -m0644 "$srcdir/sidecar/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	fi
	if [ -f "$srcdir/sidecar/NODE-LICENSE" ]; then
		install -m0644 "$srcdir/sidecar/NODE-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/NODE-LICENSE"
	fi
}
