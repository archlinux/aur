# Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Co-Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>
# from: snap beta
# what: whatpulse
_snap=iHVATX2faqAJciG5YGNM241W8fE8UvsF
_rev_amd64=12 # snap:revision

pkgname=whatpulse
pkgver=3.7
pkgrel=4

pkgdesc="Measures your keyboard, mouse and application usage, network traffic and uptime."
arch=('x86_64')
url=http://www.whatpulse.org

license=(custom:whatpulse_tos)
depends=(
	qt5-svg
	hicolor-icon-theme
)
makedepends=(
	squashfs-tools
	imagemagick
)
optdepends=(
    'libpcap: for capturing network statistics'
)
source=(
	'whatpulse.desktop'
	'logo.png::https://whatpulse.org/images/assets/whatpulse-logo-solid-black.png'
	LICENSE
)
source_x86_64=("${pkgname%*-bin}-$pkgver.sfs::https://api.snapcraft.io/api/v1/snaps/download/${_snap}_${_rev_amd64}.snap")
sha256sums=('5a4a6676a6b513824eeac8a2accd6de9e8bd2bc11b3e2967fa2b2a18d29fa35d'
            '9c7439b4e66a863fcdcd9dc377d6e88dc45459a66149e552b2a6f814d190a548'
            'cfea47f15bb3ba2494a7b1d50367139dc12709fc1e8ba0b25d86ee5f09748619')
sha256sums_x86_64=('e84c50788c5cf201759fa76ff0d8530959c6fca46fc9022d9d94aea573c76824')

prepare() {
	rm -rf sfs
	unsquashfs -q -i -n -d sfs \
		"${pkgname%*-bin}-$pkgver.sfs" \
		usr/bin/whatpulse
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
				logo.png xc:"#656565" -channel RGB -clut \
				"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/whatpulse.png"
	done
}
