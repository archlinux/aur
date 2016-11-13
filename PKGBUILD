# Maintainer : Dan McCurry <dan.mccurry at linux dot com>
# Contributor : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-rise-of-the-triad-dark-war
# Trim gog- prefix from launcher
_appname=$(echo ${pkgname} | sed -n 's/gog-//p')
pkgver=2.0.0.8
pkgrel=4
pkgdesc="Old-school first person shooter with an arcade feel."
arch=('any')
url="http://www.gog.com/game/rise_of_the_triad__dark_war"
license=("custom")
groups=("games")
source=("local://gog_rise_of_the_triad_dark_war_${pkgver}.sh"
	"local://${_appname}")
sha256sums=('673c519bb35aefd69360ba989ee79faa1ae896e4655c3f96cb26a03f2562ec61'
            'd4df54d00db91d92c1f9a633cc28909c48161aac69e6a55a54abfb36a97057f8')
noextract=("gog_rise_of_the_triad_dark_war_${pkgver}.sh")
depends=('dosbox' 'libpng12' 'unionfs-fuse')
optdepends=('gendesk: generate menu icons')
PKGEXT=.pkg.tar

prepare() {
	cd ${srcdir}
	
	# Create menu icons
	if which gendesk &>/dev/null; then
		gendesk -f -n --pkgname "${_appname}" \
			--pkgdesc "${pkgdesc}" \
			--name="Rise of the Triad" \
			--exec="/usr/bin/${_appname}" \
			--categories "Application;Game;"
		gendesk -f -n --pkgname "${_appname}_server" \
			--pkgdesc "Multiplayer server for ROTT Dark War" \
			--name="Rise of the Triad (Server)" \
			--exec="/usr/bin/${_appname} server" \
			--categories "Application;Game;"
		gendesk -f -n --pkgname "${_appname}_client" \
			--pkgdesc "Connect to ROTT Dark War server" \
			--name="Rise of the Triad (Client)" \
			--exec="/usr/bin/${_appname} client" \
			--categories "Application;Game;"
		gendesk -f -n --pkgname "${_appname}_settings" \
			--pkgdesc "Configure ROTT Dark War" \
			--name="Rise of the Triad (Settings)" \
			--exec="/usr/bin/${_appname} settings" \
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
	
	# Extract MORELVLS.ZIP to data directory
	unzip -o ${srcdir}/data/noarch/data/MORELVLS.ZIP \
		-d ${srcdir}/data/noarch/data/ &&
		rm ${srcdir}/data/noarch/data/MORELVLS.ZIP
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
