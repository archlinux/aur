# Maintainer : Dan McCurry <dan.mccurry at linux dot com>
# Contributor : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-akalabeth-world-of-doom
# Trim gog- prefix from launcher
_appname=$(echo ${pkgname} | sed -e 's/gog-//')
pkgver=2.0.0.3
pkgrel=1
pkgdesc="Developed in 1979, Akalabeth is the first game made by the legendary creator of the Ultima Series, Richard Garriot."
arch=("i686" "x86_64")
url="http://www.gog.com/game/akalabeth_world_of_doom"
license=("custom:EULA")
groups=("games")
source=("local://gog_akalabeth_world_of_doom_${pkgver}.sh"
	"local://${_appname}")
sha256sums=('9b9af009e23423f386b231f3c9ad916b527c217f61631e42d4e81274bf1a30e1'
            '82a7e41037840fdecefcc35633ec7422a68fa2b21be606359f7afd2f90b995fd')
depends=(libpng12 unionfs-fuse)
optdepends=('gendesk')
PKGEXT=.pkg.tar 

# Exclude unneeded architecture
case $CARCH in
	x86_64)	_xarch=i686;
		;;
	i686)	_xarch=x86_64;
		;;
	*)	warning "Unsupported architecture: ${CARCH}"
		;;
esac

prepare() {
	cd ${srcdir}
	
	# Create menu icons
	if which gendesk &>/dev/null; then
		gendesk -f -n --pkgname "${_appname}" \
			--pkgdesc "${pkgdesc}" \
			--name='Akalabeth: World of Doom' \
			--exec="/usr/bin/${_appname}" \
			--categories "Application;Game;"
	else
		warning "gendesk not found!"
		warning "Menu icons not generated."
	fi
}

package() {
	mkdir -p "${pkgdir}/opt/gog/${_appname}"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	
	cd ${srcdir}
	cp -r ./data/noarch/* "${pkgdir}"/opt/gog/${_appname}
  	install -Dm644 "./${_appname}.desktop" \
		"${pkgdir}/usr/share/applications/${_appname}.desktop"

	cd ${srcdir}/data/noarch
	ln -s "/opt/gog/${_appname}/support/icon.png" \
		"${pkgdir}/usr/share/pixmaps/${_appname}.png"
	ln -s "/opt/gog/${_appname}/docs/End User License Agreement.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/EULA"
  	
	install -Dm755 "${srcdir}/${_appname}" \
		"${pkgdir}/usr/bin/${_appname}"
}
