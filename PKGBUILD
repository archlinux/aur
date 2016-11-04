# Maintainer : Dan McCurry <dan.mccurry at linux dot com>
# Contributor : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-beneath-a-steel-sky
# Trim gog- prefix from launcher
_appname=$(echo ${pkgname} | sed -e 's/gog-//')
pkgver=2.1.0.4
pkgrel=1
pkgdesc="All man's social problems are coming to a boil. Under the claustrophobic lid of a steel sky. "
arch=("i686" "x86_64")
url="http://www.gog.com/game/beneath_a_steel_sky"
license=("custom:EULA custom:scummvm")
groups=("games")
source=("local://gog_beneath_a_steel_sky_${pkgver}.sh"
	"local://${_appname}")
sha256sums=('1cd6c487b1f2f151874183aabb49026cb652faf33c1b326ea0edb1878eabadfb'
            '71c9b6d850c92c637cd44a502de8db01498e88af9829125f7fb9097b4575d60b')
depends=(freetype2 unionfs-fuse)
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
			--name='Beneath a Steel Sky' \
			--exec="/usr/bin/${_appname}" \
			--categories "Application;Game;"
	else
		warning "gendesk not found!"
		warning "Menu icons not generated."
	fi

	# extract mojo installer and suppress header warning for unzip
	unzip "$(echo ${pkgname} | sed -e 's/-/_/g')_${pkgver}.sh" \
		"data/noarch/*" -x "*${_xarch}*" || if [ $? -eq 1 ]; then
		msg "Data extraction successful.";
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
	ln -s "/opt/gog/${_appname}/docs/scummvm" \
		"${pkgdir}/usr/share/licenses/${pkgname}/scummvm"
  	
	install -Dm755 "${srcdir}/${_appname}" \
		"${pkgdir}/usr/bin/${_appname}"
}
