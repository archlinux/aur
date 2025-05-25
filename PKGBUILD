# Maintainer: bemxio <bemxiov at protonmail dot com>
# Contributor: Caltlgin Stsodaat <contact at fossdaily dot xyz>
# Contributor: Yamada Hayao <shun819.mail at gmail dot com>

_pkgname="uno-calculator"
pkgname="${_pkgname}-bin"

_pkgdesc="Windows Calculator ported to Linux by Uno Platform"
pkgdesc="${_pkgdesc} (extracted from Snap package)"

pkgver=1.2.9_uno.339
pkgrel=3

arch=(x86_64)

url="https://platform.uno/${_pkgname}"
license=(Apache-2.0)

#depends=()
makedepends=(curl jq squashfs-tools gendesk)

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

_snap_info=$(curl -sL "https://search.apps.ubuntu.com/api/v1/package/${_pkgname}")

source=("${_pkgname}.snap::$(echo ${_snap_info} | jq -r .download_url)" "${_pkgname}")
sha512sums=("$(echo ${_snap_info} | jq -r .download_sha512)" 6e364ba1505dc5211a49d36534f498eadadd75f8ecbd8e6ade8aed9e06fd9afdbe54c2e4b3a632fe109b46546c084b5aef44e4e938ad281a2a261f190c92ac48)

pkgver() {
	# get the version from the Snapcraft API
	echo "${_snap_info}" | jq -r .version | sed "s/-/_/"
}

prepare() {
	# extract the Snap package
	unsquashfs -force -info "${_pkgname}.snap"

	# generate a .desktop file
	gendesk -f -n \
		--pkgname "Uno Calculator" \
		--pkgdesc "${_pkgdesc}" \
		--exec "${_pkgname}" \
		--icon "${_pkgname}.png" \
		--categories 'Utility;Calculator'
}

package() {
	# move to the extracted directory
	cd squashfs-root

	# copy the files to the package directory
	find . -type f -exec install -D {} "${pkgdir}/opt/${_pkgname}/{}" \;

	# copy the icon and the generated .desktop file
	install -Dm644 meta/gui/icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "../Uno Calculator.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# copy the executable script
	install -Dm755 "../${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}