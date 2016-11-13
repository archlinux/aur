# Maintainer : Dan McCurry <dan.mccurry at linux dot com>

pkgname=gog-blood-one-unit-whole-blood
# Trim gog- prefix from launcher
_appname=$(echo ${pkgname} | sed -e 's/gog-//')
pkgver=2.0.0.6
pkgrel=1
pkgdesc="You carved your soul to shreds in servitude to a dark god, but false promises and betrayal were your only reward."
arch=('any')
url="http://www.gog.com/game/one_unit_whole_blood"
license=("custom:EULA")
groups=("games")
source=("local://gog_blood_one_unit_whole_blood_${pkgver}.sh"
	"local://${_appname}")
noextract=("gog_blood_one_unit_whole_blood_${pkgver}.sh")
sha256sums=('01a160ea8dd21f6f2084cf6f181ac05fecbd9a7db1bd3c77df054d8b24c4752b'
            '31d422242e50de14c2372763f5f3aa0159efa2c47cb01ab3173b86030c18b855')
depends=('dosbox' 'libpng12' 'unionfs-fuse')
optdepends=('gendesk')
PKGEXT=.pkg.tar

prepare() {
	cd ${srcdir}
	
	# Create menu icons
	if which gendesk &>/dev/null; then
		gendesk -f -n --pkgname "${_appname}" \
			--pkgdesc "${pkgdesc}" \
			--name='Blood: One Unit Whole Blood' \
			--exec="/usr/bin/${_appname}" \
			--categories "Application;Game;"
		gendesk -f -n --pkgname "${_appname}_server" \
			--pkgdesc "Multiplayer server for Blood" \
			--name="Blood: One Unit Whole Blood (Server)" \
			--exec="/usr/bin/${_appname} server" \
			--categories "Application;Game;"
		gendesk -f -n --pkgname "${_appname}_client" \
			--pkgdesc "Connect to Blood server" \
			--name="Blood: One Unit Whole Blood (Client)" \
			--exec="/usr/bin/${_appname} client" \
			--categories "Application;Game;"
		gendesk -f -n --pkgname "${_appname}_settings" \
			--pkgdesc "Configure Blood" \
			--name="Blood: One Unit Whole Blood (Settings)" \
			--exec="/usr/bin/${_appname} settings" \
			--categories "Application;Game;"
		gendesk -f -n --pkgname "${_appname}_addon" \
			--pkgdesc "Blood addon Cryptic Passage" \
			--name="Blood: Cryptic Passage" \
			--exec="/usr/bin/${_appname} addon" \
			--categories "Application;Game;"
		sed -i "s/\(Icon=\).*/\1${_appname}/" *.desktop
	else
		warning "gendesk not found!"
		warning "Menu icons not generated."
	fi

	# extract mojo installer and suppress header warning for unzip
	unzip -o "$(echo ${pkgname} | sed -e 's/-/_/g')_${pkgver}.sh" \
		"data/noarch/*" -x "*dosbox/*" "*start.sh*" \
		"*installer_readme.txt*" "*dosbox*.tar.gz" "*gog_com.shlib*" \
		"*xdg-utils/*" "*gameinfo*" || if [ $? -eq 1 ]; then
		msg "Data extraction successful.";
		fi

	for i in "${srcdir}/data/noarch/dosbox*.conf"; do
		sed -i "s/\(mount C \"\)\(data\"\)/\1~\/.gog\/${_appname}\/game\/\2/" $i
	done
}

package() {
	mkdir -p "${pkgdir}/opt/gog/${_appname}"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	
	cd ${srcdir}
	cp -r ./data/noarch/* "${pkgdir}"/opt/gog/${_appname}

	for i in *.desktop; do
		install -Dm644 "$i" \
		"${pkgdir}/usr/share/applications/$i"
	done

	cd ${srcdir}/data/noarch
	ln -s "/opt/gog/${_appname}/support/icon.png" \
		"${pkgdir}/usr/share/pixmaps/${_appname}.png"
	ln -s "/opt/gog/${_appname}/docs/End User License Agreement.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/EULA"
  	
	install -Dm755 "${srcdir}/${_appname}" \
		"${pkgdir}/usr/bin/${_appname}"
}
