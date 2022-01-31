# Maintainer: Sebastian Meyer <mail@bastimeyer.de>

_pkgname=streamlink-twitch-gui
pkgname="${_pkgname}-git"
pkgver=2629.f6e65da1
pkgrel=1
pkgdesc="A multi platform Twitch.tv browser for Streamlink"
arch=("i686" "x86_64")
url="https://github.com/streamlink/streamlink-twitch-gui"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("gtk3" "libxss" "nss" "streamlink")
makedepends=("git" "nodejs" "yarn" "xorg-server-xvfb")
options=(!strip)
source=("${_pkgname}::git+https://github.com/streamlink/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	yarn install --pure-lockfile --non-interactive
}

check() {
	cd "${srcdir}/${_pkgname}"
	xvfb-run --auto-servernum yarn run test
}

build() {
	cd "${srcdir}/${_pkgname}"
	yarn run grunt clean:tmp_prod webpack:prod compile
}

package() {
	# the dir of the built application
	builddir="${srcdir}/${_pkgname}/build/releases/${_pkgname}/$(echo ${CARCH} | sed -e 's/x86_64/linux64/' -e 's/i686/linux32/')"

	# set up package directories
	install -d \
		"${pkgdir}/opt/${_pkgname}/" \
		"${pkgdir}/usr/bin/" \
		"${pkgdir}/usr/share/applications/"

	# copy licenses
	install -Dm644 \
		-t "${pkgdir}/usr/share/licenses/${pkgname}/" \
		"${builddir}/LICENSE.txt" \
		"${builddir}/credits.html"

	# copy appstream metainfo
	install -Dm644 \
		-t "${pkgdir}/usr/share/metainfo/" \
		"${builddir}/${_pkgname}.appdata.xml"

	# copy application content and remove unneeded files and dirs
	cp -a "${builddir}/." "${pkgdir}/opt/${_pkgname}/"
	rm -r "${pkgdir}/opt/${_pkgname}/"{{add,remove}-menuitem.sh,LICENSE.txt,credits.html,"${_pkgname}.appdata.xml",icons/}

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
		Keywords=streamlink;twitch;streaming;
		Categories=AudioVideo;Network;
		StartupWMClass=streamlink-twitch-gui
		Exec=/usr/bin/${_pkgname}
		Icon=${_pkgname}
	EOF
}
