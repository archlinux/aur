# Maintainer : Dan McCurry <dan.mccurry at linux dot com>
# Contributor : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-beneath-a-steel-sky
# Trim gog- prefix from launcher
_appname=$(echo ${pkgname} | sed -e 's/gog-//')
pkgver=2.1.0.4
pkgrel=2
pkgdesc="All man's social problems are coming to a boil. Under the claustrophobic lid of a steel sky. "
arch=('any')
url="http://www.gog.com/game/beneath_a_steel_sky"
license=("custom:EULA")
groups=("games")
source=("local://gog_beneath_a_steel_sky_${pkgver}.sh"
	"local://${_appname}")
noextract=("gog_beneath_a_steel_sky_${pkgver}.sh")
sha256sums=('1cd6c487b1f2f151874183aabb49026cb652faf33c1b326ea0edb1878eabadfb'
            'e02ba961a2fe793a4c09f68e32a72fdd58750acc32e688adf63e1c6f075f42a4')
depends=('libmpeg2' 'zlib' 'libjpeg-turbo' 'scummvm' 'unionfs-fuse')
optdepends=('gendesk')
PKGEXT=.pkg.tar

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
	unzip -o "$(echo ${pkgname} | sed -e 's/-/_/g')_${pkgver}.sh" \
		"data/noarch/*" -x "*scummvm/*" "*start.sh*" \
		"*installer_readme.txt*" "*gog_com.shlib*" \
		"*xdg-utils/*" "*gameinfo*" || if [ $? -eq 1 ]; then
		msg "Data extraction successful.";
		fi

	# Edit config file for appropriate paths
	sed -i "s/\(.*=\)\(data\)/\1~\/.gog\/${_appname}\/game\/\2/" data/noarch/beneath.ini
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
