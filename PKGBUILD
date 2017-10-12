# Maintainer : Dan McCurry <dan.mc at protonmail dot com>

pkgname=gog-i-have-no-mouth-and-i-must-scream
pkgver=2.0.0.4
pkgrel=1
pkgdesc="The last people on Earth are buried deep within the center of the earth, trapped in the bowels of an insane computer for the past hundred and nine years."
arch=('any')
url="http://www.gog.com/game/i_have_no_mouth_and_i_must_scream"
license=("custom:EULA")
groups=("games")
source=("local://${pkgname//-/_}_${pkgver}.sh"
	"local://${pkgname##gog-}"
	"local://${pkgname}.desktop")
noextract=("gog_i_have_no_mouth_and_i_must_scream_${pkgver}.sh")
sha256sums=('32e672d34446b004004ae5e149e5d12ebc8de40e994dab19d3c9ebb976763b2e'
            'bad88b61fa0b41b1f016031985ac0953f59a208e3b1bdde3fd66e567ba32b0f9'
            '202d76e6435f923bd48228022be4a6764c02c36b2d1c3dce4d9572f1a7dbf547')
depends=('dosbox' 'libpng12' 'unionfs-fuse')
PKGEXT=.pkg.tar

prepare() {
	cd ${srcdir}
	
	# extract mojo installer and suppress header warning for unzip
	bsdtar -xvf "${pkgname//-/_}_${pkgver}.sh" \
		"data/noarch/data/*" \
		"data/noarch/dosbox*.conf" \
		"data/noarch/support/*" \
		"data/noarch/docs/*"

	for i in "${srcdir}/data/noarch/dosbox*.conf"; do
		sed -i "s/\(mount C \"\)\(data\"\)/\1~\/.gog\/${pkgname##gog-}\/game\/\2/" $i
	done
}

package() {
	mkdir -p "${pkgdir}/opt/gog/${pkgname##gog-}"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	
	cd ${srcdir}
	cp -r ./data/noarch/* "${pkgdir}"/opt/gog/${pkgname##gog-}
  	install -Dm644 "./${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"

	cd ${srcdir}/data/noarch
	ln -s "/opt/gog/${pkgname##gog-}/support/icon.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	ln -s "/opt/gog/${pkgname##gog-}/docs/End User License Agreement.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/EULA"
  	
	install -Dm755 "${srcdir}/${pkgname##gog-}" \
		"${pkgdir}/usr/bin/${pkgname##gog-}"
}
