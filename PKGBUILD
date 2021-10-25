# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: snap beta
# what: whatpulse

_snap=iHVATX2faqAJciG5YGNM241W8fE8UvsF

pkgname=whatpulse-bin
pkgver=3.5.10
pkgrel=4
pkgdesc="Measures your keyboard, mouse and application usage, network traffic and uptime."
arch=('x86_64')
url=http://www.whatpulse.org
provides=("${pkgname%*-bin}=${pkgver%.*}")
conflicts=("${pkgname%*-bin}")

license=(custom:whatpulse_tos)
depends=(
	qt5-svg
	hicolor-icon-theme
)
makedepends=(squashfs-tools)
optdepends=(
    'libpcap: for capturing network statistics'
)
source=(
	'whatpulse.desktop'
	'assets.zip::https://whatpulse.org/images/assets/whatpulse-assets-all.zip'
	LICENSE
)
source_x86_64=("${pkgname%*-bin}-$pkgver.sfs::https://api.snapcraft.io/api/v1/snaps/download/${_snap}_${pkgver##*.}.snap")
sha256sums=('5a4a6676a6b513824eeac8a2accd6de9e8bd2bc11b3e2967fa2b2a18d29fa35d'
            'bbbc3e1e63e8300f247897c24487ecad6f313c1972417604bf8d991ca4408b03'
            'cfea47f15bb3ba2494a7b1d50367139dc12709fc1e8ba0b25d86ee5f09748619')
sha256sums_x86_64=('ffb8dae8045f6af1ab059e12372130f85455607461d25b25cb2df69366a18623')

prepare() {
	rm -rf sfs icons
	unsquashfs -q -i -n -d sfs \
		"${pkgname%*-bin}-$pkgver.sfs" \
		usr/bin/whatpulse
	mkdir -p icons
}

build() {
	for size in 16 20 22 24 28 32 36 44 48 64 72 96 128 150 192 256 310 384 512 1024;do
		convert \
				+gravity -crop 615x680+0+0 +repage \
				-resize "${size}x${size}" -background none \
				-gravity center -extent "${size}x${size}" \
			whatpulse-logo-color.png \
			"icons/whatpulse-$size.png"
	done
}

package() {
    install -Dm 755 sfs/usr/bin/whatpulse "${pkgdir}/usr/bin/whatpulse"
    install -Dm 644 whatpulse.desktop "${pkgdir}/usr/share/applications/whatpulse.desktop"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	for size in 16 20 22 24 28 32 36 44 48 64 72 96 128 150 192 256 310 384 512 1024;do
		install -Dm 644 "icons/whatpulse-$size.png" \
			"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/whatpulse.png"
	done
}
