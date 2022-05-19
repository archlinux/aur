# Maintainer: Sebastian Meyer <mail@bastimeyer.de>

pkgname=streamlink-twitch-gui
pkgver=2.1.0
pkgrel=1
pkgdesc="A multi platform Twitch.tv browser for Streamlink"
arch=("i686" "x86_64")
url="https://github.com/streamlink/streamlink-twitch-gui"
license=("MIT")
depends=("gtk3" "libxss" "nss" "streamlink")
makedepends=("nodejs" "yarn")
options=(!strip)

# https://github.com/streamlink/streamlink-twitch-gui/blob/v2.1.0/src/config/main.json#L4
_nwjs=0.64.1
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/streamlink/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
source_i686=("nwjs-${_nwjs}-linux32.tar.gz::https://dl.nwjs.io/v${_nwjs}/nwjs-v${_nwjs}-linux-ia32.tar.gz")
source_x86_64=("nwjs-${_nwjs}-linux64.tar.gz::https://dl.nwjs.io/v${_nwjs}/nwjs-v${_nwjs}-linux-x64.tar.gz")
noextract=("nwjs-${_nwjs}-linux"{32,64}".tar.gz")
sha256sums=('ac8f1f616c2e375ca385478d1894104069f1fae0729735fa8d6c5a2280534a2b')
# https://dl.nwjs.io/${_nwjs}/SHASUMS256.txt{,.asc}  (1E8BEE8D5B0C4CBCD6D19E2678680FA9E21BB40A - Roger Wang <roger@nwjs.io>)
sha256sums_i686=('794e2f86ffaca86b7515afd829e58764189451a31e033bac3cfd3179a66b7632')
sha256sums_x86_64=('69de613a1310bbc502b1f63a326908b156ec41df6764223175298819e7b0cd57')

[[ "${CARCH}" == "x86_64" ]] && _arch=linux64 || _arch=linux32

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# extract NW.js to the build/cache directory for nwjs-builder
	mkdir -p "./build/cache/${_nwjs}-normal/${_arch}"
	bsdtar -x --strip-components=1 \
		-C "./build/cache/${_nwjs}-normal/${_arch}" \
		-f "${srcdir}/nwjs-${_nwjs}-${_arch}.tar.gz"

	# install NodeJS dependencies
	yarn install --pure-lockfile
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	yarn run grunt clean:tmp_prod webpack:prod "compile:${_arch}"
}

package() {
	# the dir of the built application
	cd "${srcdir}/${pkgname}-${pkgver}/build/releases/${pkgname}/${_arch}"

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
	cp -a ./ "${pkgdir}/opt/${pkgname}/"
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
		StartupWMClass=streamlink-twitch-gui
		Exec=/usr/bin/${pkgname}
		Icon=${pkgname}
	EOF
}
