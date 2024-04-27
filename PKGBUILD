# Maintainer: bemxio <bemxiov at protonmail dot com>
# Contributor: Caltlgin Stsodaat <contact at fossdaily dot xyz>
# Contributor: Yamada Hayao <shun819.mail at gmail dot com>

pkgname=uno-calculator-bin

_pkgdesc="Windows Calculator ported to Linux by Uno Platform"
pkgdesc="${_pkgdesc} (extracted from Snap package)"

pkgver=1.2.9_uno.339
pkgrel=2

arch=(x86_64)

url="https://platform.uno/uno-calculator/"
license=("Apache-2.0")

depends=()
makedepends=(curl jq squashfs-tools gendesk)

provides=(uno-calculator)
conflicts=(uno-calculator uno-calculator-git)

_snap_info=$(curl -sL https://search.apps.ubuntu.com/api/v1/package/uno-calculator)

source=("uno-calculator.snap::$(echo ${_snap_info} | jq -r .download_url)" "uno-calculator")
sha512sums=("$(echo ${_snap_info} | jq -r .download_sha512)" "6e364ba1505dc5211a49d36534f498eadadd75f8ecbd8e6ade8aed9e06fd9afdbe54c2e4b3a632fe109b46546c084b5aef44e4e938ad281a2a261f190c92ac48")

pkgver() {
	# get the version from the Snapcraft API
	echo ${_snap_info} | jq -r .version | sed "s/-/_/"
}

prepare() {
	# extract the Snap package
	unsquashfs -force -info uno-calculator.snap

	# generate a .desktop file
	gendesk -f -n \
		--pkgname "Uno Calculator" \
		--pkgdesc "${_pkgdesc}" \
		--exec uno-calculator \
		--icon uno-calculator.png \
		--categories "Utility;Calculator"
}

package() {
	# move to the extracted directory
	cd squashfs-root

	# copy the files to the package directory
	find . -type f -exec install -D {} "${pkgdir}/opt/uno-calculator/{}" \;

	# copy the icon and the generated .desktop file
	install -Dm644 meta/gui/icon.png "${pkgdir}/usr/share/pixmaps/uno-calculator.png"
	install -Dm644 "../Uno Calculator.desktop" "${pkgdir}/usr/share/applications/uno-calculator.desktop"

	# copy the executable script
	install -Dm755 ../uno-calculator "${pkgdir}/usr/bin/uno-calculator"
}