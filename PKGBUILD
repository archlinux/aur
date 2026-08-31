# Composed Lumina Terminal AUR PKGBUILD.
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
# Release workflow and repackages it for pacman, mirroring what install.sh
# does for Arch users on the fly. Both supported architectures are published
# from a single PKGBUILD via per-arch source/checksum arrays.

pkgname=lumina-terminal-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="A modern, cross-platform terminal emulator built with Tauri, React, and Xterm.js"
arch=('x86_64' 'aarch64')
url="https://github.com/iewnfod/lumina-terminal"
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
optdepends=(
	'xdg-utils: open files/URLs from the terminal'
)

# Asset names differ per ecosystem — .deb uses dpkg arches (amd64/arm64):
#   x86_64  -> Lumina.Terminal_<ver>_amd64.deb
#   aarch64 -> Lumina.Terminal_<ver>_arm64.deb
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/Lumina.Terminal_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb::${url}/releases/download/v${pkgver}/Lumina.Terminal_${pkgver}_arm64.deb")
sha256sums_x86_64=('ed832593c7e1a52d3a6d14d8dd2f2462de4d6fc55b3258ba05b7a23331e59693')
sha256sums_aarch64=('69b547619c5f4a8a7c0743167fc73abc114fdc6ffa0f14b6b445085b1e3c1298')

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
	# the .deb (verified against the v0.1.5 release payload).
	#
	# The payload already lays out usr/{bin,share/applications,share/icons/...}
	# exactly as pacman expects it, so we have nothing to reassemble here.
	bsdtar -xOf "${deb}" 'data.tar.*' | bsdtar -xf - -C "${scratch}"

	# Relocate the extracted tree into $pkgdir verbatim, preserving mode,
	# symlinks and mtimes. -a copies recursively with attributes retained.
	cp -a "${scratch}/." "${pkgdir}/"
}
