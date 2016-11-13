# Maintainer : Dan McCurry <dan.mccurry at linux dot com>

pkgname=gog-terra-nova-strike-force-centauri
# Trim gog- prefix from launcher
_appname=$(echo ${pkgname} | sed -n 's/gog-//p')
pkgver=2.0.0.2
pkgrel=1
pkgdesc="A tactical first-person shooter video game set in the 24th century."
arch=('any')
url="http://www.gog.com/game/terra_nova_strike_force_centauri"
license=("custom")
groups=("games")
source=("local://gog_terra_nova_strike_force_centauri_${pkgver}.sh"
	"local://${_appname}")
sha256sums=('ab86b7042aeaed7d44e4bde1a0bc1dda9a08fc2d086a8453ddc6efc76c89dd67'
            'dc2af1dcdf014ee2412b35759aee999e85f9c0efd2bb3300951b6998aac66cc8')
noextract=("gog_terra_nova_strike_force_centauri_${pkgver}.sh")
depends=('dosbox' 'libpng12' 'unionfs-fuse')
optdepends=('gendesk: generate menu icons')
PKGEXT=.pkg.tar

prepare() {
	cd ${srcdir}
	
	# Create menu icons
	if which gendesk &>/dev/null; then
		gendesk -f -n --pkgname "${_appname}" \
			--pkgdesc "${pkgdesc}" \
			--name="Terra Nova: Strike Force Centauri" \
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
		sed -i "s/\(imgmount D \"\)\(data.*\)/\1~\/.gog\/${_appname}\/game\/\2/" $i
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
