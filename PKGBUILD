# Composed Lumina Code AUR PKGBUILD.
#
# This file is a TEMPLATE rendered by .github/workflows/aur.yml before being
# pushed to AUR. The ${...} placeholders are substituted at release-publish
# time (see the render step in the workflow). Do NOT edit the rendered values
# by hand on AUR — regenerate via the workflow instead.
#
# The Maintainer line below is injected verbatim into the rendered PKGBUILD.
# Edit it once here; it propagates to AUR on every publish. namcap/aurweb
# both expect this tag on every AUR package.
# Maintainer: Iewnfod <iewnfoddd@outlook.com>
#
# Local sanity check (does NOT download the .deb — checksums are placeholders
# until rendered):
#   namcap .aur/PKGBUILD
#
# This is a -bin package: it downloads the upstream .deb produced by the
# Release workflow and repackages it for pacman. Both supported architectures
# are published from a single PKGBUILD via per-arch source/checksum arrays.
#
# NOTE on the bundled OpenCode server: the .deb carries a self-contained
# sidecar binary under usr/lib/Lumina Code/opencode (a Tauri RESOURCE, not
# externalBin — the old externalBin layout installed it as /usr/bin/opencode,
# polluting PATH and colliding with any user-installed opencode). It adds NO
# extra system dependencies — it is a statically linked single-file
# executable, and the app resolves it through its private resource dir.

pkgname=lumina-code-bin
pkgver=0.1.2
pkgrel=2
pkgdesc="A Tauri + React desktop GUI for OpenCode, bundling its own pinned server binary"
arch=('x86_64' 'aarch64')
url="https://github.com/iewnfod/lumina-code"
license=('MPL-2.0')

# Translated from the .deb's own Depends (libwebkit2gtk-4.1-0, libgtk-3-0, …)
# to their Arch equivalents. libayatana-appindicator covers the AppIndicator
# binding Tauri's GTK shell uses.
depends=(
	'webkit2gtk-4.1'
	'gtk3'
	'libayatana-appindicator'
	'hicolor-icon-theme'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
# CRITICAL: never let makepkg's tidy 'strip' step touch the payload. The
# bundled OpenCode server is a `bun build --compile` binary — `strip
# --strip-all` removes symbols its runtime needs to locate the embedded
# app, and the binary silently degrades to the bare bun CLI: `--version`
# prints the embedded bun runtime's version (e.g. "1.4.2") instead of
# "opencode v2.0.11" (verified byte-for-byte: stripped size 200457504 ==
# the "corrupted" binary from the v0.1.1/v0.1.2 incidents). The main Rust
# binary ships already-stripped, so skipping strip changes nothing else.
options=('!strip' '!debug')
optdepends=(
	'xdg-utils: open files/URLs from the app'
)

# Asset names differ per ecosystem — .deb uses dpkg arches (amd64/arm64):
#   x86_64  -> Lumina.Code_<ver>_amd64.deb
#   aarch64 -> Lumina.Code_<ver>_arm64.deb
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/Lumina.Code_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb::${url}/releases/download/v${pkgver}/Lumina.Code_${pkgver}_arm64.deb")
sha256sums_x86_64=('1bde62e215941e2cb69a8ad173c60ab6b6d7f61cd9cf411601954ab613987c1e')
sha256sums_aarch64=('b564eb92ea43383d9b23ed9f1b00621908c6f72889177a2c910e3000789515d1')

# No arch-independent sources — empty arrays keep makepkg's parser happy.
source=()
sha256sums=()

# A .deb is an ar(1) archive, not a tarball — stop makepkg from auto-extracting.
noextract=("${pkgname}-${pkgver}-"*.deb)

package() {
	# The .deb is an `ar` archive containing data.tar.<comp>; extract that
	# payload into a scratch dir, then relocate its usr/ tree into $pkgdir.
	# bsdtar (libarchive) reads .deb natively, so no extra depends on `ar`.
	cd "${srcdir}"

	local scratch="${srcdir}/_unpacked"
	rm -rf "${scratch}"
	mkdir "${scratch}"

	# The downloaded .deb lands in $srcdir under the filename on the LEFT of
	# the `::` in each source_* entry. makepkg exposes the entry *as written*
	# (i.e. "name::url"), so strip the "::url" suffix to get the local filename.
	# ${...%%::*} strips the longest match of "::" + everything after it.
	local entry="${source_x86_64[0]:-${source_aarch64[0]}}"
	local deb="${entry%%::*}"

	# A .deb is an `ar` archive whose `data.tar.*` member holds the actual
	# filesystem tree. We stream that member out of the .deb and into the
	# scratch dir in one pipe. The `data.tar.*` is quoted so the shell does
	# NOT glob-expand it locally — bsdtar matches it against members inside
	# the .deb (verified against the lumina-terminal v0.1.5 release payload).
	#
	# The payload already lays out usr/{bin,lib,share/applications,share/icons/...}
	# exactly as pacman expects it (the sidecar resource rides under
	# usr/lib/Lumina Code/), so we have nothing to reassemble here.
	bsdtar -xOf "${deb}" 'data.tar.*' | bsdtar -xf - -C "${scratch}"

	# Relocate the extracted tree into $pkgdir verbatim, preserving mode,
	# symlinks and mtimes. -a copies recursively with attributes retained.
	cp -a "${scratch}/." "${pkgdir}/"
}
