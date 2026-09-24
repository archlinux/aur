# Maintainer: isbest <icoderdev@outlook.com>

pkgname=mirasim-bin
pkgver=0.0.354
pkgrel=3
pkgdesc='Terminal, agent, model and tool orchestrator'
arch=('x86_64' 'aarch64')
url='https://mirasim.ai'
license=('LicenseRef-proprietary')
depends=(
	alsa-lib
	at-spi2-core
	cairo
	dbus
	expat
	glib2
	gtk3
	hicolor-icon-theme
	libcups
	libdrm
	libnotify
	libsecret
	libx11
	libxcb
	libxcomposite
	libxdamage
	libxext
	libxfixes
	libxkbcommon
	libxrandr
	libxss
	libxtst
	mesa
	nspr
	nss
	pango
	systemd-libs
	util-linux-libs
	xdg-utils
)
optdepends=('libappindicator: system tray icon')
provides=("mirasim=${pkgver}")
conflicts=('mirasim')
makedepends=('imagemagick')
options=('!strip' '!debug')
source=('launcher-flags.patch')
source_x86_64=("https://cdn-assets.mirasim.ai/mirasim/releases/v${pkgver}/Mirasim-${pkgver}-linux-amd64.deb")
source_aarch64=("https://cdn-assets.mirasim.ai/mirasim/releases/v${pkgver}/Mirasim-${pkgver}-linux-arm64.deb")
sha256sums=('6ea545e822b05486a227c96ca68ed0b215be4b86739580a5fe7f01d1df7d744d')
sha256sums_x86_64=('225335cce738b292ef6ff06aa82410937cd77b068c927dfb14d80c04bcc20dd1')
sha256sums_aarch64=('4e1f20ba8c8549d997d08f05276cc3ed325cae656d49522c8e75ded19bbc1031')

package() {
	local deb
	case "$CARCH" in
		x86_64) deb="${srcdir}/Mirasim-${pkgver}-linux-amd64.deb" ;;
		aarch64) deb="${srcdir}/Mirasim-${pkgver}-linux-arm64.deb" ;;
	esac

	# Upstream links this command in the deb postinst. The desktop file execs
	# the absolute path under /opt, so the app does not depend on the link.
	bsdtar -xOf "$deb" data.tar.xz | bsdtar -x -C "$pkgdir" -f -
	install -dm755 "${pkgdir}/usr/bin"
	ln -s /opt/Mirasim/mirasim-desktop "${pkgdir}/usr/bin/mirasim-desktop"
	patch -d "${pkgdir}/opt/Mirasim" -p1 < "${srcdir}/launcher-flags.patch"

	# The deb ships only 1024x1024. hicolor/index.theme does not list that
	# directory, so icon lookups at every menu and taskbar size miss it.
	local src_icon size
	src_icon="${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/mirasim-desktop.png"
	for size in 16 22 24 32 48 64 96 128 192 256 512; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
		magick "$src_icon" -resize "${size}x${size}" \
			"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/mirasim-desktop.png"
	done
}
