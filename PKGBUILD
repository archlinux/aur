# Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Co-Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>
_tag=latest
pkgname=whatpulse
pkgver=5.3
pkgrel=1

pkgdesc="Measures your keyboard, mouse and application usage, network traffic and uptime."
arch=('x86_64')
url=http://www.whatpulse.org

license=(custom:whatpulse_tos)
depends=(
	qt6-svg
	qt6-charts
	qt6-5compat
	hicolor-icon-theme
)
makedepends=(
	imagemagick
	patchelf
)
optdepends=(
    'libpcap: for capturing network statistics'
)
source=(
	'whatpulse.desktop'
	LICENSE
)
source_x86_64=("${pkgname}-${pkgver}-amd64.AppImage::https://d2bz2twqkobp4d.cloudfront.net/${_tag:-$pkgver}/linux/whatpulse-linux-${_tag:-$pkgver}_amd64.AppImage")
sha256sums=('5a4a6676a6b513824eeac8a2accd6de9e8bd2bc11b3e2967fa2b2a18d29fa35d'
            'cfea47f15bb3ba2494a7b1d50367139dc12709fc1e8ba0b25d86ee5f09748619')
sha256sums_x86_64=('80e11e721c447f8d5137905a371a51ea5b21e9e55d2f5e0c00e48be28c0b2f87')

_extract() {
	./"${pkgname}-${pkgver}-amd64.AppImage" --appimage-extract "$1"
}

prepare() {
	chmod +x "${pkgname}-${pkgver}-amd64.AppImage"
	_extract usr/bin/whatpulse
	_extract 'whatpulse.png'
	_extract 'usr/share/icons/hicolor/512x512/apps/whatpulse.png'
	ln -sf squashfs-root sfs
	patchelf --remove-rpath sfs/usr/bin/whatpulse
}

package() {
    install -Dm 755 sfs/usr/bin/whatpulse   "${pkgdir}/usr/bin/whatpulse"
    install -Dm 644 whatpulse.desktop       "${pkgdir}/usr/share/applications/whatpulse.desktop"
	install -Dm 644 LICENSE                 "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    # Set capabilities so that whatpulse can monitor network traffic
    setcap    cap_net_raw,cap_net_admin=eip "${pkgdir}/usr/bin/whatpulse"

	# Generate and install icons
	for size in 16 20 22 24 28 32 36 44 48 64 72 96 128 150 192 256 310 384 512 1024
	do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
		convert \
				+gravity -crop 615x680+0+0 +repage \
				-resize "${size}x${size}" -background none \
				-gravity center -extent "${size}x${size}" \
				sfs//whatpulse.png xc:"#656565" -channel RGB -clut \
				"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/whatpulse.png"
	done
}
