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
pkgver=0.11.0.r8.g1ae979d3d
pkgrel=2
# Publish targets: aur + Arch release + Debian release (opt-in per format).
_publish_targets="aur github-arch github-deb"
# Debian runtime deps for the fpm conversion, translated from depends and
# cross-checked against `readelf -d` on the shipped ELF payload:
#   glibc->libc6, libgcc->libgcc-s1, libstdc++->libstdc++6, gtk3->libgtk-3-0t64,
#   glib2->libglib2.0-0t64, at-spi2-core->libatspi2.0-0t64, cairo->libcairo2,
#   pango->libpango-1.0-0, expat->libexpat1, nss->libnss3, nspr->libnspr4,
#   libcups->libcups2t64, dbus->libdbus-1-3, alsa-lib->libasound2t64,
#   systemd-libs->libudev1, mesa->libgbm1, libx11->libx11-6, libxcb->libxcb1,
#   libxext->libxext6, libxcomposite->libxcomposite1, libxdamage->libxdamage1,
#   libxfixes->libxfixes3, libxrandr->libxrandr2, libxkbcommon->libxkbcommon0.
#   Electron additionally dlopens libatk1.0-0t64/libatk-bridge2.0-0t64,
#   libnotify4, libxss1, libxtst6, libsecret-1-0 and libuuid1, and calls
#   xdg-utils. t64 is what Debian 13 (trixie) and Ubuntu 24.04 (noble) ship;
#   the pre-t64 names have no candidate on either, which deb-smoke runs.
_deb_depends=('libc6' 'libgcc-s1' 'libstdc++6' 'libgtk-3-0t64' 'libglib2.0-0t64' 'libatk1.0-0t64' 'libatk-bridge2.0-0t64' 'libatspi2.0-0t64' 'libcairo2' 'libpango-1.0-0' 'libexpat1' 'libx11-6' 'libxcb1' 'libxext6' 'libxcomposite1' 'libxdamage1' 'libxfixes3' 'libxrandr2' 'libxkbcommon0' 'libnspr4' 'libnss3' 'libcups2t64' 'libdbus-1-3' 'libasound2t64' 'libudev1' 'libgbm1' 'libnotify4' 'libxss1' 'libxtst6' 'libsecret-1-0' 'libuuid1' 'xdg-utils' 'hicolor-icon-theme' 'bash' 'nodejs')
# Debian variant-exclusion for the fpm conversion (#61): all six paseo-*
# .debs ship /usr/bin/paseo and are mutually exclusive. Arch-only names
# (paseo, paseo-bin, ...) have no .deb counterpart, so the Debian list names
# the concrete sibling .debs plus the shared `paseo` virtual instead of
# reusing the Arch conflicts array verbatim.
_deb_provides=('paseo')
_deb_conflicts=('paseo-cli-edge' 'paseo-cli-git' 'paseo-cli-git-bin' 'paseo-desktop-bin-edge' 'paseo-desktop-git' 'paseo')
_commit='1ae979d3d04042f67c2e95921a07e910588dcd00'
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
_bin_sha='aacb4d0c049706b0c7d81dd2d17cb15926b499db703376dbaa60e1c07f2dd9a9'
_icon_sha='585d202ff6a6e41bcd5c7464a1c4889b78977cea000f7b88ba1f67f3d9fff0bd'
_pkgdesc_base='One interface for all your Claude Code, Codex and OpenCode agents.'
pkgdesc='One interface for all your Claude Code, Codex and OpenCode agents. (built from main 2026-10-07 @1ae979d)'
arch=('x86_64')
url="https://paseo.sh"
license=("Apache-2.0")
depends=(libxkbcommon libxcb libgcc gtk3 libxext libx11 libcups nspr mesa dbus pango libxcomposite libxrandr nodejs glib2 nss libxdamage alsa-lib systemd-libs bash hicolor-icon-theme cairo at-spi2-core expat libstdc++ libxfixes)
provides=("paseo=${pkgver}" "paseo-desktop-git")
conflicts=(paseo paseo-bin paseo-appimage paseo-cli-bun paseo-desktop-bin paseo-desktop-bin-edge paseo-desktop-git paseo-cli paseo-cli-edge paseo-cli-git paseo-cli-git-bin)
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
