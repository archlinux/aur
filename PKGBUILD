# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Understated cursor theme'
pkgbase=xcursor-cz-viator
pkgname=(xcursor-cz-viator-{hourglass,ring,rotor,windmill}-{white,black} xcursor-cz-hickson)
pkgver=20220613
pkgrel=1
_commit=99ddf571428b51b6985c364e0b17e9d94263c746
license=(GPL3)
url=https://github.com/charakterziffer/cursor-toolbox
arch=(any)
makedepends=(git inkscape xorg-xcursorgen python patch)
depends=()
source=("${pkgbase}::git+${url}#commit=${_commit}" build.patch py3.patch)
sha512sums=('SKIP'
            'c2b8792e0a9afd639864608dc674acbc1a368d9a83cd46dd3422403961af2b001c3eb004269eb701fcd34f4cfceaca5912a751a6ecd68ad08901ec94e0afb972'
            'e61eedf83f08534eec71a2418aedc58e887069aa6c532d90b39409da7ef8bb60492616a919dddfc10aac901edf4fb6d7a816c14b621ee566e6f056b6fbb7776c')

prepare () {
	cd "${pkgbase}"
	patch -p1 < "${srcdir}/build.patch"
	patch -p0 < "${srcdir}/py3.patch"
}

build () {
	cd "${pkgbase}"
	local spinner color suffix

	for color in white black ; do
		if [[ ${color} = white ]] ; then
			suffix=''
		else
			suffix='-black'
		fi

		msg2 "Rendering color variant: ${color}"
		python render-pngs.py "svgs/template${suffix}.svg"

		for spinner in hourglass ring rotor windmill ; do
			msg2 "Rendering variant: ${spinner} ${color}"
			python render-pngs.py "svgs/spinner-${spinner}${suffix}.svg"

			themetitle="cz-Viator-${spinner}-${color}" ./make.sh
		done
	done

	msg2 "Rendering variant: Hickson"
	python render-pngs.py "more-themes/cz-Hickson/cz-Hickson.svg"
	themetitle="cz-Hickson" ./make.sh
}

_package () {
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -a "${pkgbase}/$1" "${pkgdir}/usr/share/icons/"
}

_package_viator_variant () {
	_package "cz-Viator-$1-$2"
}

package_xcursor-cz-viator-hourglass-white () {
	pkgdesc="${pkgdesc} - white, hourglass wait icon"
	_package_viator_variant hourglass white
}

package_xcursor-cz-viator-hourglass-black () {
	pkgdesc="${pkgdesc} - black, hourglass wait icon"
	_package_viator_variant hourglass black
}

package_xcursor-cz-viator-ring-white () {
	pkgdesc="${pkgdesc} - white, ring wait icon"
	_package_viator_variant ring white
}

package_xcursor-cz-viator-ring-black () {
	pkgdesc="${pkgdesc} - black, ring wait icon"
	_package_viator_variant ring black
}

package_xcursor-cz-viator-rotor-white () {
	pkgdesc="${pkgdesc} - white, rotor wait icon"
	_package_viator_variant rotor white
}

package_xcursor-cz-viator-rotor-black () {
	pkgdesc="${pkgdesc} - black, rotor wait icon"
	_package_viator_variant rotor black
}

package_xcursor-cz-viator-windmill-white () {
	pkgdesc="${pkgdesc} - white, windmill wait icon"
	_package_viator_variant windmill white
}

package_xcursor-cz-viator-windmill-black () {
	pkgdesc="${pkgdesc} - black, windmill wait icon"
	_package_viator_variant windmill black
}

package_xcursor-cz-hickson () {
	pkgdesc="${pkgdesc} - brownish"
	_package cz-Hickson
}
