# Maintainer : Dan McCurry <dan.mccurry at linux dot com>

pkgname=gog-duke-nukem-2
# Trim gog- prefix from launcher
_appname=$(echo ${pkgname} | sed -e 's/gog-//')
pkgver=2.0.0.2
pkgrel=1
pkgdesc="In the near future, the evil Rigelatins plan to enslave Earth and they kidnap Duke Nukem to use his brain to plot the attack for their forces."
arch=('any')
url="http://www.gog.com/" # As of this PKGBUILD, Duke Nukem 2 is no longer in store
license=("custom")
groups=("games")
source=("local://gog_duke_nukem_2_${pkgver}.sh"
	"local://${_appname}")
noextract=("gog_duke_nukem_2_${pkgver}.sh")
sha256sums=('191bf306732007a73d66ff18956c59aeecb1692db90f0138738d0fa075d4bf8a'
            '194b36f033582b9f79c6034f67910a8b0b25fad8c1beac695179209d5e9be661')
depends=('dosbox' 'libpng12' 'unionfs-fuse')
optdepends=('gendesk')
PKGEXT=.pkg.tar

prepare() {
	cd ${srcdir}
	
	# Create menu icons
	if which gendesk &>/dev/null; then
		gendesk -f -n --pkgname "${_appname}" \
			--pkgdesc "${pkgdesc}" \
			--name='Duke Nukem II' \
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
