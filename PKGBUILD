# Maintainer: Zosoled <zosoled@codecow.xyz>

_pkgname="ledger-live-desktop"
pkgname="${_pkgname}-appimage"
_appimage="${_pkgname}.AppImage"
pkgver=2.131.1
pkgrel=1
pkgdesc="Desktop companion app for Ledger hardware wallets."
arch=("x86_64")
url="https://www.ledger.com/ledger-live"
license=("MIT")
depends=(
	alsa-lib
	fuse2
	glibc
	gtk3
	hicolor-icon-theme
	nss
	zlib
)
provides=(
	ledger-live-desktop
)
options=(!strip)
noextract=(${_appimage})

source=(
	${_appimage}::https://download.live.ledger.com/${_pkgname}-${pkgver}-linux-${arch[0]}.AppImage
	20-hw1.rules::https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/20-hw1.rules
	LICENSE::https://raw.githubusercontent.com/LedgerHQ/ledger-live/@ledgerhq/live-desktop@${pkgver}/apps/${_pkgname}/LICENSE
)

# AppImage checksum obtained from https://www.ledger.com/ledger-live/lld-signatures
sha512sums=(
	'f65c9afa284f46860367e75a235a2789a747011697a891173df3a4320a33fe46307257c8d110090e694b12b13e47b5202a4b76d3ad86d0e67a4e956e4b5f0b0e'
	'2fee06f9f145e45ac229b86552edeab77f07547c45f29e6e65b08281de071e6ced3102340d66b099c085aea0fef97e70b35e8dbb68bc4ea1ed8e8019b3f0d30a'
	'915edd51fe7732af57f5a4ca8f4c61c4f435de6357e34ed0733cac8d950d80b3a9e513deac0a3672a07f38ff871a57032a221b3aa27edae8e42cc00586fe3318'
)

prepare() {
	cd "${srcdir}"
	chmod +x ${_appimage}
	./${_appimage} --appimage-extract ${_pkgname}.desktop
	./${_appimage} --appimage-extract usr/share/icons
	cd squashfs-root
	sed -i \
		-e "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" \
		-e "s|Categories=Finance;|Categories=Office;Finance;|" \
		"${_pkgname}.desktop"
}

package() {
	cd "${srcdir}"
	install -Dm 755 -t "${pkgdir}"/opt/${pkgname}/ ${_appimage}
	install -Dm 644 -t "${pkgdir}"/etc/udev/rules.d/ 20-hw1.rules
	install -Dm 644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ LICENSE

	install -dm 755 "${pkgdir}"/usr/bin && ln -s /opt/${pkgname}/${_appimage} "${pkgdir}"/usr/bin/${_pkgname}
	cd squashfs-root
	install -Dm 644 -t "${pkgdir}"/usr/share/applications/ ${_pkgname}.desktop
	for i in 128 256 512 1024; do
		install -Dm 644 -t "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/ usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png
	done
}
