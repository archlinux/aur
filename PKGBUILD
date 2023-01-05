# Maintainer: Sebastian Meyer <mail@bastimeyer.de>

pkgname=streamlink-twitch-gui
pkgver=2.2.0
pkgrel=1
pkgdesc="A multi platform Twitch.tv browser for Streamlink"
arch=("i686" "x86_64")
url="https://github.com/streamlink/streamlink-twitch-gui"
license=("MIT")
depends=("alsa-lib" "gtk3" "libxss" "nss" "streamlink")
makedepends=("nodejs" "yarn")
options=(!strip)

# https://github.com/streamlink/streamlink-twitch-gui/blob/v2.2.0/src/config/main.json#L4
_nwjs=0.68.1
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/streamlink/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
source_i686=("nwjs-${_nwjs}-linux32.tar.gz::https://dl.nwjs.io/v${_nwjs}/nwjs-v${_nwjs}-linux-ia32.tar.gz")
source_x86_64=("nwjs-${_nwjs}-linux64.tar.gz::https://dl.nwjs.io/v${_nwjs}/nwjs-v${_nwjs}-linux-x64.tar.gz")
noextract=("nwjs-${_nwjs}-linux"{32,64}".tar.gz")
sha256sums=('6fc1b22d61a64849001619199dde48dc12f6a4e42e86fa67c876f3d7f61c215b')
# https://dl.nwjs.io/${_nwjs}/SHASUMS256.txt{,.asc}  (1E8BEE8D5B0C4CBCD6D19E2678680FA9E21BB40A - Roger Wang <roger@nwjs.io>)
sha256sums_i686=('ba51fd9ee80c358d6dcf8a3219514a91e2ecdba115f0da1d7a1869038558656d')
sha256sums_x86_64=('338164faa548e1f4d32c24d20cef2c6106ba17eb16825521953696e7fcf2b568')

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
	# temporarily fix broken build-dependencies relying on md4 hashes, which are unsupported on OpenSSL3
	# https://github.com/streamlink/streamlink-twitch-gui/issues/944
	NODE_OPTIONS=--openssl-legacy-provider \
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
