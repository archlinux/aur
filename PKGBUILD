# Maintainer: xpufx <github@xpufx.com>
pkgname=paseo-desktop-git
pkgver=0.7.2.r39.gae80ec425
pkgrel=1
pkgdesc="One interface for all your Claude Code, Codex and OpenCode agents. (git - built from main)"
arch=('x86_64')
url="https://paseo.sh"
license=("Apache-2.0")
depends=(libxkbcommon libxcb libgcc gtk3 libxext libx11 libcups nspr mesa dbus pango libxcomposite libxrandr nodejs glib2 nss libxdamage alsa-lib systemd-libs bash hicolor-icon-theme cairo at-spi2-core expat libstdc++ libxfixes)
makedepends=('git' 'npm' 'nodejs' 'python')
provides=("paseo=${pkgver}" "paseo-desktop-git")
conflicts=(paseo paseo-bin paseo-appimage paseo-desktop-bin paseo-desktop-bin-beta paseo-desktop-bin-edge)
source=('paseo::git+https://github.com/getpaseo/paseo.git#branch=main')
sha256sums=('SKIP')
options=('!strip')

pkgver() {
	cd "$srcdir/paseo"
	if git describe --long --tags >/dev/null 2>&1; then
		git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf "0.7.2.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd "$srcdir/paseo"
	npm ci
	npm run build:desktop -- --publish never --linux dir --x64
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
	mkdir -p "${pkgdir}/opt/paseo"
	cp -a "${_unpacked}/." "${pkgdir}/opt/paseo/"

	# Desktop file and icons — same as bin deb's /usr/share
	# electron-builder dir already contains the .desktop in resources? Ensure System integration:
	mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons"
	if [ -f "packages/desktop/build/icon.png" ]; then
		install -Dm644 "packages/desktop/build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/paseo.png"
	fi
	# Generate desktop entry like deb's (matches paseo-desktop-bin)
	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/paseo.desktop" <<DESKTOP
[Desktop Entry]
Name=Paseo
Comment=One interface for all your Claude Code, Codex and OpenCode agents
Exec=/opt/paseo/paseo %U
Icon=paseo
Type=Application
Categories=Development;
StartupWMClass=Paseo
DESKTOP

	# Ensure perms like bin package
	chmod -R go-w "${pkgdir}/opt" "${pkgdir}/usr" 2>/dev/null || true
	find "${pkgdir}/opt" "${pkgdir}/usr" -type d -exec chmod 755 {} + 2>/dev/null || true
	chown -R root:root "${pkgdir}" 2>/dev/null || true
}
