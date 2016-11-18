# Maintainer : Dan McCurry <dan.mccurry at linux dot com>

pkgname=gog-pinball-illusions
# Trim gog- prefix from launcher
_appname=${pkgname##gog-}
pkgver=2.0.0.3
pkgrel=1
pkgdesc="A pinball video game developed as a sequel of Pinball Fantasies and Pinball Dreams in 1995."
arch=('any')
url="http://www.gog.com/game/pinball_gold_pack"
license=("custom")
groups=("games")
source=("local://${pkgname//-/_}_${pkgver}.sh"
	"local://${_appname}")
noextract=("${pkgname//-/_}_${pkgver}.sh")
md5sums=('6727c547f9f26a339b5356006e47d9d7'
         'a0aec1209b2ec37a0f5e9f38ba63be1d')

depends=('dosbox' 'libpng12' 'unionfs-fuse')
optdepends=('gendesk')
PKGEXT=.pkg.tar

prepare() {
	cd ${srcdir}
	
	# Create menu icons
	if which gendesk &>/dev/null; then
		gendesk -f -n --pkgname "${_appname}" \
			--pkgdesc "${pkgdesc}" \
			--name='Pinball Illusions' \
			--exec="/usr/bin/${_appname}" \
			--categories "Application;Game;"
		gendesk -f -n --pkgname "${_appname}-settings" \
			--pkgdesc "Settings for Pinball Illusions" \
			--name='Pinball Illusions Settings' \
			--exec="/usr/bin/${_appname} settings" \
			--categories "Application;Game;"
	else
		warning "gendesk not found!"
		warning "Menu icons not generated."
	fi

	# extract mojo installer and suppress header warning for unzip
	unzip -u "${pkgname//-/_}_${pkgver}.sh" \
		"data/noarch/*" -x "*dosbox/*" "*start.sh*" \
		"*installer_readme.txt*" "*dosbox*.tar.gz" "*gog_com.shlib*" \
		"*xdg-utils/*" "*gameinfo*" || if [ $? -eq 1 ]; then
		msg "Data extraction successful.";
		fi

	for i in "${srcdir}/data/noarch/dosbox*.conf"; do
		sed -i "s/\(mount C \"\)\(data\"\)/\1~\/.gog\/${_appname}\/game\/\2/" $i
	done

	for i in ${srcdir}/*.desktop; do
		sed -i "s/\(Icon=\).*/\1${_appname}/" $i
	done
}

package() {
	mkdir -p "${pkgdir}/opt/gog/${_appname}"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	
	cd ${srcdir}
	cp -r ./data/noarch/* "${pkgdir}"/opt/gog/${_appname}
  	for i in *.desktop; do
		install -Dm644 "$(basename $i)" \
			"${pkgdir}/usr/share/applications/$(basename $i)"
	done

	cd ${srcdir}/data/noarch
	ln -s "/opt/gog/${_appname}/support/icon.png" \
		"${pkgdir}/usr/share/pixmaps/${_appname}.png"
	ln -s "/opt/gog/${_appname}/docs/End User License Agreement.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/EULA"
  	
	install -Dm755 "${srcdir}/${_appname}" \
		"${pkgdir}/usr/bin/${_appname}"
}

