# Maintainer : Dan McCurry <dan.mccurry at linux dot com>

pkgname=gog-bio-menace
# Trim gog- prefix from launcher
_appname=$(echo ${pkgname} | sed -e 's/gog-//')
pkgver=2.0.0.2
pkgrel=1
pkgdesc="Join top CIA tough guy, Snake Logan as he battles for his life against ferocious monsters created by an evil and twisted mastermind."
arch=("i686" "x86_64")
url="http://www.gog.com/game/bio_menace"
license=("custom")
groups=("games")
source=("local://gog_bio_menace_${pkgver}.sh"
	"local://${_appname}")
noextract=("gog_bio_menace_${pkgver}.sh")
sha256sums=('859c0bc36228f60ce4579ce4616dcba1fce56a511d1c594e7eb3ce7c4c6a1091'
            'c2d2e0417ff493e619d70dfc37227e1c131be4158a5f0aacbe4fd712146a7679')
depends=(unionfs-fuse)
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
			--name='Bio Menace' \
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
  	
	install -Dm755 "${srcdir}/${_appname}" \
		"${pkgdir}/usr/bin/${_appname}"
}
