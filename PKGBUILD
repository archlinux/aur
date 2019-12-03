# Maintainer: Sebastian Meyer <mail@bastimeyer.de>
# Former maintainer: Ben Fox-Moore <ben.foxmoore@gmail.com>
pkgname=streamlink-twitch-gui
pkgver=1.9.0
pkgrel=1
pkgdesc="A multi platform Twitch.tv browser for Streamlink"
arch=("i686" "x86_64")
url="https://github.com/streamlink/streamlink-twitch-gui"
license=("MIT")
depends=("gtk3" "libxss" "nss" "streamlink")
provides=("streamlink-twitch-gui")
conflicts=("streamlink-twitch-gui-git")
options=(!strip)
source=("https://raw.githubusercontent.com/streamlink/streamlink-twitch-gui/v${pkgver}/LICENSE")
source_i686=("https://github.com/streamlink/streamlink-twitch-gui/releases/download/v${pkgver}/streamlink-twitch-gui-v${pkgver}-linux32.tar.gz")
source_x86_64=("https://github.com/streamlink/streamlink-twitch-gui/releases/download/v${pkgver}/streamlink-twitch-gui-v${pkgver}-linux64.tar.gz")
sha256sums=('a3f70e2c1fabdc05bde59f20d77863362d127b1c231c735a0422fa079c40415f')
sha256sums_i686=('32ea30c7ec6d5f5e78d945cc76f9e42abf1d17e0320e2360d1c3b2370e1fc81d')
sha256sums_x86_64=('dbc34b33174da38676d046d1b0714b9db6c44cd6cf3a75d41cc15357f5cd1d6b')

package() {
	cd "${srcdir}/${pkgname}"

	# set up package directories
	install -d \
		"${pkgdir}/opt/${pkgname}/" \
		"${pkgdir}/usr/bin/" \
		"${pkgdir}/usr/share/applications/"

	# copy licenses
	install -Dm644 \
		-t "${pkgdir}/usr/share/licenses/${pkgname}/" \
		"${srcdir}/LICENSE" \
		"./credits.html"

	# copy application content and remove unneeded files and dirs
	cp -a "./" "${pkgdir}/opt/${pkgname}/"
	rm -r "${pkgdir}/opt/${pkgname}/"{{add,remove}-menuitem.sh,credits.html,icons/}

	# create custom start script and disable version check
	cat > "${pkgdir}/usr/bin/${pkgname}" <<-EOF
		#!/usr/bin/env bash
		/opt/${pkgname}/${pkgname} "\$@" --no-version-check
	EOF
	chmod +x "${pkgdir}/usr/bin/${pkgname}"

	# copy icons
	for res in 16 32 48 64 128 256; do
		install -Dm644 \
			"./icons/icon-${res}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
	done

	# create menu shortcut
	cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<-EOF
		[Desktop Entry]
		Type=Application
		Name=Streamlink Twitch GUI
		GenericName=Twitch.tv browser for Streamlink
		Comment=Browse Twitch.tv and watch streams in your videoplayer of choice
		Keywords=streamlink;livestreamer;twitch;
		Categories=AudioVideo;
		Exec=/usr/bin/${pkgname}
		Icon=${pkgname}
	EOF
}
