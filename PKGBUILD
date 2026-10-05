# Composed Lumina Code CEF AUR PKGBUILD.
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
# This is the CEF (Chromium) rendering variant of lumina-code-bin: same app,
# same backend, but the webview is bundled Chromium (tauri v3 alpha line +
# tauri-runtime-cef) instead of the system WebKitGTK. Read "experimental":
# the underlying tauri runtime is pre-stable. It can be installed SIDE BY
# SIDE with lumina-code-bin — different identifier (own data/profile dirs),
# different binary and desktop entry.
#
# NOTE on the bundled OpenCode server: the .deb carries a self-contained
# sidecar binary under usr/lib/Lumina Code CEF/opencode (a Tauri RESOURCE,
# not externalBin — never /usr/bin/opencode). It adds NO extra system
# dependencies — statically linked single-file executable.

pkgname=lumina-code-cef-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A Tauri + React desktop GUI for OpenCode — CEF (Chromium) rendering variant, bundling its own pinned server binary"
arch=('x86_64' 'aarch64')
url="https://github.com/iewnfod/lumina-code"
license=('MPL-2.0')

# Translated from the CEF .deb's own Depends (libgtk-4-1, …) to their Arch
# equivalents — no webkit2gtk/gtk3 here, the Chromium runtime (libcef.so)
# ships inside the package.
depends=(
	'gtk4'
	'hicolor-icon-theme'
)
# Deliberately NO provides/conflicts against lumina-code(-bin): the two
# flavors coexist by design (distinct identifier, binary and desktop entry).
provides=("lumina-code-cef=${pkgver}")
conflicts=('lumina-code-cef')
# CRITICAL: never let makepkg's tidy 'strip' step touch the payload. The
# bundled OpenCode server is a `bun build --compile` binary — `strip
# --strip-all` removes symbols its runtime needs to locate the embedded
# app, and the binary silently degrades to the bare bun CLI (verified in
# the v0.1.1/v0.1.2 incidents on the webkit flavor). libcef.so is likewise
# shipped as-built. The main Rust binary ships already-stripped.
options=('!strip' '!debug')
optdepends=(
	'xdg-utils: open files/URLs from the app'
)

# Asset names differ per ecosystem — .deb uses dpkg arches (amd64/arm64).
# NOTE: the tauri v3 bundler keeps the productName spaces in the LOCAL
# filename, but GitHub's release-asset upload replaces spaces with dots —
# the REMOTE asset these URLs point at is dotted like the webkit flavor's:
#   x86_64  -> Lumina.Code.CEF_<ver>_amd64.deb
#   aarch64 -> Lumina.Code.CEF_<ver>_arm64.deb
#
# The URL's tag segment is the v0.4.0 placeholder (the release TAG verbatim,
# e.g. "v0.1.2-2"), NOT "v${pkgver}": republished releases carry a suffix in
# the tag while the assets stay named after the plain app version.
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::${url}/releases/download/v0.4.0/Lumina.Code.CEF_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb::${url}/releases/download/v0.4.0/Lumina.Code.CEF_${pkgver}_arm64.deb")
sha256sums_x86_64=('ab33ccc95f59de59976d2521c9c035fff86b45405fda59dfe91d20d107282147')
sha256sums_aarch64=('41f6d3d73770932e47daf9101c925c66f086d85cfff817fa88c59c2304c75e59')

# No arch-independent sources — empty arrays keep makepkg's parser happy.
source=()
sha256sums=()

# A .deb is an ar(1) archive, not a tarball — stop makepkg from auto-extracting.
noextract=("${pkgname}-${pkgver}-"*.deb)

package() {
	# Same deb repack as lumina-code-bin: stream data.tar.* out of the ar
	# archive and relocate the usr/ tree verbatim (the Chromium runtime and
	# the sidecar both ride under usr/lib/Lumina Code CEF/).
	cd "${srcdir}"

	local scratch="${srcdir}/_unpacked"
	rm -rf "${scratch}"
	mkdir "${scratch}"

	local entry="${source_x86_64[0]:-${source_aarch64[0]}}"
	local deb="${entry%%::*}"

	bsdtar -xOf "${deb}" 'data.tar.*' | bsdtar -xf - -C "${scratch}"

	cp -a "${scratch}/." "${pkgdir}/"
}
