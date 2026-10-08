# Maintainer: xpufx <github@xpufx.com>
pkgname=paseo-desktop-git
pkgver=0.11.1.r7.g06fe97c90
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
_deb_conflicts=('paseo-cli-edge' 'paseo-cli-git' 'paseo-cli-git-bin' 'paseo-desktop-bin-edge' 'paseo-desktop-git-bin' 'paseo')
pkgdesc="One interface for all your Claude Code, Codex and OpenCode agents. (git - built from main)"
arch=('x86_64')
url="https://paseo.sh"
license=("Apache-2.0")
depends=(libxkbcommon libxcb libgcc gtk3 libxext libx11 libcups nspr mesa dbus pango libxcomposite libxrandr nodejs glib2 nss libxdamage alsa-lib systemd-libs bash hicolor-icon-theme cairo at-spi2-core expat libstdc++ libxfixes)
makedepends=('git' 'npm' 'nodejs' 'python')
provides=("paseo=${pkgver}" "paseo-desktop=${pkgver}" "paseo-desktop-git")
conflicts=(paseo paseo-bin paseo-appimage paseo-cli-bun paseo-desktop-bin paseo-desktop-bin-edge paseo-desktop-git-bin paseo-cli paseo-cli-edge paseo-cli-git paseo-cli-git-bin)
source=('paseo::git+https://github.com/getpaseo/paseo.git#branch=main')
sha256sums=('SKIP')
options=('!strip')

pkgver() {
	cd "$srcdir/paseo"
	# --match 'v[0-9]*': only mainline version tags. Upstream also tags
	# per-platform releases (desktop-windows-*, android-*) at the same
	# commits; without this, describe picks e.g. desktop-windows-v0.8.0
	# and the pkgver comes out as desktop.windows....
	if git describe --long --tags --match 'v[0-9]*' >/dev/null 2>&1; then
		git describe --long --tags --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf "0.7.2.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd "$srcdir/paseo"
	npm ci
	# dir feeds package() (linux-unpacked); tar.gz + AppImage are standalone
	# release assets uploaded as-is (--linux takes a target array).
	npm run build:desktop -- --publish never --linux dir tar.gz AppImage --x64
}

package() {
	cd "$srcdir/paseo"
	_unpacked=$(find packages/desktop/release packages/desktop/dist -maxdepth 2 -type d -name "linux-unpacked" 2>/dev/null | head -n1)
	if [ -z "$_unpacked" ] || [ ! -d "$_unpacked" ]; then
		echo "linux-unpacked not found after build" >&2
		ls -R packages/desktop/release 2>&1 | head -n 80
		ls -R packages/desktop/dist 2>&1 | head -n 80
		exit 1
	fi
	echo "Using unpacked: $_unpacked"
	mkdir -p "${pkgdir}/opt/Paseo"
	cp -a "${_unpacked}/." "${pkgdir}/opt/Paseo/"

	# Desktop file and icons — match bin deb (/opt/Paseo/Paseo, /usr/share/applications/Paseo.desktop)
	mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons"
	if [ -f "packages/desktop/build/icon.png" ]; then
		install -Dm644 "packages/desktop/build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/Paseo.png"
		# compat lowercase alias
		install -Dm644 "packages/desktop/build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/paseo.png"
	fi
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
	# compat lowercase desktop file
	install -Dm644 "${pkgdir}/usr/share/applications/Paseo.desktop" "${pkgdir}/usr/share/applications/paseo.desktop"

	# Provide /usr/bin/paseo as symlink to bundled CLI (mutually exclusive with cli)
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf /opt/Paseo/resources/bin/paseo "${pkgdir}/usr/bin/paseo"

	# Ensure perms like bin package
	chmod -R go-w "${pkgdir}/opt" "${pkgdir}/usr" 2>/dev/null || true
	find "${pkgdir}/opt" "${pkgdir}/usr" -type d -exec chmod 755 {} + 2>/dev/null || true
	chown -R root:root "${pkgdir}" 2>/dev/null || true
	# ensure symlink target is executable
	chmod 755 "${pkgdir}/opt/Paseo/Paseo" "${pkgdir}/opt/Paseo/resources/bin/paseo" 2>/dev/null || true
}
