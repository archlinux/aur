# Maintainer: Sebastian Meyer <mail@bastimeyer.de>

pkgname=streamlink-twitch-gui-git
_pkgname=streamlink-twitch-gui
pkgver=1897.3ed63629
pkgrel=1
pkgdesc="A multi platform Twitch.tv browser for Streamlink"
arch=("i686" "x86_64")
url="https://github.com/streamlink/streamlink-twitch-gui"
license=("MIT")
provides=("streamlink-twitch-gui")
conflicts=("streamlink-twitch-gui")
depends=(
	"alsa-lib"
	"gconf"
	"glib2"
	"gtk2"
	"libxtst"
	"nss"
	"streamlink"
)
makedepends=(
	"git"
	"nodejs"
	"yarn"
	"grunt-cli"
	"rsync"
)
options=(!strip)
source=(${_pkgname}::"git+https://github.com/streamlink/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	yarn install --pure-lockfile --non-interactive
	grunt release
}

package() {
	# the dir of the built application
	builddir="${srcdir}/${_pkgname}/build/releases/${_pkgname}/$(echo ${CARCH} | sed -e 's/x86_64/linux64/' -e 's/i686/linux32/')"

	# set up package directories
	install -d \
		"${pkgdir}/opt/${_pkgname}/" \
		"${pkgdir}/usr/bin/" \
		"${pkgdir}/usr/share/applications/"

	# copy application content and ignore certain files and dirs
	rsync -a \
		--exclude "start.sh" \
		--exclude "add-menuitem.sh" \
		--exclude "remove-menuitem.sh" \
		--exclude "credits.html" \
		--exclude "icons" \
		"${builddir}/" \
		"${pkgdir}/opt/${_pkgname}/"

	# create custom start script and disable version check
	cat > "${pkgdir}/usr/bin/${_pkgname}" <<-EOF
		#!/usr/bin/env bash
		/opt/${_pkgname}/${_pkgname} "\$@" --no-version-check
	EOF
	chmod +x "${pkgdir}/usr/bin/${_pkgname}"

	# copy icons
	for res in 16 32 48 64 128 256; do
		install -Dm644 \
			"${builddir}/icons/icon-${res}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}.png"
	done

	# create menu shortcut
	cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<-EOF
		[Desktop Entry]
		Type=Application
		Name=Streamlink Twitch GUI
		GenericName=Twitch.tv browser for Streamlink
		Comment=Browse Twitch.tv and watch streams in your videoplayer of choice
		Keywords=streamlink;livestreamer;twitch;
		Categories=AudioVideo;
		Exec=/usr/bin/${_pkgname}
		Icon=${_pkgname}
	EOF

	# copy licenses
	install -Dm644 \
		-t "${pkgdir}/usr/share/licenses/${_pkgname}/" \
		"${srcdir}/${_pkgname}/LICENSE" \
		"${builddir}/credits.html"
}
