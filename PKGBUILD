# Maintainer : Dan McCurry <dan.mccurry at linux dot com>

pkgname=gog-blake-stone-planet-strike
# Trim gog- prefix from launcher
_appname=$(echo ${pkgname} | sed -e 's/gog-//')
pkgver=2.0.0.4
pkgrel=1
pkgdesc="After a five year manhunt for the elusive Dr. Goldfire, the search has ended."
arch=('any')
url="http://www.gog.com/game/blake_stone_planet_strike"
license=("custom:EULA")
groups=("games")
source=("local://gog_blake_stone_planet_strike_${pkgver}.sh"
	"local://${_appname}")
noextract=("gog_blake_stone_planet_strike_${pkgver}.sh")
sha256sums=('d24bad088cda7e5f37c6d394c86f6851f9ac1b394dbd1552d577d08db82bedb8'
            '5126f55cfd14359a3abaecd5287f7d8a6788b06463eaa75bf15979e09ab57c80')
depends=('dosbox' 'libpng12' 'unionfs-fuse')
optdepends=('gendesk: create desktop icons')
PKGEXT=.pkg.tar

prepare() {
	cd ${srcdir}
	
	# Create menu icons
	if which gendesk &>/dev/null; then
		gendesk -f -n --pkgname "${_appname}" \
			--pkgdesc "${pkgdesc}" \
			--name='Blake Stone: Planet Strike' \
			--exec="/usr/bin/${_appname}" \
			--categories "Application;Game;"
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
