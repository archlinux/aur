# Maintainer : Dan McCurry <dan.mccurry at linux dot com>

pkgname=gog-blake-stone-aliens-of-gold
# Trim gog- prefix from launcher
_appname=$(echo ${pkgname} | sed -e 's/gog-//')
pkgver=2.0.0.5
pkgrel=1
pkgdesc="A classic shooter created using the Wolfenstein 3D engine."
arch=('any')
url="http://www.gog.com/game/blake_stone_aliens_of_gold"
license=("custom:EULA")
groups=("games")
source=("local://gog_blake_stone_aliens_of_gold_${pkgver}.sh"
	"local://${_appname}")
noextract=("gog_blake_stone_aliens_of_gold_${pkgver}.sh")
sha256sums=('071315964031011fb327ce48c1200023d063234bbefa2378b354047177587394'
            '7439c7f727822cedab0011ba5ba37c0b532b9d4a325d35d297b97c9adc9acedd')
depends=('dosbox' 'libpng12' 'unionfs-fuse')
optdepends=('gendesk: create desktop icons')
PKGEXT=.pkg.tar

prepare() {
	cd ${srcdir}
	
	# Create menu icons
	if which gendesk &>/dev/null; then
		gendesk -f -n --pkgname "${_appname}" \
			--pkgdesc "${pkgdesc}" \
			--name='Blake Stone: Aliens of Gold' \
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
