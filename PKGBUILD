# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=gog-bit-trip-runner
_appname=$(echo ${pkgname} | sed -e 's/gog-//')
pkgver=2.0.0.1
pkgrel=1
pkgdesc="Race across the Moon, kicking down crystal walls and sliding under chomping moon-slugs!"
arch=('i686' 'x86_64')
url="https://www.gog.com/game/bittrip_runner"
license=('custom:EULA')
groups=('games')
depends=('mesa' 'libvorbis' 'openal' 'sdl')
optdepends=('gendesk: generate menu icons')
provides=("${_appname}")
conflicts=("${_appname}")
source=("local://gog_bit_trip_runner_${pkgver}.sh"
	"local://${_appname}")
noextract=("gog_bit_trip_runner_${pkgver}.sh")
md5sums=('b6f0fe70e1a2d9408967b8fd6bd881e1'
         '55202f3110712a1d792666c6d9784bf6')
PKGEXT=.pkg.tar

# Determine arch and remove unnecessary files
case $CARCH in
	x86_64)	_arch=64;
		_xarch=32;
		;;
	i686)	_arch=32;
		_xarch=64;
		;;
	*)	error "Unknown architecture";
		;;
esac

prepare() {
	cd ${srcdir}
	
	if which gendesk &>/dev/null; then
		gendesk -f -n --pkgname="${_appname}" \
			--pkgdesc="${pkgdesc}" \
			--name="BIT.TRIP RUNNER" \
			--exec="/usr/bin/${_appname}" \
			--categories="Application;Game;"
	else
		warning "gendesk not found!"
		warning "Menu icons not generated!"
	fi

	# extract mojo installer and suppress header warning for unzip
	unzip -o "$(echo ${pkgname} | sed -e 's/-/_/g')_${pkgver}.sh" \
		"data/noarch/*" -x "*installer_readme.txt*" "*xdg-utils*" \
		"*bit.trip.runner-1.0-$_xarch*" "*gameinfo*" "*start.sh*" \
		"*install*" "*gog_com.shlib*" "*.desktop*" "*RUNNER.png*" \
		|| if [ $? -eq 1 ]; then
		msg "Data extraction successful.";
		fi
}

package() {
	cd "${srcdir}/data/noarch"
	mkdir -p "${pkgdir}/opt/gog/${_appname}"
	mkdir -p "${pkgdir}/usr/share/pixmaps"

	cp -R "./game/bit.trip.runner-1.0-$_arch/bit.trip.runner" \
	       "${pkgdir}/opt/gog/${_appname}/data"
	cp -R "./support" "${pkgdir}/opt/gog/${_appname}/support"
	cp "./game/bit.trip.runner-1.0-$_arch/README.html" \
		"${pkgdir}/opt/gog/${_appname}/support/"

	install -Dm755 "${srcdir}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
	install -Dm755 "${srcdir}/${_appname}.desktop" \
		"${pkgdir}/usr/share/applications/${_appname}.desktop"
	install -Dm644 "./docs/End User License Agreement.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/EULA"
	
	ln -s "/opt/gog/${_appname}/support/icon.png" \
		"${pkgdir}/usr/share/pixmaps/${_appname}.png"
}
