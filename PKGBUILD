# Maintainer: xpufx <github@xpufx.com>
# Prebuilt companion to paseo-desktop-git: same Electron tree (built from
# upstream/main), repacked from our release asset so users skip the build.
# _commit pins the upstream commit; _bin_sha pins the prebuilt tarball.
#
# _asset is DERIVED from pkgver, never set independently (aur#11). The
# previous shape carried `_asset='Paseo-0.9.0-beta.1-x64.tar.gz'` alongside
# `pkgver=0.9.0.beta.2.r1.gd636abd7a` — two sources of truth for one fact,
# which is how the package came to advertise beta.2 while shipping beta.1
# binaries. Upstream electron-builder names the tarball from the release
# version (`artifactName: "Paseo-${version}-${arch}.${ext}"`, dashes, e.g.
# `0.9.0-beta.2`), while pkgver is the dot-form git-describe string with a
# `.rN.gSHA` suffix. So the release version is recovered by dropping that
# suffix and mapping the prerelease separator dot back to a dash. The URL
# in source=() is composed from the same expression, so a pkgver/asset
# mismatch is structurally impossible rather than merely checked for.

pkgname=paseo-desktop-git-bin
# NOTE: pkgver/_commit/_bin_sha are re-stamped together by
# scripts/update.d/git-bin.sh on each bump, and only when the matching
# release asset already exists. The values here must always describe ONE
# consistent build: pkgver must derive the _asset that is actually on the
# release, and _commit/_bin_sha must be that same build. Do not hand-edit
# one of the three in isolation.
pkgver=0.9.0.r1.g91d9cf1db
pkgrel=2
_commit='91d9cf1dbd0c095c8971d7e8f1fb73eb60a6a786'
# Drop the .rN.gSHA git-describe suffix, then turn the prerelease separator
# dot into a dash (0.9.0.beta.2 -> 0.9.0-beta.2). Only that one dot is
# touched, so a version without a suffix or without a prerelease is left
# alone. Pinned to the expected numeric x.y.z release shape so it cannot
# silently mangle an unrecognised pkgver.
_asset_ver=$(printf '%s' "$pkgver" | sed -E 's/\.r[0-9]+\.g[0-9a-f]+$//' | sed -E 's/^([0-9]+\.[0-9]+\.[0-9]+)\./\1-/')
if ! printf '%s' "$_asset_ver" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z.]+)?$'; then
	error "paseo-desktop-git-bin: cannot derive a release version from pkgver='$pkgver' (got '$_asset_ver'); refusing to guess an asset name"
fi
_asset="Paseo-${_asset_ver}-x64.tar.gz"
_bin_sha='48068e839989c09c23ad28af9bcd898e5223bb1b9c42ceb293247b79fb206247'
_icon_sha='585d202ff6a6e41bcd5c7464a1c4889b78977cea000f7b88ba1f67f3d9fff0bd'
_pkgdesc_base='One interface for all your Claude Code, Codex and OpenCode agents.'
pkgdesc='One interface for all your Claude Code, Codex and OpenCode agents. (built from main 2026-09-22 @91d9cf1)'
arch=('x86_64')
url="https://paseo.sh"
license=("Apache-2.0")
depends=(libxkbcommon libxcb libgcc gtk3 libxext libx11 libcups nspr mesa dbus pango libxcomposite libxrandr nodejs glib2 nss libxdamage alsa-lib systemd-libs bash hicolor-icon-theme cairo at-spi2-core expat libstdc++ libxfixes)
provides=("paseo=${pkgver}" "paseo-desktop-git")
conflicts=(paseo paseo-bin paseo-appimage paseo-desktop-bin paseo-desktop-bin-edge paseo-desktop-git)
source=("Paseo-git-bin.tar.gz::https://github.com/xpufx/xpufx-pkgs/releases/download/arch-x86_64-current/${_asset}"
        "icon.png::https://raw.githubusercontent.com/getpaseo/paseo/${_commit}/packages/desktop/assets/icon.png")
sha256sums=("$_bin_sha"
            "$_icon_sha")
options=('!strip')

package() {
	cd "$srcdir"
	tar -xzf "Paseo-git-bin.tar.gz"
	# electron-builder tarballs wrap linux-unpacked either at root or one
	# level down — locate the Paseo binary instead of assuming the layout.
	_bindir=$(find "$srcdir" -maxdepth 3 -name Paseo -type f -printf '%h\n' 2>/dev/null | head -n1)
	if [ -z "$_bindir" ]; then
		echo "Paseo binary not found in tarball" >&2
		find "$srcdir" -maxdepth 3 2>/dev/null | head -n 40
		exit 1
	fi
	echo "Using unpacked: $_bindir"
	mkdir -p "${pkgdir}/opt/Paseo"
	cp -a "${_bindir}/." "${pkgdir}/opt/Paseo/"

	# Desktop file and icons — match paseo-desktop-git (/opt/Paseo/Paseo).
	mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons"
	install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/Paseo.png"
	install -Dm644 "$srcdir/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/paseo.png"
	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/Paseo.desktop" <<DESKTOP
[Desktop Entry]
Name=Paseo
Comment=One interface for all your Claude Code, Codex and OpenCode agents
Exec=/opt/Paseo/Paseo %U
Icon=Paseo
Type=Application
Categories=Development;
StartupWMClass=Paseo
MimeType=x-scheme-handler/paseo;
DESKTOP
	install -Dm644 "${pkgdir}/usr/share/applications/Paseo.desktop" "${pkgdir}/usr/share/applications/paseo.desktop"

	# Provide /usr/bin/paseo as symlink to bundled CLI (mutually exclusive with cli)
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf /opt/Paseo/resources/bin/paseo "${pkgdir}/usr/bin/paseo"

	chmod -R go-w "${pkgdir}/opt" "${pkgdir}/usr" 2>/dev/null || true
	find "${pkgdir}/opt" "${pkgdir}/usr" -type d -exec chmod 755 {} + 2>/dev/null || true
	chown -R root:root "${pkgdir}" 2>/dev/null || true
	chmod 755 "${pkgdir}/opt/Paseo/Paseo" "${pkgdir}/opt/Paseo/resources/bin/paseo" 2>/dev/null || true
}
