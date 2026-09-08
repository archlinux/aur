# Maintainer: xpufx <github@xpufx.com>
# Prebuilt companion to paseo-desktop-git: same Electron tree (built from
# upstream/main), repacked from our release asset so users skip the build.
# _commit pins the upstream commit; _asset/_bin_sha pin the prebuilt tarball
# (unversioned filename, content rolls — sha is bumped every cycle).

pkgname=paseo-desktop-git-bin
pkgver=0.8.0.beta.1.r5.gda8c1b5c9
pkgrel=1
_commit='da8c1b5c94e752b01d451645e5fa52aba2c1b2f0'
_asset='Paseo-0.8.0-beta.1-x64.tar.gz'
_bin_sha='6fb61f1214ca1da295259953ce6f38f56ed8eac2d3fcaf55dece75c8d63d8021'
_icon_sha='585d202ff6a6e41bcd5c7464a1c4889b78977cea000f7b88ba1f67f3d9fff0bd'
_pkgdesc_base='One interface for all your Claude Code, Codex and OpenCode agents.'
pkgdesc='One interface for all your Claude Code, Codex and OpenCode agents. (built from main 2026-09-08 @da8c1b5)'
arch=('x86_64')
url="https://paseo.sh"
license=("Apache-2.0")
depends=(libxkbcommon libxcb libgcc gtk3 libxext libx11 libcups nspr mesa dbus pango libxcomposite libxrandr nodejs glib2 nss libxdamage alsa-lib systemd-libs bash hicolor-icon-theme cairo at-spi2-core expat libstdc++ libxfixes)
provides=("paseo=${pkgver}" "paseo-desktop-git")
conflicts=(paseo paseo-bin paseo-appimage paseo-desktop-bin paseo-desktop-bin-beta paseo-desktop-bin-edge paseo-desktop-git)
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
