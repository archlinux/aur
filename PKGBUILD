# Maintainer: Zosoled <zosoled@codecow.xyz>

_pkgname="ledger-live-desktop"
pkgname="${_pkgname}-appimage"
_appimage="${_pkgname}.AppImage"
pkgver=2.81.2
pkgrel=1
pkgdesc="Desktop companion app for Ledger hardware wallets."

arch=("x86_64")
url="https://www.ledger.com/ledger-live"
license=("MIT")
depends=("glibc" "hicolor-icon-theme" "zlib")
provides=("ledger-live" "ledger-live-desktop")
options=(!strip)

source=(
	${_appimage}::https://download.live.ledger.com/${_pkgname}-${pkgver}-linux-${arch[0]}.AppImage
	20-hw1.rules::https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/20-hw1.rules
	LICENSE::https://raw.githubusercontent.com/LedgerHQ/ledger-live/@ledgerhq/live-desktop@${pkgver}/apps/${_pkgname}/LICENSE
)

# AppImage checksum obtained from https://www.ledger.com/ledger-live/lld-signatures
sha512sums=(
	'96ae1d30d89334b71ffb785c0f25179e6f66faed99eebcf13726dcd2481b976043788539820effb9152fb857793eef96c7618e3024496b5084e1e8ac5398a0e9'
	'2fee06f9f145e45ac229b86552edeab77f07547c45f29e6e65b08281de071e6ced3102340d66b099c085aea0fef97e70b35e8dbb68bc4ea1ed8e8019b3f0d30a'
	'915edd51fe7732af57f5a4ca8f4c61c4f435de6357e34ed0733cac8d950d80b3a9e513deac0a3672a07f38ff871a57032a221b3aa27edae8e42cc00586fe3318'
)

prepare() {
	cd ${srcdir}
	chmod +x ${_appimage}
	./${_appimage} --appimage-extract ${_pkgname}.desktop
	./${_appimage} --appimage-extract usr/share/icons
	cd squashfs-root
	sed -i -e "s/AppRun --no-sandbox/\/opt\/${pkgname}\/${_appimage}/" -e "s/Categories=Finance;/Categories=Office;Finance;/" "${_pkgname}.desktop"
}

package() {
	cd ${srcdir}
	install -Dm 755 -t ${pkgdir}/opt/${pkgname}/ ${_appimage}
	install -Dm 644 -t ${pkgdir}/etc/udev/rules.d/ 20-hw1.rules
	install -Dm 644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ LICENSE

	cd squashfs-root
	install -Dm 644 -t ${pkgdir}/usr/share/applications/ ${_pkgname}.desktop
	for i in 128 256 512 1024; do
		install -Dm 644 -t ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/ usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png
	done
}
