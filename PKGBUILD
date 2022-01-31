###########################################################
# !!!!!!!!!!!! THIS PACKAGE HAS BEEN RENAMED !!!!!!!!!!!! #
###########################################################
#
# Please install the PKGBUILD from the
#
#   streamlink-twitch-gui-bin
#
# AUR package instead.
#
# ----
#
# This message has been added as a temporary warning to
# let users of the old package know about the name change.
#
# A merge request with the new package (which will move all
# comments and votes) will be submitted shortly, once most
# users had enough time to see this message and switch.
#
# Please note that during this transition period, the
# PKGBUILD won't be changed to a build-from-source version
# and that it also won't be upgraded to the 2.0.0 release.
#
# Users of Streamlink Twitch GUI will have to upgrade to
# the 2.0.0 release until the end of February due to the
# shutdown of Twitch's kraken API. For more information,
# please see the changelog of the 2.0.0 release.
#
# Thank you!
#
###########################################################


# Maintainer: Sebastian Meyer <mail@bastimeyer.de>	
pkgname=streamlink-twitch-gui
pkgver=1.13.0
pkgrel=2
pkgdesc="A multi platform Twitch.tv browser for Streamlink"
arch=("i686" "x86_64")
url="https://github.com/streamlink/streamlink-twitch-gui"
license=("MIT")
depends=("gtk3" "libxss" "nss" "streamlink")
options=(!strip)
install=streamlink-twitch-gui.install
source_i686=("https://github.com/streamlink/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux32.tar.gz")
source_x86_64=("https://github.com/streamlink/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux64.tar.gz")
sha256sums_i686=('e8c149d05103d0da91262d5e2dff2edb4badc77f3b7cd049d420f39de573ae8d')
sha256sums_x86_64=('5b3ea3d701428bb96bbc26edd5aeaaf29d1a60a9d20d3a990fd37617a74c98fb')

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
		"./LICENSE.txt" \
		"./credits.html"

	# copy appstream metainfo
	install -Dm644 \
		-t "${pkgdir}/usr/share/metainfo/" \
		"./${pkgname}.appdata.xml"

	# copy application content and remove unneeded files and dirs
	cp -a "./" "${pkgdir}/opt/${pkgname}/"
	rm -r "${pkgdir}/opt/${pkgname}/"{{add,remove}-menuitem.sh,LICENSE.txt,credits.html,"${pkgname}.appdata.xml",icons/}

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
		Keywords=streamlink;twitch;streaming;
		Categories=AudioVideo;Network;
		Exec=/usr/bin/${pkgname}
		Icon=${pkgname}
	EOF
}
